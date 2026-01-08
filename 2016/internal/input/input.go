package input

import (
	"fmt"
	"log"
	"os"
	"path"
	"runtime"
	"strings"
)

func GetInput(day int8) []string {
	_, filename, _, _ := runtime.Caller(0)
	dir := path.Join(path.Dir(filename), ".")

	input, err := os.ReadFile(fmt.Sprintf("%s/puzzles/day%d.txt", dir, day))
	if err != nil {
		log.Fatal(err)
	}

	lines := strings.Split(string(input), "\n")

	return lines
}
