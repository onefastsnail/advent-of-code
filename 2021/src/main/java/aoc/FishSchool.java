package aoc;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/*
This took time to figure out but was fun... :sweat-smile:

The previous implementation of building the array won't work naturally due to continuing growth and size.

So now we hold a cycle state of how many fish are in each stage of the cycle.
And by the end of any interval we can count the fish from the sum of all fish across the stages.

First setup initial state with the amount of fish at each stage in the cycle.

Then iterate the cycle. So an iteration is a time advancing, moving fish through the cycle, ever closer to stage 0 for breeding.

We know fish at stage 0 will breed, so we grab those and move to the end of the list, essentially as babies.

The parents heading back to stage 6 to start all over again, so we increment the number of parents to that stage.
This is important to actually create growth.
Without the fish count would not grow.
 */

public class FishSchool {
  // Setup the cycle with no fish initially
  public List<BigInteger> cycle = new ArrayList<>(Collections.nCopies(9, new BigInteger("0")));

  public FishSchool(List<Integer> initialState){
    // Place the initial fish into the cycle
    for (var fish: initialState) {
      increment(fish, new BigInteger("1"));
    }
  }

  public void tick(Integer howMuch){
    for (int i = 0; i < howMuch; i++) {
      // Fish on cycle stage 0 now breed
      // Grab them and move to the end to start at the cycle stage 8
      var first = cycle.get(0);
      cycle.remove(0);
      cycle.add(first);

      // The important part!
      // As the fish above (stage 0) are breeding, they head back to cycle stage 6 to start all over again
      // We increment the fish count at cycle stage 0 to effectively create breed growth
      increment(6, new BigInteger(first.toString()));
    }
  }

  private void increment(Integer index, BigInteger value){
    cycle.set(index, cycle.get(index).add(value));
  }

  public BigInteger getCount(){
    return cycle.stream().reduce(BigInteger::add).get();
  }
}
