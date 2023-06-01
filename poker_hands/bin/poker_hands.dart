import 'dart:io';

import 'dealer/dealer.dart';
import 'file_io/file_io.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Usage: dart poker_hands.dart <input.txt>');
    return;
  }

  File file = File(arguments[0]);
  if (file.existsSync()) {
    // 파일이 존재하는 경우
    List<String> lines = file.readAsLinesSync();

    int numberOfPlayerAWins = 0;

    for (String line in lines) {
      final cardsStrings = line.split(' ');

      final playerACards =
          FileIO.getCardsFromStrings(cardsStrings.sublist(0, 5));
      final playerBCards =
          FileIO.getCardsFromStrings(cardsStrings.sublist(5, 10));

      final winner = Dealer.getWinner(playerACards, playerBCards);

      if (winner == Player.A) {
        numberOfPlayerAWins++;
      }
    }

    print(numberOfPlayerAWins);
  } else {
    print('파일이 존재하지 않습니다.');
  }
}
