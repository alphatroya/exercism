package robotname

import (
	"fmt"
	"math/rand"
)

const limit = 26 * 26 * 10 * 10 * 10

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

	name := generateName()
	for usedNames[name] {
		name = generateName()
	}
	r.name = name
	usedNames[name] = true
	return name, nil
}

func generateName() string {
	return letter(rand.Intn(26)) + letter(rand.Intn(26)) + fmt.Sprintf("%03d", rand.Intn(1000))
}

func letter(index int) string {
	return string('A' - 1 + index)
}

// Reset robot name, next call Name will generate a new name
func (r *Robot) Reset() {
	r.name = ""
}
