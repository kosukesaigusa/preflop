import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/hand.dart';
import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../review_page.dart';
import '../../style/color.dart';
import '../../style/typography.dart';
import '../../util/card.dart';
import '../../widget/package_info_text.dart';
import '../../widget/preflop_hand_range_matrix_dropdown.dart';
import '../../widget/rank_display.dart';
import '../matrix/matrix_page.dart';

/// クイズを表示するページ。
class QuizPage extends ConsumerWidget {
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

    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              final currentPreflopHand = quizzes.lastOrNull?.hand.asPreflopHand;
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => MatrixPage(highlightedHand: currentPreflopHand),
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
            _StatusCard(label: '正解', child: _QuizStatusCounter.correct(quizzes: quizzes)),
            _StatusCard(label: '不正解', child: _QuizStatusCounter.incorrect(quizzes: quizzes)),
            _StatusCard(
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ReviewPage(),
                      fullscreenDialog: true,
                    ),
                  ),
              label: '復習',
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.lightGrey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.history,
                  color: AppColor.lightGrey,
                  size: context.titleSmallLineHeight,
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: PreflopHandRangeMatrixDropdown(),
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
                              for (final rank
                                  in ref
                                      .watch(preflopHandRangeMatricesNotifierProvider)
                                      .preflopRanks)
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: RankDisplay.answerButton(
                                    rank: rank,
                                    onPressed: () => notifier.answer(rank),
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
              AnsweredPreflopHandRangeQuiz(:final hand, :final correctRank, :final answeredRank) =>
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
                                  RankDisplay.readOnly(rank: correctRank),
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
  correct,
  incorrect;

  Color get _color => switch (this) {
    correct => AppColor.green,
    incorrect => AppColor.red,
  };
}

/// クイズの回答状況を表示するカウンターウィジェット。
class _QuizStatusCounter extends StatelessWidget {
  const _QuizStatusCounter.correct({required this.quizzes}) : _type = _QuizStatusType.correct;

  const _QuizStatusCounter.incorrect({required this.quizzes}) : _type = _QuizStatusType.incorrect;

  final List<PreflopHandRangeQuiz> quizzes;
  final _QuizStatusType _type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _type._color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text('$_count', style: context.titleSmall.copyWith(color: _type._color)),
    );
  }

  /// 回答の正解または不正解の数を取得する。
  int get _count =>
      quizzes
          .whereType<AnsweredPreflopHandRangeQuiz>()
          .where((q) => _type == _QuizStatusType.correct ? q.isCorrect : !q.isCorrect)
          .length;
}

/// ステータスを表示するカード。
class _StatusCard extends StatelessWidget {
  /// ステータスを表示するカードを作成する。
  const _StatusCard({required this.label, required this.child, this.onTap});

  /// ラベル。
  final String label;

  /// 右側に表示する UI.
  final Widget child;

  /// タップした際のコールバック。
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          children: [Text(label, style: context.titleSmall), child],
        ),
      ),
    );
  }
}
