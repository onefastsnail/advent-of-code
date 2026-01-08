package main

import (
	"2016/internal/input"
	"fmt"
	"log"
	"regexp"
	"slices"
	"strconv"
	"strings"
)

var sidChecksumRe = regexp.MustCompile(`(\w+(?:-\w+)*)-(\d+)\[(\w+)\]`)

func main() {
	puzzle := input.GetInput(4)

	fmt.Printf("\nAnswer to part 1 is: [%d]", part1(puzzle))
	fmt.Printf("\nAnswer to part 2 is: [%d]", part2(puzzle))
}

func part1(input []string) int {
	total := 0

	for _, line := range input {
		matches := sidChecksumRe.FindStringSubmatch(line)

		if matches == nil {
			continue
		}

		counts := countChecksumInString(matches[3], matches[1])

		if !validateCounts(counts) {
			continue
		}

		sectorId, err := strconv.Atoi(matches[2])
		if err != nil {
			log.Fatalf("invalid sector ID %q in line %q: %v", matches[2], line, err)
		}

		total += sectorId
	}

	return total
}

func part2(input []string) int {
	return len(input)
}

type match struct {
	letter string
	count  int
}

func countChecksumInString(search string, value string) []match {
	result := make([]match, 0, len(search))

	for _, r := range search {
		s := string(r)

		if count := strings.Count(value, s); count > 0 {
			result = append(result, match{s, count})
		}
	}

	return result
}

func validateCounts(counts []match) bool {
	if len(counts) != 5 {
		return false
	}

	isSortedByCount := slices.IsSortedFunc(counts, func(a, b match) int {
		if a.count != b.count {
			return b.count - a.count
		}
		// tie-breaker: alphabetically
		if a.letter < b.letter {
			return -1
		}
		if a.letter > b.letter {
			return 1
		}

		return 0
	})

	return isSortedByCount
}
