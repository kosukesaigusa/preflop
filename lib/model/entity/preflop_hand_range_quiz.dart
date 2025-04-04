import 'package:freezed_annotation/freezed_annotation.dart';

import 'hand.dart';
import 'preflop.dart';

part 'preflop_hand_range_quiz.freezed.dart';

/// プリフロップのハンドレンジクイズエンティティ。
@freezed
sealed class PreflopHandRangeQuiz with _$PreflopHandRangeQuiz {
  /// 回答済みのクイズ。
  const factory PreflopHandRangeQuiz.answered({
    required Hand hand,
    required PreflopHandRangeMatrix matrix,
    required PreflopRank answeredRank,
  }) = AnsweredPreflopHandRangeQuiz;

  /// 未回答のクイズ。
  const factory PreflopHandRangeQuiz.unanswered({required Hand hand}) =
      UnansweredPreflopHandRangeQuiz;

  const PreflopHandRangeQuiz._();

  /// クイズに正解したかどうかを返す。
  ///
  /// 未回答の場合は `false` を返す。
  bool get isCorrect => switch (this) {
    AnsweredPreflopHandRangeQuiz(:final hand, :final matrix, :final answeredRank) =>
      matrix.getRank(hand.asPreflopHand) == answeredRank,
    UnansweredPreflopHandRangeQuiz() => false,
  };
}
