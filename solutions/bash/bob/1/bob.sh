#!/usr/bin/env bash

main() {
  trimmed="${1//[[:space:]]}"
  if [[ -z $trimmed ]]; then
      echo "Fine. Be that way!"
      exit
  fi

  is_uppecased_and_not_lowercased=false
  if [[ ${trimmed^^} == "$trimmed" && ${trimmed,,} != "$trimmed" ]]; then
    is_uppecased_and_not_lowercased=true
  fi

  if [[ "${trimmed: -1}" == "?" ]]; then
    if $is_uppecased_and_not_lowercased; then
      echo "Calm down, I know what I'm doing!"
    else
      echo "Sure."
    fi
  else
    if $is_uppecased_and_not_lowercased; then
      echo "Whoa, chill out!"
    else
      echo "Whatever."
    fi
  fi
}

main "$@"
