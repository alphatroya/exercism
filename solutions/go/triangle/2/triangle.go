package triangle

import "math"

type Kind int

const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
)

// KindFromSides return triangle type from it's side
func KindFromSides(a, b, c float64) Kind {
	for _, side := range []float64{a, b, c} {
		if math.IsNaN(side) || math.IsInf(side, 1) || math.IsInf(side, -1) || side == 0 {
			return NaT
		}
	}
	if a+b < c || a+c < b || b+c < a {
		return NaT
	}
	if a == b && a == c {
		return Equ
	}
	if a == b || a == c || b == c {
		return Iso
	}
	return Sca
}
