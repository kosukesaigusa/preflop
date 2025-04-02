import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/preflop.dart';
import '../../logic/preflop_hand_range_matrix.dart';
import '../util/typography.dart';

/// プリフロップハンドレンジのマトリックス UI を表示するウィジェット。
class PreflopHandRangeMatrixView extends ConsumerWidget {
  /// プリフロップハンドレンジのマトリックス UI を表示するウィジェットを作成する。
  const PreflopHandRangeMatrixView({
    super.key,
    this.minCellSize = 32,
    this.maxCellSize = 64,
    this.preferredCellSize = 48,
  });

  /// セルの最小サイズ。
  final double minCellSize;

  /// セルの最大サイズ。
  final double maxCellSize;

  /// 希望するセルのサイズ。
  final double preferredCellSize;

  /// 指定された行と列に対応するハンドを取得する。
  PreflopHand? _getHandAt({required int row, required int col}) =>
      PreflopHand.values.where((hand) => hand.row == row && hand.col == col).firstOrNull;

  /// 利用可能な幅から最適なセルサイズを計算する。
  double _calculateCellSize(double availableWidth) {
    // 13 列分のセルを表示するために必要な幅を計算する。
    final cellSize = availableWidth / 13;

    // セルサイズを minCellSize と maxCellSize の範囲内に収める。
    if (cellSize < minCellSize) {
      return minCellSize;
    }
    if (cellSize > maxCellSize) {
      return maxCellSize;
    }
    // 希望するセルサイズより大きい場合は、希望するサイズを使用する。
    if (cellSize > preferredCellSize) {
      return preferredCellSize;
    }
    return cellSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択中のハンドレンジを取得する。
    final selectedRange = ref.watch(preflopHandRangeMatricesNotifierProvider);
    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);

    return Column(
      children: [
        // ドロップダウンでハンドレンジを選択する。
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButton<PreflopHandRangeMatrix>(
            value: selectedRange,
            isExpanded: true,
            underline: const SizedBox(),
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
              ref.read(preflopHandRangeMatricesNotifierProvider.notifier).update(newValue);
            },
          ),
        ),
        // マトリックスを表示する。
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cellSize = _calculateCellSize(constraints.maxWidth);
              return Column(
                children: [
                  // マトリックス本体と凡例。
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
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
                                                  border: Border.all(color: Colors.grey.shade200),
                                                ),
                                              );
                                            }
                                            final rank = selectedRange.getRank(hand);
                                            return Container(
                                              width: cellSize,
                                              height: cellSize,
                                              decoration: BoxDecoration(
                                                color: rank.color,
                                                border: Border.all(color: Colors.grey.shade200),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  hand.displayText,
                                                  style: context.bodyLarge.copyWith(
                                                    fontSize: cellSize * 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        rank.color.computeLuminance() > 0.5
                                                            ? Colors.black
                                                            : Colors.white,
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
                              SizedBox(
                                width: cellSize * 13,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Gap(12),
                                      for (final rank in selectedRange.preflopRanks)
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: rank.color,
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(color: Colors.grey.shade200),
                                                ),
                                              ),
                                              const Gap(8),
                                              Text(
                                                '${rank.displayText}: ${rank.description}',
                                                style: context.bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      const Gap(4),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
