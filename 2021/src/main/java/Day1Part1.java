interface Day {
  String solvePart1();
  String solvePart2();
}

public class Day1Part1 implements Day {

  final static String puzzleInputFile = "day1_part1.txt";

  public static void main(String[] args) {
    Day1Part1 puzzle = new Day1Part1();
    System.out.format("The answer to part 1 is %s", puzzle.solvePart1());
  }

  public String solvePart1(){
    return "12";
  }

  public String solvePart2(){
    return "";
  }

}
