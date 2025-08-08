#!/bin/bash

NAMESPACE=""
AMBIENCE="dev"
BATCH_SIZE=10
ARRAY_FILES=(apis config-map node-port routes)

for FILE in "${ARRAY_FILES[@]}"; do
  # echo "Procurando no diretório: $FILE no ambiente $AMBIENCE"

  find . -type d -name "$FILE" | while read path_dir; do
    find $path_dir -type f -name "*yml" -o -name "*yaml" | while read file; do
      echo "Arquivo encontrado: $file"
      echo "Aplicando arquivo no ambiente $AMBIENCE"
      oc apply -f "$file" -n "$NAMESPACE-$AMBIENCE" --dry-run=client
    done
  done
done

