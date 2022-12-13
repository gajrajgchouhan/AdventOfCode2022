// --- Day 5: 01 ---
// https://adventofcode.com/2022/day/5

import 'dart:convert';

String solveA(Iterable<String> input) {
  var st = List<String>.empty(growable: true);
  var ops = List<String>.empty(growable: true);
  bool flag = false;

  for (var line in input) {
    if (line.isEmpty) {
      flag = true;
      continue;
    } else {
      if (flag) {
        ops.add(line);
      } else {
        st.add(line);
      }
    }
  }

  final numberOfStacks = st[0].length ~/ 3;

  final stacks = List<List<String>>.generate(
      numberOfStacks, (index) => List<String>.empty(growable: true));

  for (var i = st.length - 2; i >= 0; i--) {
    int stackNo = 0;
    for (int j = 0; j < st[i].length; j += 4) {
      // [A] [B] [C]
      if (st[i][j + 1] != " ") {
        stacks[stackNo].add(st[i][j + 1]);
      }
      stackNo++;
    }
  }

  ops.forEach((element) {
    final ints = element.split(" ");
    final no = int.parse(ints[1]);
    final from = int.parse(ints[3]) - 1;
    final to = int.parse(ints[5]) - 1;
    for (int i = 0; i < no; i++) {
      stacks[to].add(stacks[from].removeLast());
    }
  });
  return stacks.map((e) => e.isNotEmpty ? e.last : "").join();
}
