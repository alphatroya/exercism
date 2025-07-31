// Package isogram contains methods for string isogram checking.
package isogram

import (
	"unicode"
)

// IsIsogram return is isogram check result for input string.
func IsIsogram(input string) bool {
	runes := make(map[rune]bool)
	for _, character := range input {
		if !unicode.IsLetter(character) {
			continue
		}
		lowercased := unicode.ToLower(character)
		if runes[lowercased] {
			return false
		}
		runes[lowercased] = true
	}
	return true
}
