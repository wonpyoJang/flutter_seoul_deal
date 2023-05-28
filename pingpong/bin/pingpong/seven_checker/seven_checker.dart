bool isMultipleOfSeven(int integer) {
  if (integer <= 0) {
    assert(false, "양의 정수만 허용합니다.");
  }

  return (integer % 7) == 0;
}

bool hasSeven(int integer) {
  if (integer <= 0) {
    assert(false, "양의 정수만 허용합니다.");
  }

  if (integer % 10 == 7) {
    return true;
  }

  if (integer < 10 && integer != 7) {
    return false;
  }

  return hasSeven(integer ~/ 10);
}

bool checkSeven(int integer) {
  return hasSeven(integer) || isMultipleOfSeven(integer);
}
