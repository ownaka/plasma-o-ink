#!/usr/bin/env bash
# Instala o tema O-Ink para KDE Plasma 6 em ~/.local/share
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="${XDG_DATA_HOME:-$HOME/.local/share}"

mkdir -p "$DST"/{plasma/look-and-feel,plasma/desktoptheme,aurorae/themes,icons,wallpapers,color-schemes,konsole}

cp -r "$SRC/plasma/look-and-feel/net.ownaka.oink" "$DST/plasma/look-and-feel/"
cp -r "$SRC/plasma/desktoptheme/o-ink"            "$DST/plasma/desktoptheme/"
cp -r "$SRC/aurorae/themes/O-Ink"                 "$DST/aurorae/themes/"
cp -r "$SRC/icons/O-Ink"                          "$DST/icons/"
cp -r "$SRC/wallpapers/O-Ink"                     "$DST/wallpapers/"
cp    "$SRC/color-schemes/OInk.colors"            "$DST/color-schemes/"
cp    "$SRC/konsole/O-Ink.profile" "$SRC/konsole/O-Ink.colorscheme" "$DST/konsole/"

echo "Arquivos instalados em $DST"

if [[ "${1:-}" == "--apply" ]] && command -v plasma-apply-lookandfeel >/dev/null; then
  plasma-apply-lookandfeel -a net.ownaka.oink
  echo "Tema global O-Ink aplicado."
else
  echo "Para aplicar: Configurações do Sistema > Tema Global > O-Ink"
  echo "ou rode: plasma-apply-lookandfeel -a net.ownaka.oink"
fi
