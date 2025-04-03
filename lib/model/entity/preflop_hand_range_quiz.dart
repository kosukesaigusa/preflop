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
    required PreflopRank correctRank,
    required PreflopRank answeredRank,
  }) = AnsweredPreflopHandRangeQuiz;

  /// 未回答のクイズ。
  const factory PreflopHandRangeQuiz.unanswered({
    required Hand hand,
    required PreflopHandRangeMatrix matrix,
  }) = UnansweredPreflopHandRangeQuiz;

  const PreflopHandRangeQuiz._();

  /// クイズの回答状態を返す。
  QuizStatus get status => switch (this) {
    AnsweredPreflopHandRangeQuiz(:final correctRank, :final answeredRank) =>
      correctRank == answeredRank ? QuizStatus.correct : QuizStatus.incorrect,
    UnansweredPreflopHandRangeQuiz() => QuizStatus.unanswered,
  };

  /// クイズに正解したかどうかを返す。
  ///
  /// 未回答の場合は `false` を返す。
  bool get isCorrect => switch (this) {
    AnsweredPreflopHandRangeQuiz(:final correctRank, :final answeredRank) =>
      correctRank == answeredRank,
    UnansweredPreflopHandRangeQuiz() => false,
  };
}

/// クイズの回答状態。
enum QuizStatus {
  /// 正解。
  correct,

  /// 不正解。
  incorrect,

  /// 未回答。
  unanswered,
}
