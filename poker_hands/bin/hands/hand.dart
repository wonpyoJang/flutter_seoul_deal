enum Hand {
  highCard(1),
  onePair(2),
  twoPair(3),
  threeOfAKind(4),
  straight(5),
  flush(6),
  fullHouse(7),
  fourOfAKind(8),
  straightFlush(9),
  royalFlush(10),

  Hands({required this.rank});

  final int rank;
}
