public class Point {
  Integer x;
  Integer y;

  public Point(Integer x, Integer y){
    this.x = x;
    this.y = y;
  }

  @Override
  public String toString() {
    return String.format("%d,%d", x, y);
  }
}
