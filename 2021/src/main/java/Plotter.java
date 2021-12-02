import java.util.List;
import org.javatuples.Pair;

public class Plotter {

  public Integer xPos = 0;
  public Integer yPos = 0;

  public Plotter() {
  }

  public void plot(List<Pair<String, Integer>> steps) {
    steps.forEach(step -> {
      String dir = step.getValue0();
      Integer unit = step.getValue1();

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
}
