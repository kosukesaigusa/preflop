import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/util/card.dart';
import 'app/util/typography.dart';
import 'app/widget/preflop_hand_range_matrix.dart' as matrix_view;
import 'entity/hand.dart';
import 'entity/preflop.dart';
import 'entity/preflop_hand_range_quiz.dart';
import 'logic/preflop_hand_range_matrix.dart';
import 'logic/preflop_hand_range_quiz.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Preflop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: appTextTheme,
        ),
        home: const MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('ハンドレンジ表', style: context.titleLarge)),
      body: const QuizPage(),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const MatrixPage(),
                fullscreenDialog: true,
              ),
            ),
        child: const Icon(Icons.grid_on),
      ),
    );
  }
}

/// クイズを表示するページ。
class QuizPage extends ConsumerWidget {
  /// クイズを表示するページを作成する。
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);

    // 選択中のハンドレンジを取得する。
    final selectedRange = ref.watch(preflopHandRangeMatricesNotifierProvider);

    // クイズ一覧を取得する。
    final quizzes = ref.watch(preflopHandRangeQuizzzesNotifierProvider);

    // クイズ一覧の Notifier を取得する。
    final notifier = ref.read(preflopHandRangeQuizzzesNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Center(
        child: switch (quizzes.last) {
          UnansweredPreflopHandRangeQuiz(:final hand) => SingleChildScrollView(
            child: Column(
              spacing: 32,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (availableRanges.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: DropdownButton<PreflopHandRangeMatrix>(
                          value: selectedRange,
                          items: [
                            for (final matrix in availableRanges)
                              DropdownMenuItem<PreflopHandRangeMatrix>(
                                value: matrix,
                                child: Text(matrix.name, style: context.titleMedium),
                              ),
                          ],
                          onChanged: (newValue) {
                            if (newValue == null) {
                              return;
                            }
                            ref
                                .read(preflopHandRangeMatricesNotifierProvider.notifier)
                                .update(newValue);
                          },
                          underline: Container(),
                          style: context.titleMedium,
                        ),
                      ),
                  ],
                ),
                Text('このハンドのランクは？', style: context.headlineSmall),
                _Hand(hand),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final rank in selectedRange.preflopRanks)
                      _RankDisplay.answerButton(rank: rank, onPressed: () => notifier.answer(rank)),
                  ],
                ),
              ],
            ),
          ),
          AnsweredPreflopHandRangeQuiz(:final hand, :final correctRank, :final answeredRank) => () {
            final isCorrect = correctRank == answeredRank;
            return SingleChildScrollView(
              child: Column(
                spacing: 32,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isCorrect ? '正解！' : '不正解...',
                    style: context.displaySmall.copyWith(
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  _Hand(hand),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      Column(
                        spacing: 12,
                        children: [
                          Text('正解', style: context.titleMedium),
                          _RankDisplay.readOnly(rank: correctRank),
                        ],
                      ),
                      if (!isCorrect)
                        Column(
                          spacing: 12,
                          children: [
                            Text('あなたの回答', style: context.titleMedium),
                            _RankDisplay.readOnly(rank: answeredRank),
                          ],
                        ),
                    ],
                  ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: notifier.generate,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Text('次の問題へ', style: context.titleMedium),
                  ),
                ],
              ),
            );
          }(),
        },
      ),
    );
  }
}

/// マトリックスを表示するページ。
class MatrixPage extends StatelessWidget {
  /// マトリックスを表示するページを作成する。
  const MatrixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(title: Text('ハンドレンジ表', style: context.titleLarge), centerTitle: true),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: matrix_view.PreflopHandRangeMatrixView()),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
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
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
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
                    style: context.headlineMedium.copyWith(color: card.mark.color),
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
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: _child(context),
        );
      default:
        return SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: _child(context),
          ),
        );
    }
  }

  /// ランクと補足説明を表示するウィジェットの子要素を返す。
  Widget _child(BuildContext context) => Row(
    children: [
      Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: rank.color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
      ),
      const Gap(16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Text(rank.displayText, style: context.titleMedium),
            if (rank.description.isNotEmpty)
              Text(
                rank.description,
                style: context.bodyMedium.copyWith(color: Colors.grey.shade600),
              ),
          ],
        ),
      ),
    ],
  );
}
