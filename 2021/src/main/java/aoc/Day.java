package aoc;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public abstract class Day<T> {

  public List<String> rawPuzzleInput;

  public Day(String puzzlePath) {
    readInPuzzleInput(puzzlePath);
  }

  public void readInPuzzleInput(String file) {
    Path path = Paths.get(file);
    try {
      rawPuzzleInput = Files.readAllLines(path);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public abstract T getAnswerPart1();

  public abstract T getAnswerPart2();
}
