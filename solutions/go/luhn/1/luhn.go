// Package luhn contains methods for luhn algorithm check
package luhn

import (
	"strconv"
	"strings"
)

// Valid return Luhn algorithm check for input string
func Valid(input string) bool {
	onlyNumbers := strings.ReplaceAll(input, " ", "")
	if len(onlyNumbers) <= 1 {
		return false
	}
	sum := 0
	reverseIndex := 0
	for i := len(onlyNumbers) - 1; i >= 0; i-- {
		character, err := strconv.Atoi(string(onlyNumbers[i]))
		if err != nil {
			return false
		}
		if reverseIndex%2 == 0 {
			sum += character
		} else {
			doubled := character * 2
			if doubled > 9 {
				doubled -= 9
			}
			sum += doubled
		}
		reverseIndex++
	}
	return sum%10 == 0
}
