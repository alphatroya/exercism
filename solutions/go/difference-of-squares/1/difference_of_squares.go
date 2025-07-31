// Package diffsquares contains methods for SquareOfSum and SumOfSquares calculation
package diffsquares

// SquareOfSum return square of the sum of the first natural numbers below number
func SquareOfSum(number int) int {
	result := 0
	for i := 0; i <= number; i++ {
		result += i
	}
	return result * result
}

// SumOfSquares return sum of the squares of the first natural numbers below number
func SumOfSquares(number int) int {
	result := 0
	for i := 0; i <= number; i++ {
		result += i * i
	}
	return result
}

// Difference return difference of the SquareOfSum and SumOfSquares results for the number
func Difference(number int) int {
	return SquareOfSum(number) - SumOfSquares(number)
}
