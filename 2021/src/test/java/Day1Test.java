import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

class Day1Test {

  @Nested
  class Teaser {

    Day puzzle = new Day1Part1(
        "src/main/resources/Day1Part1Teaser.txt");

    @Test
    void getAnswerPart1Teaser() {
      assertEquals(puzzle.getAnswerPart1(), 7);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 200);
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day1Part1(
        "src/main/resources/Day1.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 1665);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 195);
    }
  }


}