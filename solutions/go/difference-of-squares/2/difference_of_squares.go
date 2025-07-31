// Package diffsquares contains methods for SquareOfSum and SumOfSquares calculation
package diffsquares

// SquareOfSum return square of the sum of the first natural numbers below number
func SquareOfSum(number int) int {
	sum := number * (number + 1) / 2
	return sum * sum
}

// SumOfSquares return sum of the squares of the first natural numbers below number
func SumOfSquares(number int) int {
	return number * (number + 1) * (2*number + 1) / 6
}

// Difference return difference of the SquareOfSum and SumOfSquares results for the number
func Difference(number int) int {
	return SquareOfSum(number) - SumOfSquares(number)
}
