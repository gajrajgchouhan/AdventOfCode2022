// --- Day 1: 02 ---
// https://adventofcode.com/2022/day/1

int solveA(Iterable<String> input) {
  return (input
          .join(",")
          .split(",,")
          .map<int>((element) => element
              .split(",")
              .map((e) => int.parse(e))
              .reduce((value, element) => value + element))
          .toList()
        ..sort())
      .reversed
      .toList()
      .take(3)
      .fold<int>(0, (previousValue, element) => previousValue + element);
}
