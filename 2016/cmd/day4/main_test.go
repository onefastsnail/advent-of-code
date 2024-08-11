package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPart1(t *testing.T) {
	tests := []struct {
		in  string
		out int
	}{
		{"aaaaa-bbb-z-y-x-123[abxyz]", 1},
		{"a-b-c-d-e-f-g-h-987[abcde]", 1},
		{"not-a-real-room-404[oarel]", 1},
		{"totally-real-room-200[decoy]", 0},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part1(tt.in)

			assert.Equal(t, tt.out, actual)
		})
	}
}

func TestPart2(t *testing.T) {
	tests := []struct {
		in  string
		out int
	}{
		{"R8, R4, R4, R8", 4},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part2(tt.in)

			assert.Equal(t, tt.out, actual)
		})
	}
}
