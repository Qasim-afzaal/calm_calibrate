#!/usr/bin/env python3
"""Migrate AppColors.* to context.appColors (c.*) for dark mode support."""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "lib"

TOKEN_REPLACEMENTS = [
    ("AppColors.background", "c.background"),
    ("AppColors.surface", "c.surface"),
    ("AppColors.primaryLight", "c.primaryLight"),
    ("AppColors.textPrimary", "c.textPrimary"),
    ("AppColors.textSecondary", "c.textSecondary"),
    ("AppColors.textMuted", "c.textMuted"),
    ("AppColors.cardShadow", "c.cardShadow"),
    ("AppColors.painHotspot", "c.painHotspot"),
    ("AppColors.successLight", "c.successLight"),
    ("AppColors.navyLight", "c.navyLight"),
    ("AppColors.primary", "c.primary"),
    ("AppColors.navy", "c.navy"),
    ("AppColors.border", "c.border"),
    ("AppColors.success", "c.success"),
    ("AppColors.warning", "c.warning"),
    ("AppColors.scoreLow", "c.scoreLow"),
    ("AppColors.scoreMid", "c.scoreMid"),
    ("AppColors.scoreHigh", "c.scoreHigh"),
]

IMPORT_OLD = "import 'package:calm_calibrate/core/theme/app_colors.dart';"
IMPORT_NEW = "import 'package:calm_calibrate/core/theme/app_color_tokens.dart';"

BUILD_PATTERNS = [
    (r"(Widget build\(BuildContext context\) \{\n)", r"\1    final c = context.appColors;\n"),
    (r"(builder: \(context, _\) \{\n)", r"\1        final c = context.appColors;\n"),
    (r"(builder: \(context, __\) \{\n)", r"\1        final c = context.appColors;\n"),
]


def uses_c(content: str) -> bool:
    return re.search(r"\bc\.\w+", content) is not None


def has_c_definition(content: str) -> bool:
    return "context.appColors" in content or "final c = " in content


def strip_const_before_c(content: str) -> str:
    """Remove const from widgets that now reference runtime colors."""
    lines = content.split("\n")
    out = []
    for line in lines:
        if "c." in line and "const " in line:
            line = re.sub(r"\bconst\s+", "", line)
        out.append(line)
    return "\n".join(out)


def migrate_file(path: Path) -> bool:
    content = path.read_text()
    if "AppColors." not in content:
        return False

    if IMPORT_NEW not in content:
        if IMPORT_OLD in content:
            content = content.replace(IMPORT_OLD, IMPORT_NEW)
        else:
            first_import = content.find("import '")
            if first_import >= 0:
                end = content.find(";\n", first_import) + 2
                content = content[:end] + IMPORT_NEW + "\n" + content[end:]

    for old, new in TOKEN_REPLACEMENTS:
        content = content.replace(old, new)

    content = strip_const_before_c(content)

    if uses_c(content) and not has_c_definition(content):
        for pattern, repl in BUILD_PATTERNS:
            if re.search(pattern, content):
                content = re.sub(pattern, repl, content, count=1)
                break

    path.write_text(content)
    return True


def main() -> int:
    count = 0
    for path in sorted(ROOT.rglob("*.dart")):
        if path.name in ("app_colors.dart", "app_color_tokens.dart", "app_theme.dart"):
            continue
        if migrate_file(path):
            count += 1
            print(path.relative_to(ROOT.parent))
    print(f"Migrated {count} files")
    return 0


if __name__ == "__main__":
    sys.exit(main())
