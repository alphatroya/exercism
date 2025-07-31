package space

// Planet specified a planet name
type Planet string

const secondsInYear = 31557600

// Age return how you are old in specified planet. Receive your age in seconds return in years
func Age(seconds float64, planet Planet) float64 {
	var multiplier float64
	switch planet {
	case "Mercury":
		multiplier = 0.2408467
	case "Venus":
		multiplier = 0.61519726
	case "Mars":
		multiplier = 1.8808158
	case "Jupiter":
		multiplier = 11.862615
	case "Saturn":
		multiplier = 29.447498
	case "Uranus":
		multiplier = 84.016846
	case "Neptune":
		multiplier = 164.79132
	default:
		multiplier = 1
	}
	return seconds / (secondsInYear * multiplier)
}
