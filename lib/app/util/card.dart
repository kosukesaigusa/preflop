import 'package:flutter/material.dart';

import '../../entity/card.dart' as card;
import '../../gen/assets.gen.dart';

/// [card.Rank] の拡張クラス。
extension RankExtension on card.Rank {
  /// [card.Rank] の文字列表示を取得する。
  String get displayText => switch (this) {
    card.Rank.ace => 'A',
    card.Rank.king => 'K',
    card.Rank.queen => 'Q',
    card.Rank.jack => 'J',
    card.Rank.ten => 'T',
    card.Rank.nine => '9',
    card.Rank.eight => '8',
    card.Rank.seven => '7',
    card.Rank.six => '6',
    card.Rank.five => '5',
    card.Rank.four => '4',
    card.Rank.three => '3',
    card.Rank.two => '2',
  };
}

/// [card.Mark] の拡張クラス。
extension MarkExtension on card.Mark {
  /// [card.Mark] の色を取得する。
  Color get color => switch (this) {
    card.Mark.spade => Colors.black,
    card.Mark.heart => Colors.red,
    card.Mark.diamond => Colors.red,
    card.Mark.club => Colors.black,
  };
}

/// [card.Card] の拡張クラス。
extension CardExtension on card.Card {
  /// カードのマークに対応する SVG 画像を取得する。
  SvgGenImage get svg => switch (mark) {
    card.Mark.spade => Assets.svg.spade,
    card.Mark.heart => Assets.svg.heart,
    card.Mark.diamond => Assets.svg.diamond,
    card.Mark.club => Assets.svg.club,
  };
}
