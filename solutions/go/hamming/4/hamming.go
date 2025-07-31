package hamming

import "errors"

// Distance method receive two strings and return counts of different chars.
func Distance(a, b string) (int, error) {
	runesA := []rune(a)
	runesB := []rune(b)
	if len(runesA) != len(runesB) {
		return 0, errors.New("hamming distance needs 2 strings of equal length")
	}

	result := 0
	for i, runeElement := range runesA {
		if runeElement != runesB[i] {
			result++
		}
	}

	return result, nil
}
