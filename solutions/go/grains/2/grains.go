package grains

import (
	"fmt"
	"math"
)

func Square(number int) (uint64, error) {
	if number <= 0 || number > 64 {
		return 0, fmt.Errorf("Square data is out of bounds")
	}
	return 1 << (uint64(number) - 1), nil
}

func Total() uint64 {
	return math.MaxUint64
}
