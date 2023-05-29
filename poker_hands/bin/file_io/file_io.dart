import '../card/card.dart';

class FileIO {
  static List<Card> getCardsFromStrings(List<String> cardStrings) {
    final List<Card> cards = cardStrings.map((cardString) {
      final shape = cardString[0];
      final rank = cardString[1];

      return Card(
        shape: CardShape.fromSymbol(shape),
        rank: CardRank.fromSymbol(rank),
      );
    }).toList();

    return cards;
  }
}
