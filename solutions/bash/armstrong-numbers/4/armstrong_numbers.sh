#!/usr/bin/env bash

set -o nounset
main() {
    if (( $#  != 1 )); then
        exit 1
    fi

    number=$1
    sum=0
    count=${#number}
    for (( i = count; i >= 0; i--))
    do
        digit=${number:i:1}
        ((sum += digit ** count ))
    done

    if (( sum == number )); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
