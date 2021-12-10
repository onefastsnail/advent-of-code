package aoc;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

public class DiagnosticReport {

  public List<List<Integer>> bits;

  public DiagnosticReport(List<List<Integer>> bits) {
    this.bits = bits;
  }

  public Integer calculatePowerConsumption() {
    Integer width = bits.get(0).size();
    List<List<Integer>> newBits = new ArrayList<>();
    List<Integer> mostCommonBits = new ArrayList<>();
    List<Integer> leastCommonBits = new ArrayList<>();

    for (int i = 0; i < width; i++) {
      newBits.add(new ArrayList<>());

      for (var bit : bits) {
        Integer value = bit.get(i);
        newBits.get(i).add(value);
      }

      mostCommonBits.add(getMostPopularBit(newBits.get(i)));
      leastCommonBits.add(getLeastPopularBit(newBits.get(i)));
    }

    var gammaRate = lineToNumber(mostCommonBits);
    var epsilonRate = lineToNumber(leastCommonBits);

    return gammaRate * epsilonRate;
  }

  public Integer calculateLifeSupportRating() {
    var oxygenList = find(0, bits, DiagnosticReport::getMostPopularBit);
    var oxygenRating = lineToNumber(oxygenList);

    var co2List = find(0, bits, DiagnosticReport::getLeastPopularBit);
    var co2Rating = lineToNumber(co2List);

    return oxygenRating * co2Rating;
  }

  public static List<Integer> find(final Integer index, final List<List<Integer>> list,
      Function<List<Integer>, Integer> getPopularFn) {
    var line = buildLine(index, list);
    var popular = getPopularFn.apply(line);

    List<List<Integer>> newList = new ArrayList<>();
    for (var integers : list) {
      if (integers.get(index) == popular) {
        newList.add(integers);
      }
    }

    if (newList.size() == 1) {
      return newList.get(0);
    }

    return find(index + 1, newList, getPopularFn);
  }

  public static List<Integer> buildLine(Integer i, final List<List<Integer>> list) {
    List<Integer> x = new ArrayList<>();

    for (var integers : list) {
      x.add(integers.get(i));
    }

    return x;
  }

  public static Integer getLeastPopularBit(final List<Integer> a) {
    var ones = a.stream().filter(i -> i == 1).toList().size();
    var zeros = a.stream().filter(i -> i == 0).toList().size();

    if (zeros <= ones) {
      return 0;
    }

    return 1;
  }

  public static Integer getMostPopularBit(final List<Integer> a) {
    var ones = a.stream().filter(i -> i == 1).toList().size();
    var zeros = a.stream().filter(i -> i == 0).toList().size();

    if (ones >= zeros) {
      return 1;
    }

    return 0;
  }

  public static Integer lineToNumber(final List<Integer> list) {
    var line = list.stream().map(String::valueOf).toList();

    return Integer.parseInt(line.stream().reduce("", (a, b) -> a + b), 2);
  }
}
