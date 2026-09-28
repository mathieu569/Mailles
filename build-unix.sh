#!/bin/bash
# Compile Mailles.exe (cible Windows) depuis un Mac ou Linux.
set -e
cd "$(dirname "$0")"

echo "Compilation de Mailles..."
npx --yes @neutralinojs/neu build --release

mkdir -p dist/Mailles-Windows
cp dist/mailles/mailles-win_x64.exe dist/Mailles-Windows/Mailles.exe
cp dist/mailles/resources.neu dist/Mailles-Windows/resources.neu

rm -f dist/Mailles-Windows.zip
cd dist/Mailles-Windows && zip -r ../Mailles-Windows.zip . -x '.*'

echo ""
echo "Pret : dist/Mailles-Windows.zip"
