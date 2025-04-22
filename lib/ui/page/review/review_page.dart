import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/entity/quize_review_filter.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../style/color.dart';
import '../../style/screen.dart';
import '../../style/typography.dart';
import '../../util/quiz_review_filter.dart';
import '../../widget/rank_display.dart';
import '../matrix/matrix_page.dart';

/// 過去の問題・回答を閲覧するページ。
class ReviewPage extends HookConsumerWidget {
  const ReviewPage({super.key, QuizeReviewFilter? initialFilter})
    : _initialFilter = initialFilter ?? QuizeReviewFilter.all;

  /// フィルタの初期値。
  final QuizeReviewFilter _initialFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // フィルタの状態をローカルで管理する。
    final filterState = useState(_initialFilter);

    // フィルタされたクイズ一覧を取得する。
    final filteredQuizzes = ref.watch(filteredAnsweredQuizzesProvider(filter: filterState.value));

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: Text('学習履歴', style: context.titleLarge)),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 16),
              sliver: SliverToBoxAdapter(
                child: SegmentedButton<QuizeReviewFilter>(
                  segments: [
                    for (final filter in QuizeReviewFilter.values)
                      ButtonSegment(value: filter, label: Text(filter.displayText)),
                  ],
                  selected: {filterState.value},
                  onSelectionChanged: (newSelection) => filterState.value = newSelection.first,
                  style: SegmentedButton.styleFrom(
                    // 選択されたセグメントの文字色を設定する。
                    selectedForegroundColor: AppColor.gold,
                    // 境界線の色を少し薄くする。
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),
            if (filteredQuizzes.isEmpty)
              const SliverFillRemaining(child: Center(child: Text('表示する学習履歴がありません。')))
            else
              SliverList.builder(
                itemCount: filteredQuizzes.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _QuizHistoryCard(filteredQuizzes[index]),
                    ),
              ),
            const SliverToBoxAdapter(child: Gap(60)),
          ],
        ),
      ),
    );
  }
}

/// 過去の問題・回答を表示するカード。
class _QuizHistoryCard extends StatelessWidget {
  const _QuizHistoryCard(this.quiz);

  final AnsweredPreflopHandRangeQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(quiz.matrix.name, style: context.titleSmall),
                IconButton(
                  icon: const Icon(Icons.grid_on),
                  tooltip: 'ハンドレンジを確認する',
                  // ハンドレンジを指定して、ハンドレンジ表ページに遷移する。
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder:
                              (context) => MatrixPage(
                                highlightedHand: quiz.hand.asPreflopHand,
                                initialSelectedMatrix: quiz.matrix,
                              ),
                          fullscreenDialog: true,
                        ),
                      ),
                ),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Icon(
                  quiz.isCorrect ? Icons.check_circle : Icons.cancel,
                  color: quiz.isCorrect ? AppColor.green : AppColor.red,
                  size: context.titleLargeLineHeight,
                ),
                Text(quiz.hand.asPreflopHand.displayText, style: context.titleLarge),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  spacing: 12,
                  children: [
                    Text('正解', style: context.titleMedium),
                    // 正解ランクを matrix と hand から導出して表示する。
                    RankDisplay.readOnly(rank: quiz.matrix.getRank(quiz.hand.asPreflopHand)),
                  ],
                ),
                if (!quiz.isCorrect)
                  Column(
                    spacing: 12,
                    children: [
                      Text('あなたの回答', style: context.titleMedium),
                      RankDisplay.readOnly(rank: quiz.answeredRank),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
