import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/hand.dart';
import '../../../model/entity/preflop.dart';
import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/entity/quize_review_filter.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../style/color.dart';
import '../../style/typography.dart';
import '../../util/card.dart';
import '../../widget/package_info_text.dart';
import '../../widget/preflop_hand_range_matrix_dropdown.dart';
import '../../widget/rank_display.dart';
import '../matrix/matrix_page.dart';
import '../review/review_page.dart';

/// クイズを表示するページ。
class QuizPage extends HookConsumerWidget {
  /// クイズを表示するページを作成する。
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // クイズ一覧を取得する。
    final quizzes = ref.watch(preflopHandRangeQuizzzesNotifierProvider);

    // クイズ一覧の Notifier を取得する。
    final notifier = ref.read(preflopHandRangeQuizzzesNotifierProvider.notifier);

    // 最後のクイズを取得する。
    final latestQuiz = quizzes.lastOrNull;

    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);

    // 選択中のハンドレンジをローカル状態で管理する。
    final selectedRange = useState<PreflopHandRangeMatrix>(availableRanges.first);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              final currentPreflopHand = quizzes.lastOrNull?.hand.asPreflopHand;
              // 現在のハンドレンジを指定して、ハンドレンジ表ページに遷移する。
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder:
                      (context) => MatrixPage(
                        highlightedHand: currentPreflopHand,
                        initialSelectedMatrix: selectedRange.value,
                      ),
                  fullscreenDialog: true,
                ),
              );
            },
            tooltip: 'ハンドレンジを確認する',
            child: const Icon(Icons.grid_on),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            _QuizStatusCard.correct(
              quizzes: quizzes,
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder:
                          (context) => const ReviewPage(initialFilter: QuizeReviewFilter.correct),
                      fullscreenDialog: true,
                    ),
                  ),
            ),
            _QuizStatusCard.incorrect(
              quizzes: quizzes,
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder:
                          (context) => const ReviewPage(initialFilter: QuizeReviewFilter.incorrect),
                      fullscreenDialog: true,
                    ),
                  ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: switch (latestQuiz) {
              UnansweredPreflopHandRangeQuiz(:final hand) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    spacing: 32,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: PreflopHandRangeMatrixDropdown(
                          availableRanges: availableRanges,
                          selectedValue: selectedRange.value,
                          onChanged: (newValue) {
                            if (newValue != null) {
                              selectedRange.value = newValue;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('このハンドのランクは？', style: context.headlineSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _Hand(hand),
                      ),
                      SizedBox(
                        height: 180,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final rank in selectedRange.value.preflopRanks)
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: RankDisplay.answerButton(
                                    rank: rank,
                                    onPressed:
                                        () => notifier.answer(
                                          matrix: selectedRange.value,
                                          answeredRank: rank,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnsweredPreflopHandRangeQuiz(:final hand, :final answeredRank) =>
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      spacing: 32,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: latestQuiz.isCorrect ? '🎉' : '😢',
                                  style: const TextStyle(fontFamily: 'Apple Color Emoji'),
                                ),
                                TextSpan(
                                  text: ' ${latestQuiz.isCorrect ? '正解！' : '不正解'}',
                                  style: context.displaySmall.copyWith(
                                    color: latestQuiz.isCorrect ? AppColor.green : AppColor.red,
                                  ),
                                ),
                              ],
                            ),
                            style: context.displaySmall.copyWith(
                              color: latestQuiz.isCorrect ? AppColor.green : AppColor.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _Hand(hand),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            alignment: WrapAlignment.center,
                            children: [
                              Column(
                                spacing: 12,
                                children: [
                                  Text('正解', style: context.titleMedium),
                                  // 正解ランクを matrix と hand から導出して表示する。
                                  RankDisplay.readOnly(
                                    rank: latestQuiz.matrix.getRank(latestQuiz.hand.asPreflopHand),
                                  ),
                                ],
                              ),
                              if (!latestQuiz.isCorrect)
                                Column(
                                  spacing: 12,
                                  children: [
                                    Text('あなたの回答', style: context.titleMedium),
                                    RankDisplay.readOnly(rank: answeredRank),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _NextQuizButton(onPressed: notifier.generate),
                        ),
                      ],
                    ),
                  ),
                ),
              null => const SizedBox.shrink(),
            },
          ),
          const Positioned(left: 24, bottom: 24, child: PackageInfoText()),
        ],
      ),
    );
  }
}

/// ハンドの 2 枚のカードをトランプのカードの見た目として表示するウィジェット。
class _Hand extends StatelessWidget {
  /// ハンドの 2 枚のカードをトランプのカードの見た目として表示するウィジェットを生成する。
  const _Hand(this.hand);

  final Hand hand;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.darkBlueGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.grey),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          for (final card in hand.cards)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  card.svg.svg(
                    width: 40,
                    height: 40,
                    colorFilter: ColorFilter.mode(card.mark.color, BlendMode.srcIn),
                  ),
                  const Gap(8),
                  Text(
                    card.rank.displayText,
                    style: context.headlineMedium.copyWith(
                      color: card.mark.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// 次の問題へ進むボタン。
class _NextQuizButton extends StatelessWidget {
  /// 次の問題へ進むボタンを作成する。
  const _NextQuizButton({required this.onPressed});

  /// ボタン押下時のコールバック。
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.gold,
          foregroundColor: AppColor.white,
          elevation: 8,
          shadowColor: AppColor.gold.withValues(alpha: 0.5),
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          textStyle: context.titleLarge,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            const Text('次の問題へ'),
            Transform.rotate(angle: -0.2, child: const Icon(Icons.rocket_launch_rounded, size: 32)),
          ],
        ),
      ),
    );
  }
}

/// クイズの回答状況の種類。
enum _QuizStatusType {
  /// 正解。
  correct,

  /// 不正解。
  incorrect,
}

/// ステータスを表示するカード。
class _QuizStatusCard extends StatelessWidget {
  /// ステータスを表示するカードを作成する。
  const _QuizStatusCard.correct({required this.quizzes, required this.onTap})
    : _type = _QuizStatusType.correct;

  /// ステータスを表示するカードを作成する。
  const _QuizStatusCard.incorrect({required this.quizzes, required this.onTap})
    : _type = _QuizStatusType.incorrect;

  /// クイズ一覧。
  final List<PreflopHandRangeQuiz> quizzes;

  /// タップした際のコールバック。
  final VoidCallback onTap;

  /// ステータスの種類。
  final _QuizStatusType _type;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: AppColor.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.darkBlueGrey,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.grey),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(_type == _QuizStatusType.correct ? '正解' : '不正解', style: context.titleSmall),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('$_count', style: context.titleSmall.copyWith(color: _color)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 色を取得する。
  Color get _color => switch (_type) {
    _QuizStatusType.correct => AppColor.green,
    _QuizStatusType.incorrect => AppColor.red,
  };

  /// 回答の正解または不正解の数を取得する。
  int get _count =>
      quizzes
          .whereType<AnsweredPreflopHandRangeQuiz>()
          .where((q) => _type == _QuizStatusType.correct ? q.isCorrect : !q.isCorrect)
          .length;
}
