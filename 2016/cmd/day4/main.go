package main

import (
	"fmt"
	"os"
	"regexp"
	"strconv"
	"strings"
)

func main() {
	input, _ := os.ReadFile("cmd/day4/input.txt")

	fmt.Printf("\nAnswer to part 1 is: [%d]", part1(string(input)))
	fmt.Printf("\nAnswer to part 2 is: [%d]", part2(string(input)))
}

func part1(input string) int {
	parts := strings.Split(input, "\n")
	count := 0

	for _, part := range parts {
		re := regexp.MustCompile(`([a-z]+(?:-[a-z]+)*)-(\d+)\[([a-z]+)\]`)
		matches := re.FindStringSubmatch(part)
		if matches != nil {
			all := true

			for _, s := range strings.Split(matches[3], "") {
				if !strings.Contains(matches[1], s) {
					all = false
					break
				}
			}

			if all {
				sectorId, _ := strconv.Atoi(matches[2])
				count += sectorId
			}
		}
	}

	return count
}

func part2(input string) int {
	parts := strings.Split(input, ", ")

	return len(parts)
}
