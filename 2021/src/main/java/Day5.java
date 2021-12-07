import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class Day5 extends Day<Integer> {

  public static void main(String[] args) {
    var puzzle = new Day5(
        "src/main/resources/day5.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day5(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    var lines = parseInput(rawPuzzleInput);
    var grid = new Grid(lines.size(), lines.size());

    grid.draw(lines);

    return grid.countOverlaps(1);
  }

  public Integer getAnswerPart2() {
    var lines = parseInput(rawPuzzleInput);
    var grid = new Grid(lines.size(), lines.size());
    grid.draw(lines);

    return grid.countOverlaps(1);
  }

  private List<Line> parseInput(List<String> input){
    return input.stream()
        .map(i ->
            Arrays.stream(i.split(" -> "))
                .map(j -> Arrays.stream(j.split(","))
                    .map(Integer::parseInt).toList())
                .map(h -> new Point(h.get(0), h.get(1))).toList()).toList()
        .stream().map(i -> new Line(i.get(0), i.get(1)))
        .toList();
  }
}
