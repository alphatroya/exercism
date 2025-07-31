package tournament

import (
	"bufio"
	"errors"
	"fmt"
	"io"
	"sort"
	"strings"
)

type stats struct {
	name   string
	win    int
	draw   int
	loss   int
	points int
}

func (s *stats) mp() int {
	return s.win + s.draw + s.loss
}

// Tally reads from input buffer game stats and output in the writer formatted stats table
func Tally(reader io.Reader, writer io.Writer) error {
	resultsMap := make(map[string]stats)
	bufferedReader := bufio.NewReader(reader)

	isEOF := false
	for !isEOF {
		line, err := bufferedReader.ReadString('\n')
		if err != nil {
			if err != io.EOF {
				return err
			}
			isEOF = true
		}
		line = strings.TrimSuffix(line, "\n")

		if strings.HasPrefix(line, "#") || len(line) == 0 {
			continue
		}
		fragments := strings.Split(line, ";")
		if len(fragments) != 3 {
			return errors.New("wrong input string format")
		}
		firstCommandName := fragments[0]
		firstStats := resultsMap[firstCommandName]
		secondCommandName := fragments[1]
		secondStats := resultsMap[secondCommandName]

		switch fragments[2] {
		case "win":
			firstStats.win++
			firstStats.points += 3
			secondStats.loss++
		case "loss":
			firstStats.loss++
			secondStats.win++
			secondStats.points += 3
		case "draw":
			firstStats.draw++
			secondStats.draw++
			firstStats.points++
			secondStats.points++
		default:
			return fmt.Errorf("wrong game status string, %s", fragments[2])
		}
		resultsMap[firstCommandName] = firstStats
		resultsMap[secondCommandName] = secondStats
	}

	_, err := fmt.Fprint(writer, "Team                           | MP |  W |  D |  L |  P\n")
	if err != nil {
		return err
	}

	sorted := make([]stats, 0, len(resultsMap))
	for key, stats := range resultsMap {
		stats.name = key
		sorted = append(sorted, stats)
	}

	sort.Slice(sorted, func(i, j int) bool {
		if sorted[i].points == sorted[j].points {
			return sorted[i].name < sorted[j].name
		}
		return sorted[i].points > sorted[j].points
	})

	for _, stats := range sorted {
		_, err = fmt.Fprintf(writer, "%-30s | %2d | %2d | %2d | %2d | %2d\n",
			stats.name,
			stats.mp(),
			stats.win,
			stats.draw,
			stats.loss,
			stats.points,
		)
		if err != nil {
			return err
		}
	}
	return nil
}
