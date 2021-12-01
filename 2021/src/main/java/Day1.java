import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Day1 extends Day<Integer> {

  public static void main(String[] args) {
    Day1 puzzle = new Day1(
        "src/main/resources/day1.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day1(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    List<Integer> parsedPuzzleInput = parsePuzzleInput(rawPuzzleInput);
    return countIncreases(parsedPuzzleInput);
  }

  public Integer getAnswerPart2() {
    List<Integer> parsedPuzzleInput = parsePuzzleInput(rawPuzzleInput);
    List<Integer> windowTotals = new ArrayList<>();

    Integer windowSize = 3;
    Integer stepSize = 1;
    Integer start = 0;
    Integer end = windowSize;

    for (int i = 0; i < parsedPuzzleInput.size(); i++) {
      List<Integer> window = parsedPuzzleInput
          .subList(start, Math.min(Math.max(end, 0), parsedPuzzleInput.size()));

      if (window.size() == windowSize) {
        windowTotals.add(window.stream().reduce(0, Integer::sum));
        start += stepSize;
        end = start + windowSize;
      }
    }

    return countIncreases(windowTotals);
  }

  private Integer countIncreases(List<Integer> input) {
    Integer total = IntStream.range(1, input.size()).reduce(0, (count, i) -> {
      Integer previous = input.get(i - 1);
      Integer current = input.get(i);

      if (current > previous) {
        count++;
      }

      return count;
    });

    return total;
  }

  static List<Integer> parsePuzzleInput(List<String> puzzleInput) {
    return puzzleInput.stream().map(Integer::parseInt)
        .collect(Collectors.toList());
  }

}
