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
		{"ULL\nRRDDD\nLURDL\nUUUUD", 1985},
		{"UULLULLUULLLURDLDUURRDRRLDURDULLRURDUDULLLUULURURLRDRRRRULDRUULLLLUUDURDULDRRDRUDLRRLDLUDLDDRURURUURRRDDDLLRUDURDULUULLRRULLRULDUDRDRLDLURURUDDUDLURUDUDURLURURRURLUDDRURRDLUURLLRURRDUDLULULUDULDLLRRRDLRDLDUDRDDDRRUURRRRRUURRDRRDLURDRRURDLLUULULLRURDLDDDRRLLRRUURULURUUDDLRRUDDRURUUDLRLRDLRURRRDULLDLRUDDUULRDULURUURDULUDLLRRLDDLRDLRUDRLDDRLRRRDURDULLRRRDRRLUURURDRRDRRLDLUDURURLDUURDRUDRDDRLDRRLDLURURULLUURUDUUDLRLL\nLLLULLULDDULRLLURLLLRUUDDLRUULRLULLDLLRRDRLRLRLLDRUUURULDRDDLUDLLDUDULLLRLULLLRULDRDRUDLLRLRLLUDULRRRLDRUULDDULLDULULLUDUDLDRDURDLDLLDUDRRRDLUURRUURULLURLDURLRRLLDDUUULDRLUUDUDLURLULUDURRDRLLDDDDDRRULLRLDULULDDRUURRDLUDDDUDURDDRDRULULLLLUURDURUUUULUDLRURRULRDDRURURLLRLUUDUUURDLLDDLUDRLLLUDLLLLULRLURDRRRDUUDLLDLDDDURRDDRURUURDDRURRLDDDURDLLUURUUULRLUURRUDRLLDLURDUDRLULDLRLULULUDDLRDUDRUDLUULUULDURDRRRRLRULLUDRDDRDLDUDRDRRLDLLLLUDDLRULDLLDDUULDDRRULRRUURUDRDURLLLDDUUDRUUDLULLDR\nUDUUULLDDDDLUDLDULRLRDLULLDDRULDURRLURRUDLRRUDURRDUDRRRUULRLLRLUDLDRRDUURDDRDRDUUUDUDLDLLRRLUURLUUUDDDUURLULURRLURRRDRDURURUDRLRUURUDRUDDDRDRDLDRDURDLDRRDUUDLLURLDDURRRLULDRDRLLRLLLRURLDURDRLDRUURRLDLDRLDDDRLDLRLDURURLLLLDDRDUDLRULULLRDDLLUDRDRRLUUULDRLDURURDUDURLLDRRDUULDUUDLLDDRUUULRRULDDUDRDRLRULUUDUURULLDLLURLRRLDDDLLDRRDDRLDDLURRUDURULUDLLLDUDDLDLDLRUDUDRDUDDLDDLDULURDDUDRRUUURLDUURULLRLULUURLLLLDUUDURUUDUULULDRULRLRDULDLLURDLRUUUDDURLLLLDUDRLUUDUDRRURURRDRDDRULDLRLURDLLRRDRUUUURLDRURDUUDLDURUDDLRDDDDURRLRLUDRRDDURDDRLDDLLRR\nULDRUDURUDULLUDUDURLDLLRRULRRULRUDLULLLDRULLDURUULDDURDUUDLRDRUDUDDLDRDLUULRRDLRUULULUUUDUUDDRDRLLULLRRDLRRLUDRLULLUUUUURRDURLLRURRULLLRLURRULRDUURRLDDRRDRLULDDRRDRLULLRDLRRURUDURULRLUDRUDLUDDDUDUDDUDLLRDLLDRURULUDRLRRULRDDDDDRLDLRRLUUDLUURRDURRDLDLDUDRLULLULRLDRDUDLRULLULLRLDDRURLLLRLDDDLLLRURDDDLLUDLDLRLUULLLRULDRRDUDLRRDDULRLLDUURLLLLLDRULDRLLLUURDURRULURLDDLRRUDULUURRLULRDRDDLULULRRURLDLRRRUDURURDURDULURULLRLDD\nDURLRRRDRULDLULUDULUURURRLULUDLURURDDURULLRRUUDLRURLDLRUDULDLLRRULLLLRRLRUULDLDLLRDUDLLRLULRLLUUULULRDLDLRRURLUDDRRLUUDDRRUDDRRURLRRULLDDULLLURRULUDLRRRURRULRLLLRULLRRURDRLURULLDULRLLLULLRLRLLLDRRRRDDDDDDULUUDUDULRURDRUDRLUULURDURLURRDRRRRDRRLLLLUDLRRDURURLLULUDDLRLRLRRUURLLURLDUULLRRDURRULRULURLLLRLUURRULLLURDDDRURDUDDULLRULUUUDDRURUUDUURURRDRURDUDRLLRRULURUDLDURLDLRRRRLLUURRLULDDDUUUURUULDLDRLDUDULDRRULDRDULURRUURDU", 45973},
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
		out string
	}{
		{"ULL\nRRDDD\nLURDL\nUUUUD", "5DB3"},
		{"UULLULLUULLLURDLDUURRDRRLDURDULLRURDUDULLLUULURURLRDRRRRULDRUULLLLUUDURDULDRRDRUDLRRLDLUDLDDRURURUURRRDDDLLRUDURDULUULLRRULLRULDUDRDRLDLURURUDDUDLURUDUDURLURURRURLUDDRURRDLUURLLRURRDUDLULULUDULDLLRRRDLRDLDUDRDDDRRUURRRRRUURRDRRDLURDRRURDLLUULULLRURDLDDDRRLLRRUURULURUUDDLRRUDDRURUUDLRLRDLRURRRDULLDLRUDDUULRDULURUURDULUDLLRRLDDLRDLRUDRLDDRLRRRDURDULLRRRDRRLUURURDRRDRRLDLUDURURLDUURDRUDRDDRLDRRLDLURURULLUURUDUUDLRLL\nLLLULLULDDULRLLURLLLRUUDDLRUULRLULLDLLRRDRLRLRLLDRUUURULDRDDLUDLLDUDULLLRLULLLRULDRDRUDLLRLRLLUDULRRRLDRUULDDULLDULULLUDUDLDRDURDLDLLDUDRRRDLUURRUURULLURLDURLRRLLDDUUULDRLUUDUDLURLULUDURRDRLLDDDDDRRULLRLDULULDDRUURRDLUDDDUDURDDRDRULULLLLUURDURUUUULUDLRURRULRDDRURURLLRLUUDUUURDLLDDLUDRLLLUDLLLLULRLURDRRRDUUDLLDLDDDURRDDRURUURDDRURRLDDDURDLLUURUUULRLUURRUDRLLDLURDUDRLULDLRLULULUDDLRDUDRUDLUULUULDURDRRRRLRULLUDRDDRDLDUDRDRRLDLLLLUDDLRULDLLDDUULDDRRULRRUURUDRDURLLLDDUUDRUUDLULLDR\nUDUUULLDDDDLUDLDULRLRDLULLDDRULDURRLURRUDLRRUDURRDUDRRRUULRLLRLUDLDRRDUURDDRDRDUUUDUDLDLLRRLUURLUUUDDDUURLULURRLURRRDRDURURUDRLRUURUDRUDDDRDRDLDRDURDLDRRDUUDLLURLDDURRRLULDRDRLLRLLLRURLDURDRLDRUURRLDLDRLDDDRLDLRLDURURLLLLDDRDUDLRULULLRDDLLUDRDRRLUUULDRLDURURDUDURLLDRRDUULDUUDLLDDRUUULRRULDDUDRDRLRULUUDUURULLDLLURLRRLDDDLLDRRDDRLDDLURRUDURULUDLLLDUDDLDLDLRUDUDRDUDDLDDLDULURDDUDRRUUURLDUURULLRLULUURLLLLDUUDURUUDUULULDRULRLRDULDLLURDLRUUUDDURLLLLDUDRLUUDUDRRURURRDRDDRULDLRLURDLLRRDRUUUURLDRURDUUDLDURUDDLRDDDDURRLRLUDRRDDURDDRLDDLLRR\nULDRUDURUDULLUDUDURLDLLRRULRRULRUDLULLLDRULLDURUULDDURDUUDLRDRUDUDDLDRDLUULRRDLRUULULUUUDUUDDRDRLLULLRRDLRRLUDRLULLUUUUURRDURLLRURRULLLRLURRULRDUURRLDDRRDRLULDDRRDRLULLRDLRRURUDURULRLUDRUDLUDDDUDUDDUDLLRDLLDRURULUDRLRRULRDDDDDRLDLRRLUUDLUURRDURRDLDLDUDRLULLULRLDRDUDLRULLULLRLDDRURLLLRLDDDLLLRURDDDLLUDLDLRLUULLLRULDRRDUDLRRDDULRLLDUURLLLLLDRULDRLLLUURDURRULURLDDLRRUDULUURRLULRDRDDLULULRRURLDLRRRUDURURDURDULURULLRLDD\nDURLRRRDRULDLULUDULUURURRLULUDLURURDDURULLRRUUDLRURLDLRUDULDLLRRULLLLRRLRUULDLDLLRDUDLLRLULRLLUUULULRDLDLRRURLUDDRRLUUDDRRUDDRRURLRRULLDDULLLURRULUDLRRRURRULRLLLRULLRRURDRLURULLDULRLLLULLRLRLLLDRRRRDDDDDDULUUDUDULRURDRUDRLUULURDURLURRDRRRRDRRLLLLUDLRRDURURLLULUDDLRLRLRRUURLLURLDUULLRRDURRULRULURLLLRLUURRULLLURDDDRURDUDDULLRULUUUDDRURUUDUURURRDRURDUDRLLRRULURUDLDURLDLRRRRLLUURRLULDDDUUUURUULDLDRLDUDULDRRULDRDULURRUURDU", "27CA4"},
	}

	for _, tt := range tests {
		t.Run(tt.in, func(t *testing.T) {
			actual := part2(tt.in)

			assert.Equal(t, tt.out, actual)
		})
	}
}
