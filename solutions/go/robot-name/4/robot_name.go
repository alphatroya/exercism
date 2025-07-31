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
	r1 := string(rand.Intn(26) + 'A')
	r2 := string(rand.Intn(26) + 'A')
	num := rand.Intn(1000)
	return fmt.Sprintf("%s%s%03d", r1, r2, num)
}

// Reset robot name, next call Name will generate a new name
func (r *Robot) Reset() {
	r.name = ""
}
