#!/usr/bin/env bash

main () {
  case $1 in
    encode|decode)
      $1 "$2"
      ;;
    *)
      exit 1
      ;;
  esac
}

function encode() {
  local lowercased="${1,,}"
  decode "$lowercased" | fold -w5 | paste -sd' ' -
}

function decode() {
  local input="${1//[[:space:]]}"

  local result=""
  local reversed_letters=( {z..a} )
  local letters=( {a..z} )

  for (( i=0; i<${#input}; i++ )) do

    local current_char=${input:i:1}

    if [[ -n "${current_char##*[!0-9]*}" ]]; then
        result+="$current_char"
        continue
    fi

    for ((j=0; j < ${#letters[@]}; j++)); do
      local x="${letters[j]}"
      if [[  $x == "$current_char"  ]]; then
        result+="${reversed_letters[j]}"
        break
      fi
    done

  done

  echo "$result"
}

main "$@"

