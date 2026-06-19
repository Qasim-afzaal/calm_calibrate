#!/usr/bin/env python3
"""Fix dark mode migration: inject context.appColors and remove invalid const."""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "lib"


def inject_c_bindings(content: str) -> str:
    patterns = [
        (
            r"(Widget build\(BuildContext (\w+)\) \{\n)",
            r"\1    final c = \2.appColors;\n",
        ),
        (
            r"(builder: \((\w+), _\) \{\n)",
            r"\1        final c = \2.appColors;\n",
        ),
        (
            r"(builder: \((\w+)\) \{\n)",
            r"\1        final c = \2.appColors;\n",
        ),
        (
            r"((?:Widget|Color|TextStyle|BoxDecoration|LinearGradient|InputDecoration) "
            r"_\w+\([^)]*BuildContext (\w+)[^)]*\) \{\n)",
            r"\1    final c = \2.appColors;\n",
        ),
        (
            r"(Future<[^>]+> \w+\(BuildContext (\w+)\) async \{\n)",
            r"\1  final c = \2.appColors;\n",
        ),
    ]

    for pat, repl in patterns:
        def sub(m, _repl=repl):
            block = m.group(0)
            param_match = re.search(r"BuildContext (\w+)", block)
            if not param_match:
                return block
            param = param_match.group(1)
            after = content[m.end() : m.end() + 120]
            if f"final c = {param}.appColors" in after:
                return block
            return re.sub(pat, _repl, block, count=1)

        # Apply repeatedly until stable
        while True:
            new = re.sub(pat, repl, content)
            if new == content:
                break
            content = new

    return content


def fix_app_card(content: str) -> str:
    if "class AppCard" not in content:
        return content
    content = content.replace("this.color = c.surface,", "this.color,")
    content = content.replace("this.borderColor = c.border,", "this.borderColor,")
    content = content.replace("final Color color;", "final Color? color;")
    content = content.replace("final Color borderColor;", "final Color? borderColor;")
    content = content.replace(
        "        color: color,\n        borderRadius: BorderRadius.circular(radius),\n"
        "        border: Border.all(color: borderColor),",
        "        color: color ?? c.surface,\n        borderRadius: BorderRadius.circular(radius),\n"
        "        border: Border.all(color: borderColor ?? c.border),",
    )
    return content


def fix_cancel_premium(content: str) -> str:
    if "cancelPremiumSubscription" not in content:
        return content
    if "final c = ctx.appColors" in content:
        return content
    return content.replace(
        "    builder: (ctx) => AlertDialog(",
        "    builder: (ctx) {\n      final c = ctx.appColors;\n      return AlertDialog(",
    ).replace(
        "      ],\n    ),\n  );",
        "      ],\n    );\n    },\n  );",
        1,
    )


def strip_const(content: str) -> str:
    if "c." not in content:
        return content
    return re.sub(r"\bconst\s+", "", content)


def fix_file(path: Path) -> bool:
    content = path.read_text()
    if "c." not in content:
        return False

    original = content
    content = fix_app_card(content)
    content = fix_cancel_premium(content)
    content = inject_c_bindings(content)
    content = strip_const(content)

    if content != original:
        path.write_text(content)
        return True
    return False


def main() -> int:
    n = 0
    for path in sorted(ROOT.rglob("*.dart")):
        if fix_file(path):
            n += 1
            print(path.relative_to(ROOT.parent))
    print(f"Fixed {n} files")
    return 0


if __name__ == "__main__":
    sys.exit(main())
