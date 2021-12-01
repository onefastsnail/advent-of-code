import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

class BaseDayTest {

  @Nested
  class Teaser {

    Day puzzle = new BaseDay(
        "src/main/resources/base-day.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 1);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 2);
    }
  }

  @Nested
  class Real {

    Day puzzle = new BaseDay(
        "src/main/resources/base-day.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 1);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 2);
    }
  }


}