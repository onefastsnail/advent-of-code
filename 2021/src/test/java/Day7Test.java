import static org.junit.jupiter.api.Assertions.assertEquals;

import aoc.Day;
import aoc.Day7;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

class Day7Test {

  @Nested
  class Teaser {

    Day puzzle = new Day7(
        "src/main/resources/day7-teaser.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 37);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 168);
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day7(
        "src/main/resources/day7.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 342641);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 93006301);
    }
  }
}