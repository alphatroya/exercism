package tournament

import (
	"bytes"
	"errors"
	"fmt"
	"io"
	"sort"
	"strings"
)

type stats struct {
	name string
	win  int
	draw int
	lose int
}

func newStats(name string) *stats {
	return &stats{name: name}
}

func (s *stats) mp() int {
	return s.win + s.draw + s.lose
}

func (s *stats) points() int {
	return 3*s.win + s.draw
}

// Tally reads from input buffer game stats and output in the writer formatted stats table
func Tally(reader io.Reader, writer io.Writer) error {
	buf := new(bytes.Buffer)
	_, err := buf.ReadFrom(reader)
	if err != nil {
		return err
	}
	input := buf.String()

	resultsMap := make(map[string]*stats)

	lines := strings.Split(input, "\n")
	for _, line := range lines {
		if strings.HasPrefix(line, "#") || len(line) == 0 {
			continue
		}
		fragments := strings.Split(line, ";")
		if len(fragments) != 3 {
			return errors.New("wrong input string format")
		}
		firstCommandName := fragments[0]
		firstStats := resultsMap[firstCommandName]
		if firstStats == nil {
			firstStats = newStats(firstCommandName)
			resultsMap[firstCommandName] = firstStats
		}
		secondCommandName := fragments[1]
		secondStats := resultsMap[secondCommandName]
		if secondStats == nil {
			secondStats = newStats(secondCommandName)
			resultsMap[secondCommandName] = secondStats
		}
		switch fragments[2] {
		case "win":
			firstStats.win++
			secondStats.lose++
		case "loss":
			firstStats.lose++
			secondStats.win++
		case "draw":
			firstStats.draw++
			secondStats.draw++
		default:
			return errors.New("wrong game status string")
		}
	}

	_, err = writer.Write([]byte("Team                           | MP |  W |  D |  L |  P\n"))
	if err != nil {
		return err
	}

	var sorted []*stats
	for _, stats := range resultsMap {
		sorted = append(sorted, stats)
	}

	sort.Slice(sorted, func(i, j int) bool {
		if sorted[i].points() == sorted[j].points() {
			return sorted[i].name < sorted[j].name
		}
		return sorted[i].points() > sorted[j].points()
	})

	for _, stats := range sorted {
		normalizeString := stats.name
		for len(normalizeString) < 30 {
			normalizeString += " "
		}
		_, err := writer.Write([]byte(fmt.Sprintf("%s |  %d |  %d |  %d |  %d |  %d\n",
			normalizeString,
			stats.mp(),
			stats.win,
			stats.draw,
			stats.lose,
			stats.points(),
		)))
		if err != nil {
			return err
		}
	}
	return nil
}
