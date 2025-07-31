package robotname

import (
	"fmt"
	"math/rand"
)

const limit = 26 * 26 * 10 * 10 * 10

var letters = []rune("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
var numbers = []rune("0123456789")

// Robot have a name
type Robot struct {
	name string
}

var usedNames = make(map[string]bool)

// Name return current robot name or generate a new one. If Robots counts achieve exhaust limit, it return an error
func (r *Robot) Name() (string, error) {
	if r.name != "" {
		return r.name, nil
	}

	if len(usedNames) >= limit {
		return "", fmt.Errorf("name counter is exhausted, current counter: %d", len(usedNames))
	}

	var name string
	for isUsed := true; isUsed; {
		nameRunes := make([]rune, 5)
		for i := 0; i < len(nameRunes); i++ {
			if i < 2 {
				nameRunes[i] = letters[rand.Intn(len(letters))]
			} else {
				nameRunes[i] = numbers[rand.Intn(len(numbers))]
			}
		}
		name = string(nameRunes)
		isUsed = usedNames[name]
	}
	r.name = name
	usedNames[name] = true
	return name, nil
}

// Reset robot name, next call Name will generate a new name
func (r *Robot) Reset() {
	r.name = ""
}
