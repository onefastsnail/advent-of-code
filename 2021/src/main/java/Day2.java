import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.javatuples.Pair;

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
    List<Pair<String, Integer>> steps = parsePuzzleInput(rawPuzzleInput);

    Plotter myPlotter = new Plotter();
    myPlotter.plot(steps);

    return myPlotter.xPos * myPlotter.yPos;
  }


  public Integer getAnswerPart2() {
    List<Pair<String, Integer>> steps = parsePuzzleInput(rawPuzzleInput);

    Plotter myPlotter = new Plotter();
    myPlotter.plotV2(steps);

    return myPlotter.xPos * myPlotter.yPos;
  }

  static List<Pair<String, Integer>> parsePuzzleInput(List<String> puzzleInput) {
    return puzzleInput.stream().map(i -> {
      List<String> parts = Arrays.asList(i.split(" "));
      String a = parts.get(0);
      Integer b = Integer.parseInt(parts.get(1));
      return new Pair<>(a, b);
    }).collect(Collectors.toList());
  }

}
