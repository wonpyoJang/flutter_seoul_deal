import '../card/card.dart';

enum Player { A, B }

class NumberOfAKind {
  final int count;
  final CardRank rank;

  NumberOfAKind({required this.count, required this.rank});

  @override
  bool operator ==(Object other) {
    if (other is NumberOfAKind) {
      return count == other.count && rank == other.rank;
    }
    return false;
  }

  @override
  int get hashCode => count.hashCode ^ rank.hashCode;
}

class Dealer {
  void getWinner() {
    print('Player A wins!');
  }

  static List<NumberOfAKind> count(List<Card> cards) {
    final Map<CardRank, int> rankCount = {};

    for (var card in cards) {
      rankCount[card.rank] = (rankCount[card.rank] ?? 0) + 1;
    }

    final result = rankCount.entries
        .map((rankAndCount) =>
            NumberOfAKind(count: rankAndCount.value, rank: rankAndCount.key))
        .toList();

    result.sort((a, b) => b.count.compareTo(a.count));

    return result;
  }

  static bool isStraint(List<Card> cards) {
    final ranks = cards.map((card) => card.rank).toList();
    ranks.sort((a, b) => a.rank.compareTo(b.rank));

    for (var i = 0; i < ranks.length - 1; i++) {
      if (ranks[i].rank + 1 != ranks[i + 1].rank) {
        return false;
      }
    }

    return true;
  }

  static bool isAceHighStraight(List<Card> cards) {
    final ranks = cards.map((card) => card.rank).toList();
    ranks.sort((a, b) => b.rank.compareTo(a.rank));

    return ranks[0].rank == CardRank.ace.rank &&
        ranks[1].rank == CardRank.king.rank &&
        ranks[2].rank == CardRank.queen.rank &&
        ranks[3].rank == CardRank.jack.rank &&
        ranks[4].rank == CardRank.ten.rank;
  }

  static bool isAllSameShape(List<Card> cards) {
    for (int i = 0; i < cards.length - 1; i++) {
      if (cards[i].shape != cards[i + 1].shape) {
        return false;
      }
    }

    return true;
  }
}
