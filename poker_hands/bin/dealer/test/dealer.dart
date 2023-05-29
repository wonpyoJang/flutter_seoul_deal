import 'package:test/test.dart';

import '../../card/card.dart';
import '../dealer.dart';

void main() {
  test('count', () {
    expect(
        Dealer.count([
          Card(rank: CardRank.ace, shape: CardShape.clover),
          Card(rank: CardRank.ace, shape: CardShape.diamond),
          Card(rank: CardRank.ace, shape: CardShape.heart),
          Card(rank: CardRank.ace, shape: CardShape.spade),
          Card(rank: CardRank.king, shape: CardShape.clover),
        ]),
        [
          NumberOfAKind(count: 4, rank: CardRank.ace),
          NumberOfAKind(count: 1, rank: CardRank.king)
        ]);
  });

  test('isAceHighStraight', () {
    expect(
        Dealer.isAceHighStraight([
          Card(rank: CardRank.king, shape: CardShape.diamond),
          Card(rank: CardRank.ace, shape: CardShape.clover),
          Card(rank: CardRank.queen, shape: CardShape.heart),
          Card(rank: CardRank.ten, shape: CardShape.clover),
          Card(rank: CardRank.jack, shape: CardShape.spade),
        ]),
        true);
  });
}
