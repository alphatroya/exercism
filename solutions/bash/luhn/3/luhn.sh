#!/usr/bin/env bash

main() {
  filtered_input="${1//[[:space:]]}"
  length=${#filtered_input}
  if (( length <= 1 )); then
    echo false
    exit 0
  fi

  sum=0
  for (( i=length; i > 0; i-- )) do
    current_number=${filtered_input:i-1:1}
    validate $current_number
    (( sum += $(handle $current_number $(( length - i )))))
  done

  if (( sum % 10 == 0 )); then
    echo true
  else
    echo false
  fi

}

function validate() {
  if [ -z "${1##*[!0-9]*}" ]; then
    echo false
    exit 0
  fi
}

function handle() {
  local number=$1
  if (( $2 % 2 != 0 )); then
    (( number *= 2 ))
    if (( number > 9 )); then
      (( number -= 9 ))
    fi
  fi
  echo $number
}

main "$@"
