package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

type coordinate struct {
	x int
	y int
}

const (
	North = "N"
	East  = "E"
	South = "S"
	West  = "W"
)

var directionMap = map[string]map[string]string{
	"L": {North: West, East: North, South: East, West: South},
	"R": {North: East, East: South, South: West, West: North},
}

func main() {
	input, _ := os.ReadFile("cmd/day1/input.txt")

	fmt.Printf("\nAnswer to part 1 is: [%d]", part1(string(input)))
	fmt.Printf("\nAnswer to part 2 is: [%d]", part2(string(input)))
}

func part1(input string) int {
	parts := strings.Split(input, ", ")

	x, y := 0, 0
	currentDirection := North

	for _, part := range parts {
		direction := part[0:1]
		distance, _ := strconv.Atoi(part[1:])

		currentDirection = directionMap[direction][currentDirection]

		switch currentDirection {
		case North:
			y += distance
		case East:
			x += distance
		case South:
			y -= distance
		case West:
			x -= distance
		}
	}

	return manhattanDistance(x, y)
}

func part2(input string) int {
	parts := strings.Split(input, ", ")

	currentDirection := North
	visited := map[coordinate]bool{
		{0, 0}: true,
	}
	x, y := 0, 0

	for _, part := range parts {
		direction := part[0:1]
		distance, _ := strconv.Atoi(part[1:])

		currentDirection = directionMap[direction][currentDirection]

		for i := 0; i < distance; i++ {
			switch currentDirection {
			case "N":
				y += 1
			case "E":
				x += 1
			case "S":
				y -= 1
			case "W":
				x -= 1
			}

			coord := coordinate{x, y}

			if visited[coord] {
				return manhattanDistance(x, y)
			}

			visited[coord] = true
		}
	}

	return 0
}

func manhattanDistance(x, y int) int {
	if x < 0 {
		x = -x
	}
	if y < 0 {
		y = -y
	}
	return x + y
}
