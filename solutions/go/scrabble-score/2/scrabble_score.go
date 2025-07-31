package scrabble

import "unicode"

func Score(input string) int {
	result := 0
	for _, character := range input {
		switch unicode.ToLower(character) {
		case 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't':
			result += 1
		case 'd', 'g':
			result += 2
		case 'b', 'c', 'm', 'p':
			result += 3
		case 'f', 'h', 'v', 'w', 'y':
			result += 4
		case 'k':
			result += 5
		case 'j', 'x':
			result += 8
		case 'q', 'z':
			result += 10
		default:
			continue
		}
	}
	return result
}
