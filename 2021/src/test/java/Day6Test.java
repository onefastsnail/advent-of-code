import static org.junit.jupiter.api.Assertions.assertEquals;

import aoc.Day6;
import java.math.BigInteger;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import aoc.Day;

class Day6Test {

  @Nested
  class Teaser {

    Day puzzle = new Day6(
        "src/main/resources/day6-part1-teaser.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), 5934);
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), new BigInteger("26984457539"));
    }
  }

  @Nested
  class Real {

    Day puzzle = new Day6(
        "src/main/resources/day6.txt");

    @Test
    void getAnswerPart1() {
      assertEquals(puzzle.getAnswerPart1(), new BigInteger("360610"));
    }

    @Test
    void getAnswerPart2() {
      assertEquals(puzzle.getAnswerPart2(), new BigInteger("1631629590423"));
    }
  }
}