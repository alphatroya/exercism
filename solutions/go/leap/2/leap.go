package leap

// IsLeapYear return true if provided year number is leap
func IsLeapYear(year int) bool {
	return year%4 == 0 && year%100 != 0 || year%400 == 0
}
