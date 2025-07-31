package gigasecond

import (
	"math"
	"time"
)

// AddGigasecond adds 1,000,000,000 to the passed time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * time.Duration(math.Pow(10, 9)))
}
