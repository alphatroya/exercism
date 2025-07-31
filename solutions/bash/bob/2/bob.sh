#!/usr/bin/env bash

main() {
  trimmed="${1//[[:space:]]}"
  if [[ -z "$trimmed" ]]; then
      echo "Fine. Be that way!"
      exit
  fi

  correct_case_check=0
  if [[ "$trimmed" = *[[:upper:]]* ]] && [[ "$trimmed" != *[[:lower:]]* ]]; then
    correct_case_check=1
  fi

  if [[ "${trimmed: -1}" == "?" ]]; then
    if (( correct_case_check )); then
      echo "Calm down, I know what I'm doing!"
    else
      echo "Sure."
    fi
  else
    if (( correct_case_check )); then
      echo "Whoa, chill out!"
    else
      echo "Whatever."
    fi
  fi
}

main "$@"
