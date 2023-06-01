import '../seven_checker/seven_checker.dart';

bool getDirection(int N) {
  if (N == 1) return true;

  return (getDirection(N - 1) == true && checkSeven(N - 1) == false) ||
      (getDirection(N - 1) == false && checkSeven(N - 1) == true);
}

int solver(int N) {
  if (N == 1) {
    return 1;
  }

  return getDirection(N) == true ? solver(N - 1) + 1 : solver(N - 1) - 1;
}
