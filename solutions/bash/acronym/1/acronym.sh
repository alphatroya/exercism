#!/usr/bin/env bash

main() {
  mapfile -t lines < <(echo "$@" | tr '[:lower:]' '[:upper:]' | tr '[:punct:]' '\n' | tr ' ' '\n')
  for word in "${lines[@]}"
  do
    printf "%s" "${word:0:1}"
  done
}

main "$@"
