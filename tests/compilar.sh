#!/usr/bin/env bash
# Compila y ejecuta la prueba de VISION (tests/vision_test.bas) con fbc.
#
# Uso:
#   tests/compilar.sh
#
# Variables opcionales:
#   FBC       compilador a usar                (por defecto: fbc)
#   FBCFLAGS  flags extra para fbc             (por defecto: ninguno)
#   OUT       ruta del ejecutable generado     (por defecto: build/vision_test)
#
# Sale con el codigo de la prueba: 0 si todo pasa, numero de fallos si no.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FBC="${FBC:-fbc}"
FBCFLAGS="${FBCFLAGS:-}"
OUT="${OUT:-$ROOT/build/vision_test}"
SRC="$ROOT/tests/vision_test.bas"
INC="$ROOT/LIBRERIAS/VISION"

if ! command -v "$FBC" >/dev/null 2>&1; then
	echo "error: no se encuentra el compilador '$FBC'." >&2
	echo "instala FreeBASIC (https://www.freebasic.net) o define FBC=/ruta/a/fbc" >&2
	exit 127
fi

mkdir -p "$(dirname "$OUT")"

echo "fbc:   $FBC"
echo "fuente: $SRC"
echo "salida: $OUT"
echo

# FBCFLAGS se parte a proposito para admitir varias opciones.
# shellcheck disable=SC2086
"$FBC" $FBCFLAGS -i "$INC" -w all -x "$OUT" "$SRC"

echo
"$OUT"
