package aoc;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.List;

public class Day6 extends Day<BigInteger> {

  public static void main(String[] args) {
    var puzzle = new Day6(
        "src/main/resources/day6.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day6(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public BigInteger getAnswerPart1() {
    var state = parseInput(rawPuzzleInput);
    var school = new FishSchool(state);
    school.tick(80);

    return school.getCount();
  }

  public BigInteger getAnswerPart2() {
    var state = parseInput(rawPuzzleInput);
    var school = new FishSchool(state);
    school.tick(256);

    return school.getCount();
  }

  private List<Integer> parseInput(List<String> input){
    return Arrays.stream(input.get(0).split(",")).map(Integer::parseInt).toList();
  }
}
