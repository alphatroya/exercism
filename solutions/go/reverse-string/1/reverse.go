package reverse

// Reverse return reversed version of the input string
func Reverse(input string) string {
	inputRunes := []rune(input)
	resultRunes := []rune{}
	for i := len(inputRunes) - 1; i >= 0; i-- {
		resultRunes = append(resultRunes, inputRunes[i])
	}
	return string(resultRunes)
}
