package isogram

import (
	"unicode"
)

// IsIsogram return is isogram check result for input string
func IsIsogram(input string) bool {
	runes := make(map[rune]bool)
	for _, character := range []rune(input) {
		if unicode.IsLetter(character) {
			lowercased := unicode.ToLower(character)
			if runes[lowercased] {
				return false
			}
			runes[lowercased] = true
		}
	}
	return true
}
