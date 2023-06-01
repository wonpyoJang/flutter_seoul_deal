import 'pingpong/solver/solver.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print("실행방법을 확인해주세요");
  }
  int result = solver(int.parse(arguments[0]));

  print(result);
}
