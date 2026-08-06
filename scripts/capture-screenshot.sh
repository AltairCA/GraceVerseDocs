#!/usr/bin/env bash
# Capture the current Android screen into assets/screenshots/.
#
# Usage:
#   ./scripts/capture-screenshot.sh today.png
#
# Prerequisites:
#   - adb on PATH
#   - One Android device connected with USB debugging enabled
#   - GraceVerse open on the screen you want to capture

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <filename.png>" >&2
  exit 1
fi

filename="$1"
if [[ "$filename" != *.png ]]; then
  echo "Filename must end with .png" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docs_root="$(cd "$script_dir/.." && pwd)"
output_dir="$docs_root/assets/screenshots"
output_path="$output_dir/$filename"

device_count="$(adb devices | awk 'NR > 1 && $2 == "device" { count++ } END { print count + 0 }')"
if [[ "$device_count" -eq 0 ]]; then
  echo "No Android device found. Connect a device and enable USB debugging." >&2
  exit 1
fi

if [[ "$device_count" -gt 1 ]]; then
  echo "Multiple devices found. Set ANDROID_SERIAL or disconnect extras." >&2
  adb devices
  exit 1
fi

mkdir -p "$output_dir"
adb exec-out screencap -p > "$output_path"

if file "$output_path" | grep -q 'PNG image data'; then
  echo "Saved $output_path"
else
  echo "Capture failed — output is not a PNG." >&2
  rm -f "$output_path"
  exit 1
fi
