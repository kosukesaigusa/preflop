import '../../entity/preflop.dart';

/// [PreflopRank] の拡張クラス。
extension PreflopRankExtension on PreflopRank {
  /// 表示用のテキストを取得する。
  String get displayText => switch (this) {
    RankedPreflopRank(:final rank) => 'Rank $rank',
    FoldPreflopRank() => 'Fold',
  };
}
