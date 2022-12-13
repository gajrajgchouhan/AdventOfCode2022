// --- Day 5: Part 01 ---
// https://adventofcode.com/2022/day/5

import 'dart:io';
import 'package:advent_of_code_2022/day05_part01.dart';
import 'package:test/test.dart';

final input = File('test/data/day05.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals("TLNGFGMFN"));
    });
  });
}
