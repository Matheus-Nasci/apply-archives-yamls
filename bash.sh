#!/bin/bash

NAMESPACE=""
AMBIENCE="dev"
BATCH_SIZE=10
ARRAY_FILES=(apis config-map node-port routes)

# lista formato yaml
# "apis config-map node-port routes"

for FILE in "${ARRAY_FILES[@]}"; do
  find . -type d -name "$FILE" | while read -r path_dir; do
    find "$path_dir" -type f \( -name "*.yml" -o -name "*.yaml" \) | while read -r file; do
      echo "Arquivo encontrado: $file"
      echo "Aplicando arquivo no ambiente $AMBIENCE"
      oc apply -f "$file" -n "$NAMESPACE-$AMBIENCE" --dry-run=client
    done
  done
done

