import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/preflop.dart';
import '../../../model/logic/last_selected_preflop_hand_range_matrix_use_case.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../style/color.dart';
import '../../style/screen.dart';
import '../../style/typography.dart';
import '../../widget/preflop_hand_range_matrix_selector.dart';

/// マトリックスを表示するページ。
class MatrixPage extends HookConsumerWidget {
  /// マトリックスを表示するページを作成する。
  const MatrixPage({super.key, this.highlightedHand, required this.initialSelectedMatrix});

  /// ハイライトするハンド。
  final PreflopHand? highlightedHand;

  /// 初期選択されるハンドレンジ。
  final PreflopHandRangeMatrix initialSelectedMatrix;

  /// 指定された行と列に対応するハンドを取得する。
  PreflopHand? _getHandAt({required int row, required int col}) =>
      PreflopHand.values.where((hand) => hand.row == row && hand.col == col).firstOrNull;

  /// 利用可能な幅からセルサイズを計算する。
  double _calculateCellSize(double availableWidth) => availableWidth / 13;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);

    // 選択中のハンドレンジを管理する。
    final selectedRange = useState<PreflopHandRangeMatrix>(initialSelectedMatrix);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: Column(
            spacing: 16,
            children: [
              // ハンドレンジを選択する UI を表示する。
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
              // マトリックスを表示する。
              LayoutBuilder(
                builder: (context, constraints) {
                  final cellSize = _calculateCellSize(constraints.maxWidth);
                  return Column(
                    children: [
                      // マトリックス本体と凡例。
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            // マトリックス本体。
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var i = 0; i < 13; i++)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      for (var j = 0; j < 13; j++)
                                        () {
                                          final hand = _getHandAt(row: i, col: j);
                                          if (hand == null) {
                                            return Container(
                                              width: cellSize,
                                              height: cellSize,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: AppColor.grey),
                                              ),
                                            );
                                          }
                                          final rank = selectedRange.value.getRank(hand);
                                          final isHighlighted = hand == highlightedHand;
                                          return Container(
                                            width: cellSize,
                                            height: cellSize,
                                            decoration: BoxDecoration(
                                              color: rank.color,
                                              border: Border.all(
                                                color:
                                                    isHighlighted ? AppColor.gold : AppColor.grey,
                                                width: isHighlighted ? 3 : 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                hand.displayText,
                                                style: context.labelSmall.copyWith(
                                                  color:
                                                      rank.color.computeLuminance() > 0.5
                                                          ? AppColor.black
                                                          : AppColor.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        }(),
                                    ],
                                  ),
                              ],
                            ),
                            // 凡例。
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: AppColor.grey)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Gap(12),
                                  for (final rank in selectedRange.value.preflopRanks)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        spacing: 8,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: context.bodyMediumLineHeight,
                                            height: context.bodyMediumLineHeight,
                                            decoration: BoxDecoration(
                                              color: rank.color,
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: AppColor.grey),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${rank.displayText}: ${rank.description}',
                                              style: context.bodyMedium,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  const Gap(4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}
