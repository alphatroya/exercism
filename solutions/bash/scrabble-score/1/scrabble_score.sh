#!/usr/bin/env bash

main() {
  uppercased=${1^^}
  result=0
  for (( i=0; i<${#uppercased}; i++ )) do
    case "${uppercased:i-1:1}" in
      A | E | I | O | U | L | N | R | S | T)
        (( result += 1 ))
        ;;
      D | G)
        (( result += 2 ))
        ;;
      B | C | M | P)
        (( result += 3 ))
        ;;
      F | H | V | W | Y)
        (( result += 4 ))
        ;;
      K)
        (( result += 5 ))
        ;;
      J | X)
        (( result += 8 ))
        ;;
      Q | Z)
        (( result += 10 ))
        ;;
      *)
        ;;
    esac
  done
  echo $result
}

main "$@"
