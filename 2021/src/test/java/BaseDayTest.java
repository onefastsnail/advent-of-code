import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class BaseDayTest {

  Day puzzle = new BaseDay(
      "src/main/resources/baseDay.txt");

  @Test
  void getAnswerPart1() {
    assertEquals(puzzle.getAnswerPart1(), 1);
  }

  @Test
  void getAnswerPart2() {
    assertEquals(puzzle.getAnswerPart2(), 2);
  }

}