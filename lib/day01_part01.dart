// --- Day 1: 01 ---
// https://adventofcode.com/2022/day/1

import 'dart:math';

int solveA(Iterable<String> input) {
  return input.join(",").split(",,").fold(
      0,
      (value, element) => max(
          value,
          element
              .split(",")
              .map((e) => int.parse(e))
              .reduce((value, element) => value + element)));
}
