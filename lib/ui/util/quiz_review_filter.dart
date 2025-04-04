import '../../model/entity/quize_review_filter.dart';

/// [QuizeReviewFilter] の拡張メソッド。
extension QuizeReviewFilterExtension on QuizeReviewFilter {
  /// フィルタの種類に応じた表示用の文字列を返す。
  String get displayText {
    return switch (this) {
      QuizeReviewFilter.all => 'すべて',
      QuizeReviewFilter.correct => '正解',
      QuizeReviewFilter.incorrect => '不正解',
    };
  }
}
