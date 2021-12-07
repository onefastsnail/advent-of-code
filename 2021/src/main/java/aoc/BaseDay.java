package aoc;

public class BaseDay extends Day<Integer> {

  public static void main(String[] args) {
    var puzzle = new BaseDay(
        "src/main/resources/base-day.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public BaseDay(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    return Integer.parseInt(rawPuzzleInput.get(0));
  }

  public Integer getAnswerPart2() {
    return Integer.parseInt(rawPuzzleInput.get(1));
  }
}
