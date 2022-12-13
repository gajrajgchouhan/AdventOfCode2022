// --- Day 5: Part 02 ---
// https://adventofcode.com/2022/day/5

import 'dart:io';
import 'package:advent_of_code_2022/day05_part02.dart';
import 'package:test/test.dart';

final input = File('test/data/day05.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals("FGLQJCMBD"));
    });
  });
}
