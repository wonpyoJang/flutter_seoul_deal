enum CardShape {
  diamond(symbol: 'D'),
  heart(symbol: 'H'),
  spade(symbol: 'S'),
  clover(symbol: 'C');

  const CardShape({required this.symbol});

  final String symbol;
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

  final int rank;
  final String symbol;
}

class Card {
  CardRank rank;
  CardShape shape;

  Card({required this.rank, required this.shape});
}
