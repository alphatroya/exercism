package clock

import "fmt"

//Clock contains date information with only hours and minutes
type Clock struct {
	hour, minute int
}

const (
	minutesInHour = 60
	hoursInDay    = 24
)

//New creates Clock instance
func New(hour int, minute int) Clock {
	hour += minute / minutesInHour
	minute %= minutesInHour
	if minute < 0 {
		minute += minutesInHour
		hour--
	}
	hour %= hoursInDay
	if hour < 0 {
		hour += hoursInDay
	}
	return Clock{hour: hour, minute: minute}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

//Add return new Clock with addition minutes to the current
func (c Clock) Add(minutes int) Clock {
	return New(c.hour, c.minute+minutes)
}

//Subtract return new Clock with subtraction minutes from the current
func (c Clock) Subtract(minutes int) Clock {
	return New(c.hour, c.minute-minutes)
}
