package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	input, _ := os.ReadFile("cmd/day3/input.txt")

	fmt.Printf("\nAnswer to part 1 is: [%d]", part1(string(input)))
	fmt.Printf("\nAnswer to part 2 is: [%d]", part2(string(input)))
}

func part1(input string) int {
	parts := strings.Split(input, "\n")

	count := 0

	for _, part := range parts {
		sides := strings.Fields(part)
		c := 0

		for i := range sides {
			side, _ := strconv.Atoi(strings.TrimSpace(sides[i]))
			others := sumExceptIndex(sides, i)

			if others > side {
				c += 1
			}
		}

		if c == 3 {
			count += 1
		}
	}

	return count
}

func part2(input string) int {
	parts := strings.Split(input, "\n")

	columns := [][]int{
		{},
		{},
		{},
	}

	for _, part := range parts {
		sides := strings.Fields(part)

		for i := range sides {
			side, _ := strconv.Atoi(strings.TrimLeft(sides[i], ""))

			columns[i] = append(columns[i], side)
		}
	}
	count := 0

	for i := 0; i < 3; i++ {
		chunked := chunkBy(columns[i], 3)

		for _, chunk := range chunked {

			c := 0
			for k, v := range chunk {
				others := sumExceptIndexInt(chunk, k)
				if others > v {
					c += 1
				}
			}

			if c == 3 {
				count += 1
			}

		}
	}

	return count
}

func sumExceptIndex(slice []string, index int) int {
	sum := 0
	for i, value := range slice {
		if i != index {
			v, _ := strconv.Atoi(strings.TrimSpace(value))
			sum += v
		}
	}
	return sum
}

func sumExceptIndexInt(slice []int, index int) int {
	sum := 0
	for i, value := range slice {
		if i != index {
			sum += value
		}
	}
	return sum
}

func chunkBy(items []int, chunkSize int) (chunks [][]int) {
	for chunkSize < len(items) {
		items, chunks = items[chunkSize:], append(chunks, items[0:chunkSize:chunkSize])
	}

	return append(chunks, items)
}
