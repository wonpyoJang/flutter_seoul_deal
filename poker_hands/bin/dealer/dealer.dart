import '../card/card.dart';
import '../hands/hand.dart';

enum Player { A, B }

class CountByRank {
  final int count;
  final CardRank rank;

  CountByRank({required this.count, required this.rank});

  @override
  bool operator ==(Object other) {
    if (other is CountByRank) {
      return count == other.count && rank == other.rank;
    }
    return false;
  }

  @override
  int get hashCode => count.hashCode ^ rank.hashCode;
}

class Dealer {
  static List<CountByRank> count(List<Card> cards) {
    final Map<CardRank, int> counter = {};

    for (final card in cards) {
      counter.update(card.rank, (value) => value + 1, ifAbsent: () => 1);
    }

    final List<CountByRank> countByRanks = counter.entries
        .map((rankAndCount) => CountByRank(
              count: rankAndCount.value,
              rank: rankAndCount.key,
            ))
        .toList();

    countByRanks.sort((a, b) => b.count.compareTo(a.count));

    return countByRanks;
  }

  static bool isAceHighStraight(List<Card> cards) {
    final List<CardRank> ranks = cards.map((card) => card.rank).toList();
    ranks.sort((a, b) => b.rank.compareTo(a.rank));

    return ranks[0] == CardRank.ace &&
        ranks[1] == CardRank.king &&
        ranks[2] == CardRank.queen &&
        ranks[3] == CardRank.jack &&
        ranks[4] == CardRank.ten;
  }

  static bool isAllSameShape(List<Card> cards) {
    final List<CardShape> shapes = cards.map((card) => card.shape).toList();

    for (int i = 0; i < shapes.length - 1; i++) {
      if (shapes[i] != shapes[i + 1]) {
        return false;
      }
    }

    return true;
  }

  static bool isStraight(List<Card> cards) {
    final List<CardRank> ranks = cards.map((card) => card.rank).toList();
    ranks.sort((a, b) => b.rank.compareTo(a.rank));

    if (ranks[0] == CardRank.ace && ranks[ranks.length - 1] == CardRank.two) {
      final remoedCard = cards.removeAt(0);
      cards.add(remoedCard);
    }

    for (int i = 0; i < ranks.length - 1; i++) {
      if (ranks[i].rank - 1 != ranks[i + 1].rank) {
        return false;
      }
    }

    return true;
  }

  Hand judgeHands(List<Card> cards) {
    final List<Hand> hands = [
      StraightFlush(),
      FourOfAKind(),
      FullHouse(),
      Flush(),
      Straight(),
      ThreeOfAKind(),
      TwoPair(),
      OnePair(),
      HighCard(),
    ];

    for (final hand in hands) {
      if (hand.validate(cards)) {
        return hand;
      }
    }

    throw Exception('No hand found');
  }

  Player getWinner(List<Card> playerACards, List<Card> playerBCards) {
    final Hand playerAHand = judgeHands(playerACards);
    final Hand playerBHand = judgeHands(playerBCards);

    if (playerAHand.rank > playerBHand.rank) {
      return Player.A;
    } else if (playerAHand.rank < playerBHand.rank) {
      return Player.B;
    } else {
      return playerAHand.isBeatTie(playerACards, playerBCards);
    }
  }
}
