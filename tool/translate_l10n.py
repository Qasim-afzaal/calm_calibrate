#!/usr/bin/env python3
"""Translate app_*.arb files from English using Google Translate."""

import json
import re
import sys
import time
from pathlib import Path

from deep_translator import GoogleTranslator

LOCALES = {
    'ur': 'ur',
    'hi': 'hi',
    'bn': 'bn',
    'es': 'es',
    'fr': 'fr',
    'ar': 'ar',
    'pt': 'pt',
    'de': 'de',
}

PH_RE = re.compile(r'\{[^}]+\}')


def translate_text(text: str, translator: GoogleTranslator) -> str:
    if not text.strip():
        return text
    placeholders = PH_RE.findall(text)
    temp = text
    for i, ph in enumerate(placeholders):
        temp = temp.replace(ph, f'__PH{i}__', 1)
    try:
        translated = translator.translate(temp)
    except Exception as exc:
        print(f'  skip: {exc}')
        return text
    for i, ph in enumerate(placeholders):
        translated = translated.replace(f'__PH{i}__', ph)
    return translated


def translate_locale(code: str, google_code: str) -> None:
    l10n_dir = Path('lib/l10n')
    en = json.loads((l10n_dir / 'app_en.arb').read_text(encoding='utf-8'))
    path = l10n_dir / f'app_{code}.arb'
    target = json.loads(path.read_text(encoding='utf-8'))
    target['@@locale'] = code

    translator = GoogleTranslator(source='en', target=google_code)
    keys = [k for k in en if not k.startswith('@') and not k.startswith('@@')]
    print(f'Translating {code}: {len(keys)} keys')
    for i, key in enumerate(keys):
        value = en[key]
        if not isinstance(value, str):
            continue
        target[key] = translate_text(value, translator)
        if (i + 1) % 25 == 0:
            print(f'  {i + 1}/{len(keys)}')
            time.sleep(0.3)
    path.write_text(json.dumps(target, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')
    print(f'  wrote {path}')


def main() -> None:
    codes = sys.argv[1:] if len(sys.argv) > 1 else list(LOCALES.keys())
    for code in codes:
        google = LOCALES.get(code)
        if not google:
            print(f'Unknown locale: {code}')
            continue
        translate_locale(code, google)


if __name__ == '__main__':
    main()
