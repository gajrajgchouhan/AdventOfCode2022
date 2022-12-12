// --- Day 3: 02 ---
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
  final elves = 3;
  assert(input.length % elves == 0);
  final l = List<List<String>>.generate(
      input.length ~/ elves, (index) => List<String>.empty(growable: true));

  input.toList().asMap().forEach((i, value) => l[(i ~/ elves)].add(value));

  return l.map((e) {
    return e
        .skip(1)
        .fold(
            e[0].split("").toSet(),
            (previousValue, element) =>
                previousValue.intersection(Set.from(element.split(""))))
        .first;
  }).map((e) {
    return e.toLowerCase().codeUnitAt(0) -
        'a'.codeUnitAt(0) +
        (e.isUpperCase() ? 26 : 0) +
        1;
  }).reduce((value, element) => value + element);
}
