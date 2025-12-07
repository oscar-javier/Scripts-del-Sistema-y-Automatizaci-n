#!/usr/bin/env bash
set -euo pipefail

echo "=== Script de automatización (Linux/macOS) ==="

echo "VAR_ENTORNO: ${VAR_ENTORNO:-no-definida}"
echo "SECRET_EXAMPLE está definida? $([[ -n "${SECRET_EXAMPLE:-}" ]] && echo 'Sí' || echo 'No')"

OUTPUT_DIR="output/linux"
mkdir -p "$OUTPUT_DIR"

uname -a > "$OUTPUT_DIR/system-info.txt"
echo "NODE_ENV=${NODE_ENV:-none}" >> "$OUTPUT_DIR/system-info.txt"

chmod 600 "$OUTPUT_DIR/system-info.txt"

(
  sleep 5
  echo "Proceso en segundo plano finalizado a las $(date)" >> "$OUTPUT_DIR/background.log"
) &

BG_PID=$!
echo "Proceso en segundo plano lanzado con PID=$BG_PID"

if [[ ! -f "$OUTPUT_DIR/system-info.txt" ]]; then
  echo "Error: no se generó system-info.txt" >&2
  exit 1
fi

echo "Script de automatización Linux completado correctamente."
exit 0