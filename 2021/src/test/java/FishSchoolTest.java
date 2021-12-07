import static org.junit.jupiter.api.Assertions.assertEquals;

import aoc.FishSchool;
import java.util.List;
import org.junit.jupiter.api.Test;

public class FishSchoolTest {
  @Test
  void initialSetup() {
    var school = new FishSchool(List.of(3, 4, 3, 1, 2));

    // Testing we place the first at the correct location in the cycle
    assertEquals(school.cycle, List.of(0, 1, 1, 2, 1, 0, 0, 0, 0));
  }
}
