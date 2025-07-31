package hamming

type WrongInputError struct {
}

func (e WrongInputError) Error() string {
	return "WrongInputError"
}

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, WrongInputError{}
	}

	result := 0
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			result++
		}
	}

	return result, nil
}
