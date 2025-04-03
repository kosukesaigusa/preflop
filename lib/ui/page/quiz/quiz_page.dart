import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/hand.dart';
import '../../../model/entity/preflop.dart';
import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../style/color.dart';
import '../../style/typography.dart';
import '../../util/card.dart';
import '../../widget/package_info_text.dart';
import '../../widget/preflop_hand_range_matrix_dropdown.dart';
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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final currentPreflopHand = quizzes.lastOrNull?.hand.asPreflopHand;
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => MatrixPage(highlightedHand: currentPreflopHand),
              fullscreenDialog: true,
            ),
          );
        },
        tooltip: 'マトリックスで確認',
        child: const Icon(Icons.grid_on),
      ),
      appBar: AppBar(backgroundColor: AppColor.transparent, elevation: 0),
      body: Stack(
        children: [
          Center(
            child: switch (quizzes.lastOrNull) {
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
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (final rank
                                    in ref
                                        .watch(preflopHandRangeMatricesNotifierProvider)
                                        .preflopRanks)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: SizedBox(
                                      width: 180,
                                      child: _RankDisplay.answerButton(
                                        rank: rank,
                                        onPressed: () => notifier.answer(rank),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnsweredPreflopHandRangeQuiz(:final hand, :final correctRank, :final answeredRank) =>
                () {
                  final isCorrect = correctRank == answeredRank;
                  return SingleChildScrollView(
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
                                    text: isCorrect ? '🎉' : '😢',
                                    style: const TextStyle(fontFamily: 'Apple Color Emoji'),
                                  ),
                                  TextSpan(
                                    text: ' ${isCorrect ? '正解！' : '不正解'}',
                                    style: context.displaySmall.copyWith(
                                      color: isCorrect ? AppColor.green : AppColor.red,
                                    ),
                                  ),
                                ],
                              ),
                              style: context.displaySmall.copyWith(
                                color: isCorrect ? AppColor.green : AppColor.red,
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
                                    SizedBox(
                                      width: 180,
                                      child: _RankDisplay.readOnly(rank: correctRank),
                                    ),
                                  ],
                                ),
                                if (!isCorrect)
                                  Column(
                                    spacing: 12,
                                    children: [
                                      Text('あなたの回答', style: context.titleMedium),
                                      SizedBox(
                                        width: 180,
                                        child: _RankDisplay.readOnly(rank: answeredRank),
                                      ),
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
                  );
                }(),
              null => const SizedBox.shrink(),
            },
          ),
          const Positioned(left: 16, bottom: 16, child: PackageInfoText()),
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

/// ランクと補足説明を表示するウィジェット。
class _RankDisplay extends StatelessWidget {
  /// 押下して回答するボタンとして、ランクと補足説明を表示するウィジェットを生成する。
  const _RankDisplay.answerButton({required this.rank, required VoidCallback onPressed})
    : _onPressed = onPressed;

  /// 表示のみの目的で、ランクと補足説明を表示するウィジェットを生成する。
  const _RankDisplay.readOnly({required this.rank}) : _onPressed = null;

  /// ランク。
  final PreflopRank rank;

  /// ボタン押下時のコールバック。
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_onPressed) {
      case null:
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.darkBlueGrey,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.grey),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _child(context),
        );
      default:
        return Material(
          color: AppColor.transparent,
          child: InkWell(
            onTap: _onPressed,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.darkBlueGrey,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.grey),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _child(context),
            ),
          ),
        );
    }
  }

  /// ランクと補足説明を表示するウィジェットの子要素を返す。
  Widget _child(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: rank.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: rank.color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          rank.displayText,
          style: context.displaySmall.copyWith(
            color: rank.color.computeLuminance() > 0.5 ? AppColor.black : AppColor.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const Gap(12),
      SizedBox(
        height: context.bodyMediumLineHeight * 2,
        child: Text(
          rank.description,
          style: context.bodyMedium.copyWith(color: AppColor.lightGrey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
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
