import '../card/card.dart';
import '../dealer/dealer.dart';

abstract class Hand {
  Hand({required this.rank});

  final int rank;

  bool validate(List<Card> cards);
}

/// * 와일드카드가 존재하지 않으므로 FiveOfAKind는 존재하지 않는다.
class FiveOfAKind extends Hand {
  FiveOfAKind() : super(rank: 10);

  @override
  bool validate(List<Card> cards) {
    throw UnimplementedError();
  }
}

class RoyalFlush extends Hand {
  RoyalFlush() : super(rank: 10);

  @override
  bool validate(List<Card> cards) {
    if (Dealer.isStraint(cards) == false) {
      return false;
    }

    if (Dealer.isAllSameShape(cards) == false) {
      return false;
    }

    return Dealer.isAceHighStraight(cards);
  }
}

class StraightFlush extends Hand {
  StraightFlush() : super(rank: 9);

  @override
  bool validate(List<Card> cards) {
    if (Dealer.isStraint(cards) == false) {
      return false;
    }

    return Dealer.isAllSameShape(cards);
  }
}

class FourOfAKind extends Hand {
  FourOfAKind() : super(rank: 8);

  @override
  bool validate(List<Card> cards) {
    return Dealer.count(cards).first.count == 4;
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
}

class Flush extends Hand {
  Flush() : super(rank: 6);

  @override
  bool validate(List<Card> cards) {
    return Dealer.isAllSameShape(cards);
  }
}

class Straight extends Hand {
  Straight() : super(rank: 5);

  @override
  bool validate(List<Card> cards) {
    return Dealer.isStraint(cards);
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
}

class HighCard extends Hand {
  HighCard() : super(rank: 1);

  @override
  bool validate(List<Card> cards) {
    final countResult = Dealer.count(cards);
    final isStraight = Dealer.isStraint(cards);
    return countResult.first.count == 1 && isStraight == false;
  }
}
