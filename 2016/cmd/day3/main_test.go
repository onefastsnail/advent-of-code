package main

import (
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPart1(t *testing.T) {
	input, _ := os.ReadFile("input.txt")

	tests := []struct {
		in  string
		out int
	}{
		{"5 10 25", 0},
		{string(input), 1050},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part1(tt.in)

			assert.Equal(t, tt.out, actual)
		})
	}
}

func TestPart2(t *testing.T) {
	input, _ := os.ReadFile("input.txt")

	tests := []struct {
		in  string
		out int
	}{
		{string(input), 1921},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part2(tt.in)

			assert.Equal(t, tt.out, actual)
		})
	}
}
