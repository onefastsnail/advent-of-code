import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Day1Part1 extends Day<Integer> {

  public static void main(String[] args) {
    Day1Part1 puzzle = new Day1Part1(
        "src/main/resources/Day1.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day1Part1(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {

    List<Integer> parsedPuzzleInput = parsePuzzleInput(rawPuzzleInput);

    Integer total = IntStream.range(1, parsedPuzzleInput.size()).reduce(0, (count, it) -> {
      Integer previous = parsedPuzzleInput.get(it - 1);
      Integer current = parsedPuzzleInput.get(it);

      if (current > previous) {
        count++;
      }

      return count;
    });

    return total;
  }

  public Integer getAnswerPart2() {
    return Integer.parseInt(rawPuzzleInput.get(1));
  }

  static List<Integer> parsePuzzleInput(List<String> puzzleInput) {
    return puzzleInput.stream().map(Integer::parseInt)
        .collect(Collectors.toList());
  }

}
