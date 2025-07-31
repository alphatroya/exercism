package isogram

import (
	"strings"
)

func IsIsogram(input string) bool {
	lowercased := strings.ToLower(input)
	for _, character := range lowercased {
		if character == ' ' || character == '-' {
			continue
		}
		if strings.Count(lowercased, string(character)) > 1 {
			return false
		}
	}
	return true
}
