// --- Day 6: 01 ---
// https://adventofcode.com/2022/day/6

int solveA(Iterable<String> input) {
  var el = input.first;
  Map<String, int> map = {};
  for (int i = 0; i < 3; i++) {
    if (map.containsKey(el[i])) {
      map[el[i]] = map[el[i]]! + 1;
    } else {
      map[el[i]] = 1;
    }
  }
  for (int i = 3; i < el.length; i++) {
    if (map.containsKey(el[i])) {
      map[el[i]] = map[el[i]]! + 1;
    } else {
      map[el[i]] = 1;
    }
    if (map.keys.length == 4) {
      return i + 1;
    } else {
      map[el[i - 3]] = map[el[i - 3]]! - 1;
      if (map[el[i - 3]] == 0) map.remove(el[i - 3]);
    }
  }
  return 0;
}
