import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public abstract class Day<Part1Answer, Part2Answer> {

  public List<String> puzzleInput;

  public Day(String puzzlePath) {
    readInPuzzleInput(puzzlePath);
  }

  public void readInPuzzleInput(String file) {
    Path path = Paths.get(file);
    try {
      puzzleInput = Files.readAllLines(path);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public abstract Part1Answer getAnswerPart1();

  public abstract Part2Answer getAnswerPart2();
}
