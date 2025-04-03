import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../../ui/style/color.dart';
import 'style/typography.dart';
import 'widget/rank_display.dart';

/// 過去の問題・回答を閲覧するページ。
class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // クイズ一覧を取得する。
    final quizzes = ref.watch(preflopHandRangeQuizzzesNotifierProvider);

    // 回答済みのクイズのみを抽出し、新しい順に並べる。
    final answeredQuizzes =
        quizzes.whereType<AnsweredPreflopHandRangeQuiz>().toList().reversed.toList();

    if (answeredQuizzes.isEmpty) {
      return Scaffold(appBar: AppBar(), body: const Center(child: Text('学習履歴がありません。')));
    }

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(child: Text('学習履歴', style: context.titleLarge)),
          ),
          SliverList.builder(
            itemCount: answeredQuizzes.length,
            itemBuilder: (context, index) => _QuizHistoryCard(answeredQuizzes[index]),
          ),
        ],
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(quiz.matrix.name, style: context.titleSmall),
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
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                Column(
                  spacing: 12,
                  children: [
                    Text('正解', style: context.titleMedium),
                    SizedBox(width: 180, child: RankDisplay.readOnly(rank: quiz.correctRank)),
                  ],
                ),
                if (!quiz.isCorrect)
                  Column(
                    spacing: 12,
                    children: [
                      Text('あなたの回答', style: context.titleMedium),
                      SizedBox(width: 180, child: RankDisplay.readOnly(rank: quiz.answeredRank)),
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
