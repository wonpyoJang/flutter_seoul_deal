import 'package:test/test.dart';

import '../seven_checker.dart';

void main() {
  test('isMultipleOf7', () {
    expect(isMultipleOfSeven(1), false);
    expect(isMultipleOfSeven(7), true);
    expect(isMultipleOfSeven(14), true);
    expect(isMultipleOfSeven(15), false);
    expect(isMultipleOfSeven(21), true);
    expect(isMultipleOfSeven(22), false);
    expect(isMultipleOfSeven(101013033939), false);
  });

  test('hasSeven', () {
    expect(hasSeven(1), false);
    expect(hasSeven(7), true);
    expect(hasSeven(14), false);
    expect(hasSeven(15), false);
    expect(hasSeven(17), true);
    expect(hasSeven(21), false);
    expect(hasSeven(22), false);
    expect(hasSeven(227), true);
    expect(hasSeven(272), true);
    expect(hasSeven(722), true);
    expect(hasSeven(222), false);
    expect(hasSeven(7272727777), true);
    expect(hasSeven(222233301010), false);
  });
}
