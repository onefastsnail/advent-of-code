import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

class Day4Test {

  @Nested
  class Teaser {

    Day puzzle = new Day4(
        "src/main/resources/day4-part1-teaser.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 4512);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 1924);
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day4(
        "src/main/resources/day4.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 28082);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 8224);
    }
  }
}