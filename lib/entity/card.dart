/// カードのランク（数字）。
enum Rank { ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two }

/// カードのマーク（スペード、ハート、ダイヤ、クラブ）。
enum Mark { spade, heart, diamond, club }

/// 52 種類のカードの列挙。
enum Card {
  aceSpade,
  aceHeart,
  aceDiamond,
  aceClub,
  kingSpade,
  kingHeart,
  kingDiamond,
  kingClub,
  queenSpade,
  queenHeart,
  queenDiamond,
  queenClub,
  jackSpade,
  jackHeart,
  jackDiamond,
  jackClub,
  tenSpade,
  tenHeart,
  tenDiamond,
  tenClub,
  nineSpade,
  nineHeart,
  nineDiamond,
  nineClub,
  eightSpade,
  eightHeart,
  eightDiamond,
  eightClub,
  sevenSpade,
  sevenHeart,
  sevenDiamond,
  sevenClub,
  sixSpade,
  sixHeart,
  sixDiamond,
  sixClub,
  fiveSpade,
  fiveHeart,
  fiveDiamond,
  fiveClub,
  fourSpade,
  fourHeart,
  fourDiamond,
  fourClub,
  threeSpade,
  threeHeart,
  threeDiamond,
  threeClub,
  twoSpade,
  twoHeart,
  twoDiamond,
  twoClub;

  /// 当該カードのランクを取得する。
  Rank get rank {
    switch (this) {
      case Card.aceSpade:
      case Card.aceHeart:
      case Card.aceDiamond:
      case Card.aceClub:
        return Rank.ace;
      case Card.kingSpade:
      case Card.kingHeart:
      case Card.kingDiamond:
      case Card.kingClub:
        return Rank.king;
      case Card.queenSpade:
      case Card.queenHeart:
      case Card.queenDiamond:
      case Card.queenClub:
        return Rank.queen;
      case Card.jackSpade:
      case Card.jackHeart:
      case Card.jackDiamond:
      case Card.jackClub:
        return Rank.jack;
      case Card.tenSpade:
      case Card.tenHeart:
      case Card.tenDiamond:
      case Card.tenClub:
        return Rank.ten;
      case Card.nineSpade:
      case Card.nineHeart:
      case Card.nineDiamond:
      case Card.nineClub:
        return Rank.nine;
      case Card.eightSpade:
      case Card.eightHeart:
      case Card.eightDiamond:
      case Card.eightClub:
        return Rank.eight;
      case Card.sevenSpade:
      case Card.sevenHeart:
      case Card.sevenDiamond:
      case Card.sevenClub:
        return Rank.seven;
      case Card.sixSpade:
      case Card.sixHeart:
      case Card.sixDiamond:
      case Card.sixClub:
        return Rank.six;
      case Card.fiveSpade:
      case Card.fiveHeart:
      case Card.fiveDiamond:
      case Card.fiveClub:
        return Rank.five;
      case Card.fourSpade:
      case Card.fourHeart:
      case Card.fourDiamond:
      case Card.fourClub:
        return Rank.four;
      case Card.threeSpade:
      case Card.threeHeart:
      case Card.threeDiamond:
      case Card.threeClub:
        return Rank.three;
      case Card.twoSpade:
      case Card.twoHeart:
      case Card.twoDiamond:
      case Card.twoClub:
        return Rank.two;
    }
  }

  /// 当該カードのマークを取得する。
  Mark get mark {
    switch (this) {
      case Card.aceSpade:
      case Card.kingSpade:
      case Card.queenSpade:
      case Card.jackSpade:
      case Card.tenSpade:
      case Card.nineSpade:
      case Card.eightSpade:
      case Card.sevenSpade:
      case Card.sixSpade:
      case Card.fiveSpade:
      case Card.fourSpade:
      case Card.threeSpade:
      case Card.twoSpade:
        return Mark.spade;
      case Card.aceHeart:
      case Card.kingHeart:
      case Card.queenHeart:
      case Card.jackHeart:
      case Card.tenHeart:
      case Card.nineHeart:
      case Card.eightHeart:
      case Card.sevenHeart:
      case Card.sixHeart:
      case Card.fiveHeart:
      case Card.fourHeart:
      case Card.threeHeart:
      case Card.twoHeart:
        return Mark.heart;
      case Card.aceDiamond:
      case Card.kingDiamond:
      case Card.queenDiamond:
      case Card.jackDiamond:
      case Card.tenDiamond:
      case Card.nineDiamond:
      case Card.eightDiamond:
      case Card.sevenDiamond:
      case Card.sixDiamond:
      case Card.fiveDiamond:
      case Card.fourDiamond:
      case Card.threeDiamond:
      case Card.twoDiamond:
        return Mark.diamond;
      case Card.aceClub:
      case Card.kingClub:
      case Card.queenClub:
      case Card.jackClub:
      case Card.tenClub:
      case Card.nineClub:
      case Card.eightClub:
      case Card.sevenClub:
      case Card.sixClub:
      case Card.fiveClub:
      case Card.fourClub:
      case Card.threeClub:
      case Card.twoClub:
        return Mark.club;
    }
  }

  /// 当該カードの一意な ID を取得する。
  ///
  /// 例："ace-spade"
  String get id => '${rank.name}-${mark.name}';
}
