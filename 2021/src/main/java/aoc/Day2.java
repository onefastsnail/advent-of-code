package aoc;

import java.util.List;
import java.util.stream.Collectors;
import aoc.Plotter.Command;

public class Day2 extends Day<Integer> {

  public static void main(String[] args) {
    Day2 puzzle = new Day2(
        "src/main/resources/day2.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day2(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    var steps = parsePuzzleInput(rawPuzzleInput);

    Plotter myPlotter = new Plotter();
    myPlotter.plot(steps);

    return myPlotter.xPos * myPlotter.yPos;
  }


  public Integer getAnswerPart2() {
    var steps = parsePuzzleInput(rawPuzzleInput);

    Plotter myPlotter = new Plotter();
    myPlotter.plotV2(steps);

    return myPlotter.xPos * myPlotter.yPos;
  }

  static List<Command> parsePuzzleInput(List<String> puzzleInput) {
    return puzzleInput.stream().map(i -> {
      var parts = i.split(" ");
      return new Command(parts[0], Integer.parseInt(parts[1]));
    }).collect(Collectors.toList());
  }

}
