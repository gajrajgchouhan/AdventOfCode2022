// --- Day 6: 02 ---
// https://adventofcode.com/2022/day/6

int solveA(Iterable<String> input) {
  var el = input.first;
  const int k = 14;
  Map<String, int> map = {};
  for (int i = 0; i < k - 1; i++) {
    if (map.containsKey(el[i])) {
      map[el[i]] = map[el[i]]! + 1;
    } else {
      map[el[i]] = 1;
    }
  }
  for (int i = k - 1; i < el.length; i++) {
    if (map.containsKey(el[i])) {
      map[el[i]] = map[el[i]]! + 1;
    } else {
      map[el[i]] = 1;
    }
    print(map.keys);
    if (map.keys.length == k) {
      return i + 1;
    } else {
      map[el[i - k + 1]] = map[el[i - k + 1]]! - 1;
      if (map[el[i - k + 1]] == 0) map.remove(el[i - k + 1]);
    }
  }
  return 0;
}
