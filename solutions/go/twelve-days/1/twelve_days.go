package twelve

import (
	"fmt"
	"strings"
)

var elements = []string{
	"a Partridge in a Pear Tree",
	"two Turtle Doves",
	"three French Hens",
	"four Calling Birds",
	"five Gold Rings",
	"six Geese-a-Laying",
	"seven Swans-a-Swimming",
	"eight Maids-a-Milking",
	"nine Ladies Dancing",
	"ten Lords-a-Leaping",
	"eleven Pipers Piping",
	"twelve Drummers Drumming",
}

var days = []string{
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth",
	"eleventh",
	"twelfth",
}

// Verse return single verse for the current index
func Verse(line int) string {
	if line > 12 || line < 1 {
		return ""
	}
	prefix := fmt.Sprintf("On the %s day of Christmas my true love gave to me: ", days[line-1])
	var elementsSlice []string
	for line > 0 {
		line--
		if line == 0 && len(elementsSlice) != 0 {
			elementsSlice = append(elementsSlice, "and ")
		}
		elementsSlice = append(elementsSlice, elements[line])
		if line > 0 {
			elementsSlice = append(elementsSlice, ", ")
		}
	}
	return prefix + strings.Join(elementsSlice, "") + "."
}

// Song return the whole song string
func Song() string {
	var verses []string
	for i := 1; i <= 12; i++ {
		verses = append(verses, Verse(i))
	}
	return strings.Join(verses, "\n")
}
