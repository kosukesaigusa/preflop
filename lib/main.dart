import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/util/card.dart';
import 'app/util/preflop.dart';
import 'app/util/preflop_rank.dart';
import 'entity/preflop.dart';
import 'entity/preflop_hand_range_quiz.dart';
import 'logic/preflop_hand_range_matrix.dart';
import 'logic/preflop_hand_range_quiz.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('プリフロップハンドレンジ'),
        actions: [
          // 利用可能なハンドレンジが存在する場合は DropdownButton を表示する。
          if (availableRanges.isNotEmpty)
            DropdownButton<PreflopHandRangeMatrix>(
              value: selectedRange,
              items: [
                for (final (index, matrix) in availableRanges.indexed)
                  DropdownMenuItem<PreflopHandRangeMatrix>(
                    value: matrix,
                    child: Text('Range ${index + 1}'),
                  ),
              ],
              onChanged: (newValue) {
                if (newValue == null) {
                  return;
                }
                ref.read(preflopHandRangeMatricesNotifierProvider.notifier).update(newValue);
              },
              underline: Container(),
              iconEnabledColor: Theme.of(context).colorScheme.onPrimary,
              style: Theme.of(context).primaryTextTheme.titleMedium,
              dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
          const Gap(16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child:
              quizzes.isEmpty
                  // クイズ一覧が空の場合は、クイズを開始するボタンを表示する。
                  ? ElevatedButton(onPressed: notifier.generate, child: const Text('クイズを開始する'))
                  // クイズ一覧が空でない場合は、最新のクイズ結果を表示する。
                  : switch (quizzes.last) {
                    // 未回答のクイズの場合は、クイズを表示する。
                    UnansweredPreflopHandRangeQuiz(:final hand) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('このハンドのランクは？', style: TextStyle(fontSize: 18)),
                        const Gap(8),
                        Text(
                          hand.asPreflopHand.displayText,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            for (final card in hand.cards)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    card.svg.svg(
                                      width: 32,
                                      height: 32,
                                      colorFilter: ColorFilter.mode(
                                        card.mark.color,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      card.rank.displayText,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: card.mark.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        const Gap(24),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          alignment: WrapAlignment.center,
                          children: [
                            for (int rank = 1; rank <= selectedRange.maxRank; rank++)
                              ElevatedButton(
                                onPressed: () => notifier.answer(PreflopRank.ranked(rank)),
                                child: Text('Rank $rank'),
                              ),
                            ElevatedButton(
                              onPressed: () => notifier.answer(const PreflopRank.fold()),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
                              child: const Text('Fold'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // 回答済みのクイズの場合は、クイズ結果を表示する。
                    AnsweredPreflopHandRangeQuiz(
                      :final hand,
                      :final correctRank,
                      :final answeredRank,
                    ) =>
                      () {
                        final isCorrect = correctRank == answeredRank;
                        final textStyle = Theme.of(context).textTheme.titleLarge;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              hand.asPreflopHand.displayText,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(hand.card1.id), const Gap(8), Text(hand.card2.id)],
                            ),
                            const Gap(24),
                            Text(
                              isCorrect ? '正解！' : '不正解...',
                              style: textStyle?.copyWith(
                                color: isCorrect ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [const Text('正解: '), Text(correctRank.displayText)],
                            ),
                            if (!isCorrect)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [const Text('あなたの回答: '), Text(answeredRank.displayText)],
                              ),
                            const Gap(32),
                            ElevatedButton(
                              onPressed: notifier.generate,
                              child: const Text('次の問題へ'),
                            ),
                          ],
                        );
                      }(),
                  },
        ),
      ),
    );
  }
}
