import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.jupiter.api.Test;

public class DiagnosticReportTest {

  List<Integer> bits = Arrays.asList("1000101".split("")).stream().map(Integer::parseInt).collect(
      Collectors.toList());

  List<Integer> bits1 = Arrays.asList("1011101".split("")).stream().map(Integer::parseInt).collect(
      Collectors.toList());

  @Test
  void getLeastPopularBit1() {
    assertEquals(DiagnosticReport.getLeastPopularBit(bits), 1);
  }

  @Test
  void getMostPopularBit0() {
    assertEquals(DiagnosticReport.getMostPopularBit(bits), 0);
  }

  @Test
  void getMostPopularBit1() {
    assertEquals(DiagnosticReport.getMostPopularBit(bits1), 1);
  }

  @Test
  void buildLine(){

    List<List<Integer>> input = Arrays.asList(Arrays.asList(1, 2, 3), Arrays.asList(2, 3, 4), Arrays.asList(3, 4, 5));

    assertEquals(DiagnosticReport.buildLine(0, input), Arrays.asList(1, 2, 3));
    assertEquals(DiagnosticReport.buildLine(1, input), Arrays.asList(2, 3, 4));
    assertEquals(DiagnosticReport.buildLine(2, input), Arrays.asList(3, 4, 5));
  }

  @Test
  void find(){
    List<List<Integer>> input = Arrays.asList(Arrays.asList(1, 1, 1), Arrays.asList(1, 0, 0), Arrays.asList(0, 0, 0));
    List<Integer> expected = Arrays.asList(1, 1, 1);

    assertEquals(DiagnosticReport.find(0, input, DiagnosticReport::getMostPopularBit), expected);
  }
}
