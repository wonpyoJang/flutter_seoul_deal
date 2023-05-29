enum CardShape {
  diamond(symbol: 'D'),
  heart(symbol: 'H'),
  spade(symbol: 'S'),
  clover(symbol: 'C');

  const CardShape({required this.symbol});

  final String symbol;

  factory CardShape.fromSymbol(String symbol) {
    switch (symbol) {
      case 'D':
        return CardShape.diamond;
      case 'H':
        return CardShape.heart;
      case 'S':
        return CardShape.spade;
      case 'C':
        return CardShape.clover;
      default:
        throw ArgumentError('Invalid symbol: $symbol');
    }
  }
}

enum CardRank {
  two(rank: 2, symbol: '2'),
  three(rank: 3, symbol: '3'),
  four(rank: 4, symbol: '4'),
  five(rank: 5, symbol: '5'),
  six(rank: 6, symbol: '6'),
  seven(rank: 7, symbol: '7'),
  eight(rank: 8, symbol: '8'),
  nine(rank: 9, symbol: '9'),
  ten(rank: 10, symbol: 'T'),
  jack(rank: 11, symbol: 'J'),
  queen(rank: 12, symbol: 'Q'),
  king(rank: 13, symbol: 'K'),
  ace(rank: 14, symbol: 'A');

  const CardRank({required this.rank, required this.symbol});

  factory CardRank.fromSymbol(String symbol) {
    switch (symbol) {
      case '2':
        return CardRank.two;
      case '3':
        return CardRank.three;
      case '4':
        return CardRank.four;
      case '5':
        return CardRank.five;
      case '6':
        return CardRank.six;
      case '7':
        return CardRank.seven;
      case '8':
        return CardRank.eight;
      case '9':
        return CardRank.nine;
      case 'T':
        return CardRank.ten;
      case 'J':
        return CardRank.jack;
      case 'Q':
        return CardRank.queen;
      case 'K':
        return CardRank.king;
      case 'A':
        return CardRank.ace;
      default:
        throw ArgumentError('Invalid symbol: $symbol');
    }
  }

  final int rank;
  final String symbol;
}

class Card {
  CardRank rank;
  CardShape shape;

  Card({required this.rank, required this.shape});
}
