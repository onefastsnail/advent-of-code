import java.util.ArrayList;
import java.util.List;

public class DiagnosticReport {
  public List<List<Integer>> bits;
  public Integer gammaRate = 0;
  public Integer epsilonRate = 0;

  public DiagnosticReport(List<List<Integer>> rawBits){
    bits = rawBits;
  }

  public void run(){
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

  }

  public static Integer getLeastPopularBit(List<Integer> a) {
    Integer popular = 0;

    Integer total = a.stream()
      .reduce(0, Integer::sum);

    if(total < a.size() / 2){
      popular = 1;
    }

    return popular;
  }

  public static Integer getMostPopularBit(List<Integer> a) {
    Integer popular = 0;

    Integer total = a.stream()
        .reduce(0, Integer::sum);

    if(total > a.size() / 2){
      popular = 1;
    }

    return popular;
  }

}
