import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Day3 extends Day<Integer> {

  public static void main(String[] args) {
    Day3 puzzle = new Day3(
        "src/main/resources/day3.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day3(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    List<List<Integer>> parsedPuzzleInput = parsePuzzleInput(rawPuzzleInput);
    DiagnosticReport report = new DiagnosticReport(parsedPuzzleInput);

    return report.calculatePowerConsumption();
  }

  public Integer getAnswerPart2() {
    List<List<Integer>> parsedPuzzleInput = parsePuzzleInput(rawPuzzleInput);
    DiagnosticReport report = new DiagnosticReport(parsedPuzzleInput);

    return report.calculateLifeSupportRating();
  }

  static List<List<Integer>> parsePuzzleInput(List<String> puzzleInput) {
    return puzzleInput.stream().map(i -> {
      List<String> parts = Arrays.asList(i.split(""));
      return parts.stream().map(Integer::parseInt)
          .collect(Collectors.toList());
    }).collect(Collectors.toList());
  }

}
