#!/usr/bin/env bash

main () {
  case $1 in
    encode)
      encode "$2"
      ;;
    decode)
      decode "$2"
      ;;
    *)
      exit 1
      ;;
  esac
}

function encode() {
  lowercased="${*,,}"
  decode "$lowercased" | fold -w5 | paste -sd' ' -
}

function decode() {
  input="${*//[[:space:]]}"

  result=""
  for (( i=0; i<${#input}; i++ )) do

    current_char=${input:i:1}

    if [ -n "${current_char##*[!0-9]*}" ]; then
        result="$result$current_char"
        continue
    fi

    j=0
    for x in {a..z}
    do
      if [[  $x == "$current_char"  ]]; then
        reversed_letters=( {z..a} )
        result="$result${reversed_letters[j]}"
        break
      fi
      (( j++ ))
    done

  done

  echo "$result"
}

main "$@"

