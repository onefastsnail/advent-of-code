import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import aoc.Line;
import aoc.Point;

class LineTest {

  @Test
  void fill1() {
    var line = new Line(new Point(0, 0), new Point(3, 0));
    assertEquals(line.points.toString(), "[0,0, 1,0, 2,0, 3,0]");
  }

  @Test
  void fill2() {
    var line = new Line(new Point(0, 8), new Point(2, 6));
    assertEquals(line.points.toString(), "[2,6, 1,7, 0,8]");
  }

  @Test
  void fill3() {
    var line = new Line(new Point(1, 1), new Point(3, 3));
    assertEquals(line.points.toString(), "[1,1, 2,2, 3,3]");
  }

  @Test
  void fill4() {
    var line = new Line(new Point(9, 7), new Point(7, 9));
    assertEquals(line.points.toString(), "[9,7, 8,8, 7,9]");
  }
}