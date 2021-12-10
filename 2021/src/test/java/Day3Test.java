import static org.junit.jupiter.api.Assertions.assertEquals;

import aoc.Day;
import aoc.Day3;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

class Day3Test {

  @Nested
  class Teaser {

    Day puzzle = new Day3(
        "src/main/resources/day3-part1-teaser.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 198);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 230);
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day3(
        "src/main/resources/day3.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 4191876);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), 3414905);
    }
  }


}