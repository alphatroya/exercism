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
	sum, reverseIndex := 0, 0
	for i := len(onlyNumbers) - 1; i >= 0; i-- {
		character, err := strconv.Atoi(string(onlyNumbers[i]))
		if err != nil {
			return false
		}
		if reverseIndex%2 != 0 {
			character *= 2
			if character > 9 {
				character -= 9
			}
		}
		sum += character
		reverseIndex++
	}
	return sum%10 == 0
}
