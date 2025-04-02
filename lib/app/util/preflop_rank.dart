import 'package:flutter/material.dart';

import '../../entity/preflop.dart';

/// [PreflopRank] の拡張クラス。
extension PreflopRankExtension on PreflopRank {
  /// 表示用のテキストを取得する。
  String get displayText {
    if (rank <= 0) {
      return 'Fold';
    }
    return 'Rank $rank';
  }

  /// 当該ランクの表示色を取得する。
  Color get color {
    final rgb = int.parse(colorCode.substring(1), radix: 16);
    return Color(0xFF000000 | rgb);
  }
}
