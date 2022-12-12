// --- Day 2: Part 02 ---
// https://adventofcode.com/2022/day/2

import 'dart:io';
import 'package:advent_of_code_2022/day02_part02.dart';
import 'package:test/test.dart';

final input = File('test/data/day02.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(12725));
    });
  });
}
