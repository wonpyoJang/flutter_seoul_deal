enum CardShape {
  diamond('D'),
  heart('H'),
  spade('S'),
  clover('C')

  const CardShape({required this.symbol});

  final String symbol; 
}

enum CardRank {
  two(2, '2'),
  three(3, '3'),
  four(4, '4'),
  five(5, '5'),
  six(6, '6'),
  seven(7, '7'),
  eight(8, '8'),
  nine(9, '9'),
  ten(10, 'T'),
  jack(11, 'J'),
  queen(12, 'Q'),
  king(13, 'K'),
  ace(14, 'A'),

  CardRank({required this.rank, required this.symbol}})

  final int rank;
  final String symbol;
}


class Card [
  CardRank rank;
  CardShape shape;

  Card({required this.rank, required this.shape});
]
