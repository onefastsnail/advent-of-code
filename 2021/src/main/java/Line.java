import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.IntStream;

public class Line {

  public Point start;
  public Point end;
  public List<Point> points = new ArrayList<>();

  public Line(Point start, Point end) {
    this.start = start;
    this.end = end;

    fill();
  }

  private void fill() {
    if (Objects.equals(start.x, end.x)) {
      var a = Math.min(start.y, end.y);
      var b = Math.max(start.y, end.y);
      IntStream.range(a, b + 1).forEach(i -> points.add(new Point(start.x, i)));
    } else if (Objects.equals(start.y, end.y)) {
      var a = Math.min(start.x, end.x);
      var b = Math.max(start.x, end.x);
      IntStream.range(a, b + 1).forEach(i -> points.add(new Point(i, start.y)));
    } else {
      var a = Math.min(start.y, end.y);
      var b = Math.max(start.y, end.y);
      var x =  a == start.y ? start.x : end.x;
      var ys = IntStream.range(a, b + 1).toArray();

      for (int y : ys) {
        points.add(new Point(x, y));

        // Which direction? We always walk down the line.
        if (a == start.y) {
          if(start.x < end.x) {
            x++;
          }
          else {
            x--;
          }
        } else {
          if(start.x > end.x) {
            x++;
          }
          else {
            x--;
          }
        }
      }
    }
  }
}
