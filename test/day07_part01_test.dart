// --- Day 7: Part 01 ---
// https://adventofcode.com/2022/day/7

import 'dart:io';
import 'package:advent_of_code_2022/day07_part01.dart';
import 'package:test/test.dart';

final input = File('test/data/day07.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(1084134));
    });
  });
}
