import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.lang3.tuple.MutablePair;

public class Bingo {

  List<Integer> draw;
  List<Integer> drawn = new ArrayList<>();
  List<Board> boards;
  Integer winningBoardId;
  Set<Integer> winningBoards = new HashSet<>();
  Integer winningScore;

  public Bingo() {
  }

  public void autoPlayToFirstWinner() {
    for (var number : draw) {
      drawn.add(number);

      for (var board : boards) {
        scoreBoard(board, number);
        checkBoard(board);

        if (winningBoardId != null) {
          return;
        }
      }
    }
  }

  public void autoPlayToLastWinner() {
    for (var number : draw) {
      drawn.add(number);

      for (var board : boards) {
        scoreBoard(board, number);
        checkBoardLast(board);

        if (winningBoards.size() == boards.size()) {
          winningScore = board.calculateScore(drawn.get(drawn.size() - 1));
          winningBoardId = board.id;
          return;
        }
      }
    }
  }

  private void scoreBoard(final Board board, Integer drawnNumber) {
    for (int j = 0; j < 5; j++) {
      for (int h = 0; h < 5; h++) {
        var number = board.data.get(j).get(h);
        if (drawnNumber.equals(number.getLeft())) {
          number.setRight(true);
        }
      }
    }
  }

  private void checkBoard(Board board) {
    // Check horizontal winnings
    for (var line : board.data) {
      var winner = line.stream().filter(j -> j.getRight().equals(true)).toList().size() == 5;
      if (winner) {
        winningBoardId = board.id;
        winningScore = board.calculateScore(drawn.get(drawn.size() - 1));
        break;
      }
    }
  }

  private void checkBoardLast(Board board) {
    // Check horizontal winnings
    for (var line : board.data) {
      if (isLineWinner(line)) {
        winningBoards.add(board.id);
        break;
      }
    }

    // Check vertical winnings
    for (int a = 0; a < 5; a++) {
      int finalA = a;
      var column = board.data.stream().map(it -> it.get(finalA)).toList();

      if (isLineWinner(column)) {
        winningBoards.add(board.id);
        break;
      }
    }
  }

  private boolean isLineWinner(List<MutablePair<Integer, Boolean>> line) {
    return line.stream().filter(j -> j.getRight().equals(true)).toList().size() == 5;
  }

  public void load(List<String> input) {
    draw = Arrays.stream(input.get(0).split(",")).map(Integer::parseInt).toList();

    var rawBoards = input.subList(2, input.size()).stream()
        .map(it -> it.replace("  ", " ").split(" ")).map(
            it -> Arrays.stream(it).filter(i -> !i.equals(""))
                .map(i -> new MutablePair<>(Integer.parseInt(i), false)).toList())
        .filter(it -> it.size() > 0).toList();

    boards = splitIntoBoards(5, rawBoards);
  }

  public static List<Board> splitIntoBoards(Integer window,
      final List<List<MutablePair<Integer, Boolean>>> list) {

    List<Board> windows = new ArrayList<>();
    var start = 0;
    var end = window;
    var howMany = list.size() / window;

    for (int i = 0; i < howMany; i++) {
      var board = new Board(i);
      windows.add(board);
      board.data = list.subList(start, end).stream().toList();
      start = end;
      end = Math.min(start + window, list.size());
    }

    return windows;
  }
}
