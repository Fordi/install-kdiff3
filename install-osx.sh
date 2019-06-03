#!/bin/bash
KDIFF3_DIR="$(mktemp -d)"
KDIFF3_SRC="https://phoenixnap.dl.sourceforge.net/project/kdiff3/kdiff3/0.9.98/kdiff3-0.9.98-MacOSX-64Bit.dmg"
wget "$KDIFF3_SRC" -O "$KDIFF3_DIR/kdiff3.dmg"
KDIFF_VOL="/$(hdiutil attach "$KDIFF3_DIR/kdiff3.dmg" | grep 'Volumes' | tr -s ' ' | cut -d / -f 4-)"
rm -rf /Applications/kdiff3.app
cp -pR "$KDIFF_VOL/kdiff3.app" /Applications
hdiutil detach "$KDIFF_VOL"
rm -rf "$KDIFF3_DIR"
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.path /Applications/kdiff3.app/Contents/MacOS/kdiff3
