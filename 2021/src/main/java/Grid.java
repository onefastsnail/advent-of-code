import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.IntStream;

public class Grid {
  List<List<Point>> matrix;
  List<Line> lines = new ArrayList<>();

  public Grid(Integer width, Integer height){
    make(width, height);
  }

  public void draw(Line newLine) {
    lines.add(newLine);
  }

  public void draw(List<Line> newLines) {
    for (var line: newLines) {
      draw(line);
    }
  }

  public HashMap<String, Integer> findOverlaps(){
    HashMap<String, Integer> overlaps = new HashMap<>();

    for (var line: lines) {
      for (var point: line.points) {
        var key = String.format("%d,%d", point.x, point.y);

        if(!overlaps.containsKey(key)) {
          overlaps.put(key, 1);
        }
        else{
          overlaps.put(key, overlaps.get(key) + 1);
        }
      }
    }

    return overlaps;
  }

  public Integer countOverlaps(Integer greaterThan){
    AtomicInteger counter = new AtomicInteger();
    findOverlaps().forEach((k, v) -> {
      if(v > greaterThan){
        counter.getAndIncrement();
      }
    });

    return counter.get();
  }

  private void make(Integer width, Integer height){
    matrix = new ArrayList<>(height);
    IntStream.range(0, height).forEach(i -> matrix.add(new ArrayList<>(width)));
  }
}
