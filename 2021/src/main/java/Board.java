import java.util.Collection;
import java.util.List;
import org.apache.commons.lang3.tuple.MutablePair;

public class Board {
  public Integer id;
  public List<List<MutablePair<Integer, Boolean>>> data;

  public Board(Integer id){
    this.id = id;
  }

  public Integer calculateScore(Integer multiplier) {
    var flatBoard = data.stream().flatMap(Collection::stream).toList();
    final int[] total = {0};
    flatBoard.stream().filter(i -> i.getRight().equals(false)).forEach(i -> {
      total[0] += i.getLeft();
    });

    return total[0] * multiplier;
  }
}
