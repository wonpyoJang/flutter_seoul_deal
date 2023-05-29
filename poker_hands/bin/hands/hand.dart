import '../card/card.dart';
import '../dealer/dealer.dart';

abstract class Hand {
  Hand({required this.rank});

  final int rank;

  bool validate(List<Card> cards);

  Player beatTie(List<Card> playerACards, List<Card> playerBCards);
}

/// * 와일드카드가 존재하지 않으므로 FiveOfAKind는 존재하지 않는다.
class FiveOfAKind extends Hand {
  FiveOfAKind() : super(rank: 10);

  @override
  bool validate(List<Card> cards) {
    throw UnimplementedError();
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    throw "와일드카드가 존재하지 않음";
  }
}

class RoyalFlush extends Hand {
  RoyalFlush() : super(rank: 10);

  @override
  bool validate(List<Card> cards) {
    if (Dealer.isStraight(cards) == false) {
      return false;
    }

    if (Dealer.isAllSameShape(cards) == false) {
      return false;
    }

    return Dealer.isAceHighStraight(cards);
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    throw "모양 간에는 rank가 존재하지 않고, 문제에 조건에 따르면 같은 우선순위가 같은 패는 입력에 존재하지 않음";
  }
}

class StraightFlush extends Hand {
  StraightFlush() : super(rank: 9);

  @override
  bool validate(List<Card> cards) {
    if (Dealer.isStraight(cards) == false) {
      return false;
    }

    return Dealer.isAllSameShape(cards);
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
    playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));

    return playerACards[0].rank.rank > playerBCards[0].rank.rank
        ? Player.A
        : Player.B;
  }
}

class FourOfAKind extends Hand {
  FourOfAKind() : super(rank: 8);

  @override
  bool validate(List<Card> cards) {
    return Dealer.count(cards).first.count == 4;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    final playerACount = Dealer.count(playerACards);
    final playerBCount = Dealer.count(playerBCards);

    if (playerACount.first.rank.rank == playerBCount.first.rank.rank) {
      return playerACount[1].rank.rank > playerBCount[1].rank.rank
          ? Player.A
          : Player.B;
    } else {
      return playerACount.first.rank.rank > playerBCount.first.rank.rank
          ? Player.A
          : Player.B;
    }
  }
}

class FullHouse extends Hand {
  FullHouse() : super(rank: 7);

  @override
  bool validate(List<Card> cards) {
    final result = Dealer.count(cards);

    return result.length == 2 &&
        result.first.count == 3 &&
        result[1].count == 2;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    final playerACount = Dealer.count(playerACards);
    final playerBCount = Dealer.count(playerBCards);

    if (playerACount.first.rank.rank == playerBCount.first.rank.rank) {
      return playerACount[1].rank.rank > playerBCount[1].rank.rank
          ? Player.A
          : Player.B;
    } else {
      return playerACount.first.rank.rank > playerBCount.first.rank.rank
          ? Player.A
          : Player.B;
    }
  }
}

class Flush extends Hand {
  Flush() : super(rank: 6);

  @override
  bool validate(List<Card> cards) {
    return Dealer.isAllSameShape(cards);
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
    playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));

    for (int i = 0; i < playerACards.length; ++i) {
      if (playerACards[i].rank.rank != playerBCards[i].rank.rank) {
        return playerACards[i].rank.rank > playerBCards[i].rank.rank
            ? Player.A
            : Player.B;
      }
    }
    throw "문제의 조건상 있을 수 없는 조건입니다.";
  }
}

class Straight extends Hand {
  Straight() : super(rank: 5);

  @override
  bool validate(List<Card> cards) {
    return Dealer.isStraight(cards);
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
    playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));

    return playerACards[0].rank.rank > playerBCards[0].rank.rank
        ? Player.A
        : Player.B;
  }
}

class ThreeOfAKind extends Hand {
  ThreeOfAKind() : super(rank: 4);

  @override
  bool validate(List<Card> cards) {
    final countResult = Dealer.count(cards);
    return countResult.length > 2 &&
        countResult.first.count == 3 &&
        countResult[1].count != 2;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    final playerACount = Dealer.count(playerACards);
    final playerBCount = Dealer.count(playerBCards);

    if (playerACount.first.rank.rank == playerBCount.first.rank.rank) {
      playerACards.removeWhere(
          (card) => card.rank.rank == playerACount.first.rank.rank);
      playerBCards.removeWhere(
          (card) => card.rank.rank == playerBCount.first.rank.rank);
      playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
      playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
      for (int i = 0; i < playerACards.length; ++i) {
        if (playerACards[i].rank.rank != playerBCards[i].rank.rank) {
          return playerACards[i].rank.rank > playerBCards[i].rank.rank
              ? Player.A
              : Player.B;
        }
      }
      throw "문제의 조건상 있을 수 없는 케이스입니다.";
    } else {
      return playerACount.first.rank.rank > playerBCount.first.rank.rank
          ? Player.A
          : Player.B;
    }
  }
}

class TwoPair extends Hand {
  TwoPair() : super(rank: 3);

  @override
  bool validate(List<Card> cards) {
    final countResult = Dealer.count(cards);
    return countResult.length > 1 &&
        countResult.first.count == 2 &&
        countResult[1].count == 2;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    final playerACount = Dealer.count(playerACards);
    final playerBCount = Dealer.count(playerBCards);

    if (playerACount.first.rank.rank == playerBCount.first.rank.rank) {
      if (playerACount[1].rank.rank == playerBCount[1].rank.rank) {
        playerACards.removeWhere((card) =>
            card.rank.rank == playerACount.first.rank.rank ||
            card.rank.rank == playerACount[1].rank.rank);
        playerBCards.removeWhere((card) =>
            card.rank.rank == playerBCount.first.rank.rank ||
            card.rank.rank == playerBCount[1].rank.rank);
        playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
        playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
        return playerACards[0].rank.rank > playerBCards[0].rank.rank
            ? Player.A
            : Player.B;
      } else {
        return playerACount[1].rank.rank > playerBCount[1].rank.rank
            ? Player.A
            : Player.B;
      }
    } else {
      return playerACount.first.rank.rank > playerBCount.first.rank.rank
          ? Player.A
          : Player.B;
    }
  }
}

class OnePair extends Hand {
  OnePair() : super(rank: 2);

  @override
  bool validate(List<Card> cards) {
    final countResult = Dealer.count(cards);
    return countResult.length > 1 &&
        countResult.first.count == 2 &&
        countResult[1].count != 2;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    final playerACount = Dealer.count(playerACards);
    final playerBCount = Dealer.count(playerBCards);

    if (playerACount.first.rank.rank == playerBCount.first.rank.rank) {
      playerACards.removeWhere(
          (card) => card.rank.rank == playerACount.first.rank.rank);
      playerBCards.removeWhere(
          (card) => card.rank.rank == playerBCount.first.rank.rank);
      playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
      playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));

      for (int i = 0; i < playerACards.length; ++i) {
        if (playerACards[i].rank.rank != playerBCards[i].rank.rank) {
          return playerACards[i].rank.rank > playerBCards[i].rank.rank
              ? Player.A
              : Player.B;
        }
      }
      throw "문제의 조건상 있을 수 없는 케이스입니다.";
    } else {
      return playerACount.first.rank.rank > playerBCount.first.rank.rank
          ? Player.A
          : Player.B;
    }
  }
}

class HighCard extends Hand {
  HighCard() : super(rank: 1);

  @override
  bool validate(List<Card> cards) {
    final countResult = Dealer.count(cards);
    final isStraight = Dealer.isStraight(cards);
    return countResult.first.count == 1 && isStraight == false;
  }

  @override
  Player beatTie(List<Card> playerACards, List<Card> playerBCards) {
    playerACards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));
    playerBCards.sort((a, b) => b.rank.rank.compareTo(a.rank.rank));

    for (int i = 0; i < playerACards.length; ++i) {
      if (playerACards[i].rank.rank != playerBCards[i].rank.rank) {
        return playerACards[i].rank.rank > playerBCards[i].rank.rank
            ? Player.A
            : Player.B;
      }
    }
    throw "문제의 조건상 있을 수 없는 케이스입니다.";
  }
}
