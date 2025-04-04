import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/entity/preflop.dart';
import '../../../model/logic/preflop_hand_range_matrix.dart';
import '../../style/color.dart';
import '../../style/typography.dart';
import '../../widget/preflop_hand_range_matrix_dropdown.dart';

/// マトリックスを表示するページ。
class MatrixPage extends HookConsumerWidget {
  /// マトリックスを表示するページを作成する。
  const MatrixPage({super.key, this.highlightedHand, required this.initialSelectedMatrix});

  /// ハイライトするハンド。
  final PreflopHand? highlightedHand;

  /// 初期選択されるハンドレンジ。
  final PreflopHandRangeMatrix initialSelectedMatrix;

  /// セルの最小サイズ。
  static const double _minCellSize = 32;

  /// セルの最大サイズ。
  static const double _maxCellSize = 64;

  /// 希望するセルのサイズ。
  static const double _preferredCellSize = 48;

  /// 指定された行と列に対応するハンドを取得する。
  PreflopHand? _getHandAt({required int row, required int col}) =>
      PreflopHand.values.where((hand) => hand.row == row && hand.col == col).firstOrNull;

  /// 利用可能な幅から最適なセルサイズを計算する。
  double _calculateCellSize(double availableWidth) {
    // 13 列分のセルを表示するために必要な幅を計算する。
    final cellSize = availableWidth / 13;

    // セルサイズを minCellSize と maxCellSize の範囲内に収める。
    if (cellSize < _minCellSize) {
      return _minCellSize;
    }
    if (cellSize > _maxCellSize) {
      return _maxCellSize;
    }
    // 希望するセルサイズより大きい場合は、希望するサイズを使用する。
    if (cellSize > _preferredCellSize) {
      return _preferredCellSize;
    }
    return cellSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);
    // 選択中のハンドレンジをローカル状態で管理する。初期値は必須引数から取得。
    final selectedRange = useState<PreflopHandRangeMatrix>(initialSelectedMatrix);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // ドロップダウンでハンドレンジを選択する。
              Container(
                margin: const EdgeInsets.only(bottom: 16),
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
                                                            isHighlighted
                                                                ? AppColor.gold
                                                                : AppColor.grey,
                                                        width: isHighlighted ? 3 : 1,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        hand.displayText,
                                                        style: context.bodyLarge.copyWith(
                                                          fontSize: cellSize * 0.25,
                                                          fontWeight: FontWeight.bold,
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
                                    SizedBox(
                                      width: cellSize * 13,
                                      child: DecoratedBox(
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
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 24,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                        color: rank.color,
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: AppColor.grey),
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
          ),
        ),
      ),
    );
  }
}
