// --- Day 2: 02 ---
// https://adventofcode.com/2022/day/2

int solveA(Iterable<String> input) {
  return input.map((e) {
    final String a = e.split(" ")[0];
    final String b = e.split(" ")[1];
    final Map<String, int> scoreMap = {
      "A": 1, // rock
      "B": 2, // paper
      "C": 3, // scissors
    };
    final List<String> all = ["A", "B", "C"];
    final Map<String, String> winner = {"A": "B", "B": "C", "C": "A"};
    int score = 0;
    switch (b) {
      case "X":
        score += 0;
        // lose
        score += scoreMap[all
            .singleWhere((element) => element != a && element != winner[a])]!;
        break;
      case "Y":
        score += 3;
        score += scoreMap[a]!;
        break;
      case "Z":
        score += 6;
        // win
        score += scoreMap[winner[a]]!;
        break;
    }
    return score;
  }).reduce((value, element) => value + element);
}
