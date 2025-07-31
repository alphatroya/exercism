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

    if [ -z "${current_number##*[!0-9]*}" ]; then
      echo false
      exit 0
    fi

    right_edge_index=$(( length - i ))
    if (( right_edge_index % 2 != 0 )); then
      (( current_number *= 2 ))
      if (( current_number > 9 )); then
        (( current_number -= 9 ))
      fi
    fi

    (( sum += current_number ))
  done

  if (( sum % 10 == 0 )); then
    echo true
  else
    echo false
  fi

}

main "$@"
