package isogram

import (
	"strings"
	"unicode"
)

// IsIsogram return is isogram check result for input string
func IsIsogram(input string) bool {
	for _, character := range []rune(input) {
		if !unicode.IsLetter(character) {
			continue
		}
		if strings.Count(strings.ToLower(input), string(unicode.ToLower(character))) > 1 {
			return false
		}
	}
	return true
}
