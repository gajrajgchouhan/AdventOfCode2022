// --- Day 1: Part 02 ---
// https://adventofcode.com/2022/day/1

import 'dart:io';
import 'package:advent_of_code_2022/day01_part02.dart';
import 'package:test/test.dart';

final input = File('test/data/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(201491));
    });
  });
}
