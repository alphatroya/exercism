package matrix

import (
	"errors"
	"strconv"
	"strings"
)

// Matrix struct represents a Matrix structure
type Matrix struct {
	rows [][]int
}

// New create new Matrix instance from formatted input string
func New(input string) (*Matrix, error) {
	rows := strings.Split(input, "\n")
	var intRows [][]int
	for _, row := range rows {
		var intRow []int
		row = strings.Trim(row, " ")
		cols := strings.Split(row, " ")
		for _, col := range cols {
			convertedCol, err := strconv.ParseInt(col, 10, 32)
			if err != nil {
				return nil, err
			}
			intRow = append(intRow, int(convertedCol))

		}
		intRows = append(intRows, intRow)
	}

	sizes := make(map[int]bool)
	for _, row := range intRows {
		sizes[len(row)] = true
	}
	if len(sizes) > 1 {
		return nil, errors.New("uneven rows")
	}

	return &Matrix{intRows}, nil
}

// Rows return rows slice of the matrix
func (m *Matrix) Rows() [][]int {
	copyRows := make([][]int, len(m.rows))
	for i, row := range m.rows {
		copyCols := make([]int, len(row))
		for j, col := range row {
			copyCols[j] = col
		}
		copyRows[i] = copyCols
	}
	return copyRows
}

// Cols return column slice of the matrix
func (m *Matrix) Cols() [][]int {
	if len(m.rows) == 0 {
		return make([][]int, 0)
	}
	copyRows := make([][]int, len(m.rows[0]))
	for i := range m.rows[0] {
		copyRows[i] = make([]int, len(m.rows))
	}
	for i, row := range m.rows {
		for j, col := range row {
			copyRows[j][i] = col
		}
	}
	return copyRows
}

// Set assign a new value to specified index, return an error if index is wrong or empty matrix
func (m *Matrix) Set(i, j, value int) bool {
	if len(m.rows) == 0 {
		return false
	}
	if i < 0 || j < 0 || i >= len(m.rows) || j >= len(m.rows[0]) {
		return false
	}
	m.rows[i][j] = value
	return true
}
