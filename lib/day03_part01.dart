// --- Day 3: 01 ---
// https://adventofcode.com/2022/day/3

extension Case on String {
  // isuppercase
  bool isUpperCase() {
    int ascii = codeUnitAt(0);
    return ascii >= 65 && ascii <= 90;
  }

  // islowercase
  bool isLowerCase() {
    int ascii = codeUnitAt(0);
    return ascii >= 97 && ascii <= 122;
  }
}

int solveA(Iterable<String> input) {
  return input.map((e) {
    final f = e.substring(0, e.length ~/ 2).split("").toSet();
    final s = e.substring(e.length ~/ 2, e.length).split("").toSet();
    final found = f.firstWhere((element) => s.contains(element));
    return found.toLowerCase().codeUnitAt(0) -
        'a'.codeUnitAt(0) +
        (found.isUpperCase() ? 26 : 0) +
        1;
  }).reduce((value, element) => value + element);
}
