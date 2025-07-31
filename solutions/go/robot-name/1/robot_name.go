package robotname

import (
	"fmt"
	"strconv"
	"sync"
)

const limit = 26 * 26 * 10 * 10 * 10

var globalCounter = struct {
	sync.RWMutex
	value int
}{}

// Robot have a name
type Robot struct {
	name string
}

// Name return current robot name or generate a new one. If Robots counts achieve exhaust limit, it return an error
func (r *Robot) Name() (string, error) {
	if r.name != "" {
		return r.name, nil
	}

	counter := globalCounter.value

	if counter >= limit {
		return "", fmt.Errorf("name counter is exhausted, current counter: %d", counter)
	}

	globalCounter.Lock()
	globalCounter.value++
	globalCounter.Unlock()

	const maxNumber = 1000
	var name string
	if counter > maxNumber {
		letters := counter - maxNumber
		name = fmt.Sprintf("%s%03d", strconv.FormatInt(int64(letters), 26), maxNumber-1)
	} else {
		name = fmt.Sprintf("AA%03d", counter)
	}
	r.name = name
	return r.name, nil
}

// Reset robot name, next call Name will generate a new name
func (r *Robot) Reset() {
	r.name = ""
}
