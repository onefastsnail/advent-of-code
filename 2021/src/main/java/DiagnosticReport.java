import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

public class DiagnosticReport {
  public List<List<Integer>> bits;
  public Integer gammaRate = 0;
  public Integer epsilonRate = 0;
  public Integer oxygenRating = 0;
  public Integer co2Rating = 0;

  public DiagnosticReport(List<List<Integer>> rawBits){
    bits = rawBits;
  }

  public Integer calculatePowerConsumption(){
    Integer width = bits.get(0).size();
    List<List<Integer>> newBits = new ArrayList<>();
    List<String> mostCommonBits = new ArrayList<>();
    List<String> leastCommonBits = new ArrayList<>();

    for (int i = 0; i < width; i++) {
      newBits.add(new ArrayList<>());

      for (int j = 0; j < bits.size(); j++) {
       Integer value = bits.get(j).get(i);
       newBits.get(i).add(value);
      }

      mostCommonBits.add(getMostPopularBit(newBits.get(i)).toString());
      leastCommonBits.add(getLeastPopularBit(newBits.get(i)).toString());

    }

   gammaRate = Integer.parseInt(mostCommonBits.stream().reduce("", (a, b) -> {
     return a + b;
   }), 2);

    epsilonRate = Integer.parseInt(leastCommonBits.stream().reduce("", (a, b) -> {
      return a + b;
    }), 2 );

    return gammaRate * epsilonRate;
  }

  public Integer calculateLifeSupportRating(){
    List<Integer> oxygenList = find(0, bits, DiagnosticReport::getMostPopularBit);
    oxygenRating = lineToNumber(oxygenList);

    List<Integer> co2List = find(0, bits, DiagnosticReport::getLeastPopularBit);
    co2Rating = lineToNumber(co2List);

    return oxygenRating * co2Rating;
  }

  public static List<Integer> find(final Integer index, final List<List<Integer>> list, Function<List<Integer>, Integer> getPopularFn){
    List<Integer> line = buildLine(index, list);
    Integer popular = getPopularFn.apply(line);

    List<List<Integer>> newList = new ArrayList<>();
    for (int i = 0; i < list.size(); i++) {
      if(list.get(i).get(index) == popular){
        newList.add(list.get(i));
      }
    }

    if(newList.size() == 1){
      return newList.get(0);
    }

    return find(index + 1, newList, getPopularFn);
  }

  public static List<Integer> buildLine(Integer i, final List<List<Integer>> list){
    List<Integer> x = new ArrayList<>();

    for (int j = 0; j < list.size(); j++) {
      x.add(list.get(j).get(i));
    }

    return x;
  }

  public static Integer getLeastPopularBit(final List<Integer> a) {
    Integer ones = a.stream().filter(i -> i == 1).collect(Collectors.toList()).size();
    Integer zeros = a.stream().filter(i -> i == 0).collect(Collectors.toList()).size();

    if(zeros <= ones){
      return 0;
    }

    return 1;
  }

  public static Integer getMostPopularBit(final List<Integer> a) {
    Integer ones = a.stream().filter(i -> i == 1).collect(Collectors.toList()).size();
    Integer zeros = a.stream().filter(i -> i == 0).collect(Collectors.toList()).size();

    if(ones >= zeros){
      return 1;
    }

    return 0;
  }

  public static Integer lineToNumber(final List<Integer> list){
    List<String> line = list.stream().map(i -> String.valueOf(i)).collect(Collectors.toList());

    return Integer.parseInt(line.stream().reduce("", (a, b) -> {
      return a + b;
    }), 2);
  }
}
