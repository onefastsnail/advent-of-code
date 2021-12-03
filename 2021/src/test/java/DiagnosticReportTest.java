import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.jupiter.api.Test;

public class DiagnosticReportTest {

  List<Integer> bits = Arrays.asList("101110001111".split("")).stream().map(Integer::parseInt).collect(
      Collectors.toList());

  @Test
  void getLeastPopularBit() {
    assertEquals(DiagnosticReport.getLeastPopularBit(bits), 0);
  }

  @Test
  void getMostPopularBit() {
    assertEquals(DiagnosticReport.getMostPopularBit(bits), 1);
  }
}
