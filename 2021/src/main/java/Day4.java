public class Day4 extends Day<Integer> {

  public static void main(String[] args) {
    var puzzle = new Day4(
        "src/main/resources/day4.txt");

    System.out.format("Then answer to part 1 is %s \n", puzzle.getAnswerPart1());
    System.out.format("Then answer to part 2 is %s", puzzle.getAnswerPart2());
  }

  public Day4(String puzzleInputPath) {
    super(puzzleInputPath);
  }

  public Integer getAnswerPart1() {
    var game = new Bingo();
    game.load(rawPuzzleInput);
    game.autoPlayToFirstWinner();

    return game.winningScore;
  }

  public Integer getAnswerPart2() {
    var game = new Bingo();
    game.load(rawPuzzleInput);
    game.autoPlayToLastWinner();

    return game.winningScore;
  }
}
