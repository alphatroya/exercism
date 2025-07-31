package hamming

import "errors"

// Distance method receive two strings and return counts of different chars.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("WrongInputError")
	}

	result := 0
	runeB := []rune(b)
	for i, runeElement := range []rune(a) {
		if runeElement != runeB[i] {
			result++
		}
	}

	return result, nil
}
