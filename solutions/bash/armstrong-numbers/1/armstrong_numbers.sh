#!/usr/bin/env bash

set -o nounset
main() {
    if (( $#  != 1 )); then
        exit 1
    fi

    number=$1
    mutable_number=$number
    sum=0
    count=${#number}
    for (( i = $count; i > 0; i--))
    do
        power=$(( 10 ** (i - 1) ))
        division_result=$((mutable_number / power))
        ((mutable_number-=$((division_result * power))))
        ((sum += $((division_result**count))))
    done

    if (( sum == $number )); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
