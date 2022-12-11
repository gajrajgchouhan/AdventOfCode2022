import 'dart:io';
import 'package:http/http.dart' as http;

const year = '2022';

void main(List<String> args) async {
  if (args.length != 1) {
    print('Please call with: <dayNumber>');
    return;
  }

  final dayNumber = args[0];
  final paddedDayNumber = dayNumber.padLeft(2, '0');

  final data = await http
      .get(Uri.parse('https://adventofcode.com/$year/day/$dayNumber/input'));

  // Create empty test data file
  final dataPath = 'test/data/day$paddedDayNumber.txt';
  File(dataPath).writeAsStringSync(data.body);

  for (int i = 1; i <= 2; i++) {
    final partNumber = i.toString().padLeft(2, '0');
    // Create lib file
    final dayFileName = 'day${paddedDayNumber}_part$partNumber.dart';

    File('lib/$dayFileName').writeAsStringSync(
      '''
// --- Day $dayNumber: $partNumber ---
// https://adventofcode.com/$year/day/$dayNumber

int solveA(Iterable<String> input) {
  return 0;
}
    ''',
    );

    // Create unit tests
    File(
      'test/day${paddedDayNumber}_part${partNumber}_test.dart',
    ).writeAsString(
      '''
// --- Day $dayNumber: Part $partNumber ---
// https://adventofcode.com/$year/day/$dayNumber

import 'dart:io';
import 'package:advent_of_code_$year/$dayFileName';
import 'package:test/test.dart';

final input = File('$dataPath').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  });
}
    ''',
    );
  }
}
