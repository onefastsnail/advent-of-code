package aoc;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Day7 extends Day<Integer> {

  public static void main(String[] args) {
    var puzzle = new Day7("src/main/resources/day7.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day7(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    var input = parsePuzzleInput(rawPuzzleInput);

    // Find the median, the middle point of the sequence where the crabs could meet
    var meetAt = getMedian(input);

    // How much fuel to get each crab there
    var fuelCost = input.stream().reduce(0, (a, b) -> Math.abs(b - meetAt) + a);

    return fuelCost;
  }

  public Integer getAnswerPart2() {
    var input = parsePuzzleInput(rawPuzzleInput);

    // Find the mean as the large numbers play a large factor due to change in fuel cost logic
    // So now not the center of the sequence but rather then middle of the range between smallest and largest
    var meetAt = Math.round(input.stream().reduce(0, Integer::sum) / input.size());

    var fuelCost = input.stream().reduce(0, (a, b) -> {
      var stepsNeeded = Math.abs(b - meetAt);
      var fuel = IntStream.range(1, stepsNeeded + 1).reduce(0, Integer::sum);
      return a + fuel;
    });

    return fuelCost;
  }

  static int getMedian(List<Integer> values) {
    // Order the values, mutating but lets fix later
    values.sort(Comparator.comparingInt(a -> a));

    int totalValues = values.size();

    // Check if total number of items is even
    if (totalValues % 2 == 0) {
      // Get the mean of these two middle numbers
      int sumOfMiddleValues = values.get(totalValues / 2) +
          values.get(totalValues / 2 - 1);

      // Calculate the mean of these middle elements
      return sumOfMiddleValues / 2;
    } else {
      // Odd sized list, simple, get the middle element
      return values.get(totalValues / 2);
    }
  }

  static List<Integer> parsePuzzleInput(List<String> puzzleInput) {
    return Arrays.stream(puzzleInput.get(0).split(",")).map(Integer::parseInt)
        .collect(Collectors.toList());
  }
}
