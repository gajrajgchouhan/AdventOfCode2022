// --- Day 2: 01 ---
// https://adventofcode.com/2022/day/2

int solveA(Iterable<String> input) {
  return input.map((e) {
    final Map<String, String> opponentsMap = {"A": "X", "B": "Y", "C": "Z"};

    final Map<String, int> scoreMap = {
      "X": 1, // rock
      "Y": 2, // paper
      "Z": 3, // scissors
    };

    String a = opponentsMap[e.split(" ")[0]]!;
    String b = e.split(" ")[1];

    int score = scoreMap[b]!;

    if (a == b) {
      score += 3;
    } else {
      if ((a == "X" && b == "Y") ||
          (a == "Y" && b == "Z") ||
          (a == "Z" && b == "X")) {
        score += 6;
      } else {
        score += 0;
      }
    }
    return score;
  }).reduce((value, element) => value + element);
}
