package aoc;

import java.util.List;

public class Plotter {

  public Integer xPos = 0;
  public Integer yPos = 0;
  public Integer aim = 0;

  public record Command(String direction, int amount) {}

  public void plot(List<Command> steps) {
    steps.forEach(step -> {
      String dir = step.direction();
      Integer unit = step.amount();

      if (dir.equals("forward")) {
        xPos += unit;
      }

      if (dir.equals("up")) {
        yPos -= unit;
      }

      if (dir.equals("down")) {
        yPos += unit;
      }
    });
  }

  public void plotV2(List<Command> steps) {
    steps.forEach(step -> {
      String dir = step.direction();
      Integer unit = step.amount();

      if (dir.equals("forward")) {
        xPos += unit;
        yPos += aim * unit;
      }

      if (dir.equals("up")) {
        aim -= unit;
      }

      if (dir.equals("down")) {
        aim += unit;
      }
    });
  }
}
