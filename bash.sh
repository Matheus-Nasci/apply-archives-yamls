#!/bin/bash

NAMESPACE=""
BATCH_SIZE=10
FILES=()

find . -type f \( -name "*.yaml" -o -name "*.yml" \) | while read file; do
  FILES+=("$file")

  if [ ${#FILES[@]} -eq $BATCH_SIZE ]; then
    oc apply -f "${FILES[@]}" -n "$NAMESPACE"
    FILES=()
  fi
done

if [ ${#FILES[@]} -gt 0 ]; then
  oc apply -f "${FILES[@]}" -n "$NAMESPACE" --dry-run=client
fi
