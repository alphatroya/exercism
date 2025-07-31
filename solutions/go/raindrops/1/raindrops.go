package raindrops

import "fmt"

func Convert(input int) string {
	var result = ""
	if input%3 == 0 {
		result += "Pling"
	}
	if input%5 == 0 {
		result += "Plang"
	}
	if input%7 == 0 {
		result += "Plong"
	}
	if len(result) == 0 {
		return fmt.Sprint(input)
	}
	return result
}
