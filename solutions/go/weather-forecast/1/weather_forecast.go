// Package weather provides forecast depending on condition and location.
package weather

var (
	// CurrentCondition describes a condition.
	CurrentCondition string
	// CurrentLocation describes a location.
	CurrentLocation string
)

// Forecast returns a forecast string based on passed city name and condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
