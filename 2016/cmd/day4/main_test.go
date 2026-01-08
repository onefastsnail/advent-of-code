package main

import (
	"2016/internal/input"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPart1Teasers(t *testing.T) {
	tests := []struct {
		in  string
		out int
	}{
		{"aaaaa-bbb-z-y-x-123[abxyz]", 123},
		{"a-b-c-d-e-f-g-h-987[abcde]", 987},
		{"not-a-real-room-404[oarel]", 404},
		{"jrtcbavmrq-ptaql-pbtgvag-qrcyblzrag-715[arbtq]", 0},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part1([]string{tt.in})

			assert.Equal(t, tt.out, actual)
		})
	}
}

func TestPart1(t *testing.T) {
	puzzle := input.GetInput(4)
	actual := part1(puzzle)

	assert.Equal(t, 245102, actual)
}
