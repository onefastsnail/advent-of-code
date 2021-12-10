package aoc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

public class Grid {

  List<List<Line>> matrix;
  List<Line> lines = new ArrayList<>();

  public Grid(Integer width, Integer height) {
    make(width, height);
  }

  public void draw(Line newLine) {
    lines.add(newLine);
  }

  public void draw(List<Line> newLines) {
    for (var line : newLines) {
      draw(line);
    }
  }

  public Map<String, Integer> findOverlaps() {
    Map<String, Integer> overlaps = new HashMap<>();

    for (var line : lines) {
      for (var point : line.points) {
        var key = String.format("%d,%d", point.x(), point.y());

        if (!overlaps.containsKey(key)) {
          overlaps.put(key, 1);
        } else {
          overlaps.put(key, overlaps.get(key) + 1);
        }
      }
    }

    return overlaps;
  }

  public Integer countOverlaps(Integer greaterThan) {
    return findOverlaps().values().stream().filter(i -> i > greaterThan).toList().size();
  }

  private void make(Integer width, Integer height) {
    matrix = new ArrayList<>(height);
    IntStream.range(0, height).forEach(i -> matrix.add(new ArrayList<>(width)));
  }
}

