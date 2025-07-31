package gigasecond

import (
	"time"
)

const duration = 1e9

// AddGigasecond adds 1,000,000,000 to the passed time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * time.Duration(duration))
}
