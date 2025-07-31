#!/usr/bin/env bash

main() {
  lowercased=${@^^}
  mapfile -t lines < <(echo "${lowercased//[ [:punct:]]/$'\n'}")

  result=""
  for word in "${lines[@]}"
  do
    result="$result${word:0:1}"
  done
  echo "$result"
}

main "$@"
