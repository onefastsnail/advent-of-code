package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func main() {
	input, _ := os.ReadFile("cmd/day2/input.txt")

	fmt.Printf("\nAnswer to part 1 is: [%d]", part1(string(input)))
	fmt.Printf("\nAnswer to part 2 is: [%s]", part2(string(input)))
}

func part1(input string) int {
	parts := strings.Split(input, "\n")

	code := ""

	x, y := 1, 1
	keypad := [][]int8{
		{1, 2, 3},
		{4, 5, 6},
		{7, 8, 9},
	}

	for _, part := range parts {
		directions := strings.Split(part, "")
		for _, direction := range directions {
			switch direction {
			case "U":
				y = int(math.Max(0, float64(y-1)))
			case "D":
				y = int(math.Min(2, float64(y+1)))
			case "L":
				x = int(math.Max(0, float64(x-1)))
			case "R":
				x = int(math.Min(2, float64(x+1)))
			}

		}

		code += strconv.Itoa(int(keypad[y][x]))
	}

	c, _ := strconv.Atoi(code)

	return c
}

func part2(input string) string {
	parts := strings.Split(input, "\n")

	code := ""

	x, y := 0, 2
	keypad := [][]string{
		{"", "", "1", "", ""},
		{"", "2", "3", "4", ""},
		{"5", "6", "7", "8", "9"},
		{"", "A", "B", "C", ""},
		{"", "", "D", "", ""},
	}

	for _, part := range parts {
		directions := strings.Split(part, "")
		for _, direction := range directions {
			switch direction {
			case "U":
				ny := int(math.Max(0, float64(y-1)))
				if keypad[ny][x] != "" {
					y = ny
				}
			case "D":
				ny := int(math.Min(4, float64(y+1)))
				if keypad[ny][x] != "" {
					y = ny
				}
			case "L":
				nx := int(math.Max(0, float64(x-1)))
				if keypad[y][nx] != "" {
					x = nx
				}
			case "R":
				nx := int(math.Min(4, float64(x+1)))
				if keypad[y][nx] != "" {
					x = nx
				}
			}
		}

		code += keypad[y][x]
	}

	return code
}
