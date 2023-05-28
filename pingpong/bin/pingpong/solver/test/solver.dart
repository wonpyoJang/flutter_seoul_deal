import 'package:test/test.dart';

import '../solver.dart';

void main() {
  test('solver', () {
    expect(solver(1), 1);
    expect(solver(2), 2);
    expect(solver(3), 3);
    expect(solver(8), 6);
    expect(solver(22), 0);
    expect(solver(68), 2);
    expect(solver(100), 2);
    expect(solver(103), 5);
  });
}
