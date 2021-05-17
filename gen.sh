#!/bin/sh

escape() {
   sed 's/\\/\\\\/g;s/\//\\\//g;s/\./\\./g' "$1"
}

mkdir -p sites

[ -d "style" ] && cp -r "style" "sites/style"

for f in content/*.html; do
   sed "s/__REPLACE__/$(escape "$f")/g" "template.html" > "sites/$(basename "$f")"
done

