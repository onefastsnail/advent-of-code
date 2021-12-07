import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import aoc.Day;
import aoc.Day2;

class Day2Test {

  @Nested
  class Teaser {

    Day puzzle = new Day2(
        "src/main/resources/day2-part1-teaser.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 150);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 900);
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day2(
        "src/main/resources/day2.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 1815044);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 1739283308);
    }
  }


}