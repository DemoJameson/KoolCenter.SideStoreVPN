#!/bin/sh
set -eu

ROOT="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
VERSION="$(python3 -c 'import json;print(json.load(open("config.json.js", encoding="utf-8"))["version"])')"
TITLE="$(python3 -c 'import json;print(json.load(open("config.json.js", encoding="utf-8"))["title"].replace(" ", ""))')"
PKG="${TITLE}_v${VERSION}.tar.gz"

python3 "${ROOT}/build.py"
printf '%s\n' "${ROOT}/${PKG}"
