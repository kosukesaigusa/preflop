import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/hand.dart';
import '../../../model/entity/preflop.dart';
import '../../../model/entity/preflop_hand_range_quiz.dart';
import '../../../model/entity/quize_review_filter.dart';
import '../../../model/logic/last_selected_preflop_hand_range_matrix_use_case.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../../model/logic/preflop_hand_range_quiz.dart';
import '../../style/color.dart';
import '../../style/screen.dart';
import '../../style/typography.dart';
import '../../util/card.dart';
import '../../widget/application_info_text.dart';
import '../../widget/preflop_hand_range_matrix_selector.dart';
import '../../widget/rank_display.dart';
import '../matrix/matrix_page.dart';
import '../review/review_page.dart';
import '../study/study_menu_page.dart';

/// クイズを表示するページ。
class QuizPage extends HookConsumerWidget {
  /// クイズを表示するページを作成する。
  const QuizPage({super.key});

  /// 垂直方向の余白。
  static const double _verticalPadding = 24;

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

    // 選択中のハンドレンジを管理する。
    final selectedRange = useState<PreflopHandRangeMatrix>(
      // 前回最後に選択されたハンドレンジ表が存在する場合はそれを選択状態にする。
      ref.read(eagerlyInitializedSelectedPreflopHandRangeMatrixProvider) ?? availableRanges.first,
    );

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
        centerTitle: true,
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
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            tooltip: '学習メニュー',
            onPressed:
                () => Navigator.of(
                  context,
                ).push<void>(MaterialPageRoute(builder: (context) => const StudyMenuPage())),
          ),
          const Gap(8),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: switch (latestQuiz) {
              UnansweredPreflopHandRangeQuiz(:final hand) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: _verticalPadding,
                    horizontal: screenHorizontalPadding,
                  ),
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PreflopHandRangeMatrixSelector(
                        availableRanges: availableRanges,
                        selectedValue: selectedRange.value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            selectedRange.value = newValue;
                            // 最後に選択されたハンドレンジ表を保存する。
                            ref
                                .read(saveLastSelectedPreflopHandRangeMatrixUseCaseProvider)
                                .invoke(newValue);
                          }
                        },
                      ),
                      Text('このハンドのランクは？', style: context.headlineSmall),
                      _Hand.small(hand),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          for (final rank in selectedRange.value.preflopRanks)
                            RankDisplay.answerButton(
                              rank: rank,
                              onPressed:
                                  () => notifier.answer(
                                    matrix: selectedRange.value,
                                    answeredRank: rank,
                                  ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AnsweredPreflopHandRangeQuiz(:final hand, :final answeredRank) =>
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: _verticalPadding,
                      horizontal: screenHorizontalPadding,
                    ),
                    child: Column(
                      spacing: 32,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(
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
                        _Hand.normal(hand),
                        Wrap(
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
                        _NextQuizButton(onPressed: notifier.generate),
                      ],
                    ),
                  ),
                ),
              null => const SizedBox.shrink(),
            },
          ),
          const Positioned(left: 24, bottom: 24, child: ApplicationInfoText()),
        ],
      ),
    );
  }
}

/// ハンドの 2 枚のカードをトランプのカードの見た目として表示するウィジェット。
class _Hand extends StatelessWidget {
  /// ハンドの 2 枚のカードをトランプのカードの見た目として表示するウィジェットを生成する。
  const _Hand.normal(this.hand) : _size = _HandDisplaySize.normal;

  /// ハンドの 2 枚のカードをトランプのカードの見た目として表示するウィジェットを生成する（小さい版）。
  const _Hand.small(this.hand) : _size = _HandDisplaySize.small;

  /// ハンド。
  final Hand hand;

  /// 表示サイズ。
  final _HandDisplaySize _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_size._containerPadding),
      decoration: BoxDecoration(
        color: AppColor.darkBlueGrey,
        borderRadius: BorderRadius.circular(_size._borderRadius),
        border: Border.all(color: AppColor.grey),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.3),
            blurRadius: _size._shadowBlurRadius,
            offset: Offset(0, _size._shadowOffsetY),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: _size._cardSpacing,
        children: [
          for (final card in hand.cards)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: _size._cardPaddingHorizontal,
                vertical: _size._cardPaddingVertical,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(_size._cardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withValues(alpha: 0.2),
                    blurRadius: _size._cardShadowBlurRadius,
                    offset: Offset(0, _size._cardShadowOffsetY),
                  ),
                ],
              ),
              child: Column(
                children: [
                  card.svg.svg(
                    width: _size._iconSize,
                    height: _size._iconSize,
                    colorFilter: ColorFilter.mode(card.mark.color, BlendMode.srcIn),
                  ),
                  Gap(_size._gapSize),
                  Text(
                    card.rank.displayText,
                    style: _size._getTextStyle(context).copyWith(color: card.mark.color),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// ハンドの表示サイズ種別。
enum _HandDisplaySize {
  normal,
  small;

  /// 外側のコンテナの Padding.
  double get _containerPadding => switch (this) {
    normal => 24.0,
    small => 12.0,
  };

  /// 外側のコンテナの角丸の半径。
  double get _borderRadius => switch (this) {
    normal => 16.0,
    small => 8.0,
  };

  /// ハンド内のカード間の間隔。
  double get _cardSpacing => switch (this) {
    normal => 16.0,
    small => 8.0,
  };

  /// カード内の水平方向の Padding.
  double get _cardPaddingHorizontal => switch (this) {
    normal => 20.0,
    small => 12.0,
  };

  /// カード内の垂直方向の Padding.
  double get _cardPaddingVertical => switch (this) {
    normal => 12.0,
    small => 6.0,
  };

  /// スートアイコンのサイズ。
  double get _iconSize => switch (this) {
    normal => 40.0,
    small => 24.0,
  };

  /// アイコンとランクテキスト間の Gap サイズ。
  double get _gapSize => switch (this) {
    normal => 8.0,
    small => 4.0,
  };

  /// 外側のコンテナの影のぼかし半径。
  double get _shadowBlurRadius => switch (this) {
    normal => 12.0,
    small => 8.0,
  };

  /// 外側のコンテナの影の Y 軸オフセット。
  double get _shadowOffsetY => switch (this) {
    normal => 6.0,
    small => 4.0,
  };

  /// カードの影のぼかし半径。
  double get _cardShadowBlurRadius => switch (this) {
    normal => 8.0,
    small => 4.0,
  };

  /// カードの影の Y 軸オフセット。
  double get _cardShadowOffsetY => switch (this) {
    normal => 4.0,
    small => 2.0,
  };

  /// カードの角丸の半径。
  double get _cardBorderRadius => switch (this) {
    normal => 12.0,
    small => 8.0,
  };

  /// 対応するテキストスタイルを取得する。
  TextStyle _getTextStyle(BuildContext context) => switch (this) {
    normal => context.headlineMedium.copyWith(fontWeight: FontWeight.bold),
    small => context.titleLarge.copyWith(fontWeight: FontWeight.bold),
  };
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
