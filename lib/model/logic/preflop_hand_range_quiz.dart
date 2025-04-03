import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/hand.dart';
import '../entity/preflop.dart';
import '../entity/preflop_hand_range_quiz.dart';
import 'preflop_hand_range_matrix.dart';

part 'preflop_hand_range_quiz.g.dart';

/// プリフロップのハンドレンジクイズを管理する。
@riverpod
class PreflopHandRangeQuizzzesNotifier extends _$PreflopHandRangeQuizzzesNotifier {
  @override
  List<PreflopHandRangeQuiz> build() {
    // 最初の未回答のクイズを生成する。
    final hand = Hand.random();
    return [PreflopHandRangeQuiz.unanswered(hand: hand, matrix: _getCurrentMatrix())];
  }

  /// プリフロップのハンドレンジクイズを生成する。
  ///
  /// 未回答のクイズとして追加する。
  void generate() {
    final hand = Hand.random();
    state = [...state, PreflopHandRangeQuiz.unanswered(hand: hand, matrix: _getCurrentMatrix())];
  }

  /// 末尾の未回答のクイズに回答する。
  void answer(PreflopRank answeredRank) {
    // 末尾の未回答のクイズを取得する。
    final quiz = state.last;

    switch (quiz) {
      // 未回答のクイズでない場合は何もしない。
      case AnsweredPreflopHandRangeQuiz():
        return;
      case UnansweredPreflopHandRangeQuiz(:final hand):
        // 正解のランクを取得する。
        final correctRank = ref
            .read(preflopHandRangeMatricesNotifierProvider)
            .getRank(hand.asPreflopHand);

        // 回答状態に変換して追加する。
        state = [
          ...state.take(state.length - 1),
          PreflopHandRangeQuiz.answered(
            hand: hand,
            matrix: _getCurrentMatrix(),
            correctRank: correctRank,
            answeredRank: answeredRank,
          ),
        ];
    }
  }

  /// 現在のプリフロップハンドレンジ表を取得する。
  PreflopHandRangeMatrix _getCurrentMatrix() => ref.read(preflopHandRangeMatricesNotifierProvider);
}
