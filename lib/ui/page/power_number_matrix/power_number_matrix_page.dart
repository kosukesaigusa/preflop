import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../model/entity/power_number.dart';
import '../../../model/entity/preflop.dart';
import '../../style/color.dart';
import '../../style/typography.dart';
import '../../widget/markdown_list.dart';

/// パワーナンバー表を表示するページ。
class PowerNumberMatrixPage extends StatelessWidget {
  /// パワーナンバー表を表示するページを作成する。
  const PowerNumberMatrixPage({super.key});

  /// 指定された行と列に対応するハンドを取得する。
  PreflopHand? _getHandAt({required int row, required int col}) =>
      PreflopHand.values.where((hand) => hand.row == row && hand.col == col).firstOrNull;

  /// 利用可能な幅からセルサイズを計算する。
  double _calculateCellSize(double availableWidth) => (availableWidth - _rowLabelWidth) / 13;

  /// 行・列のラベルの文字列一覧。
  static const _labels = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'];

  /// 行のラベルの横幅。
  static const _rowLabelWidth = 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('パワーナンバー表')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cellSize = _calculateCellSize(constraints.maxWidth);
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    // 列のヘッダー（A〜2）。
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 左上の空白セル。
                        SizedBox(width: _rowLabelWidth, height: cellSize),
                        // 列のラベル。
                        for (final label in _labels)
                          Container(
                            width: cellSize,
                            height: cellSize,
                            decoration: BoxDecoration(
                              color: AppColor.darkBlueGrey,
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Center(
                              child: Text(
                                label,
                                style: context.titleSmall.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    // マトリックス本体。
                    for (final (i, label) in _labels.indexed)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 行のラベル（A〜2）。
                          Container(
                            width: _rowLabelWidth,
                            height: cellSize,
                            decoration: BoxDecoration(
                              color: AppColor.darkBlueGrey,
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Center(
                              child: Text(
                                label,
                                style: context.titleSmall.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // セルの内容。
                          for (final (j, _) in _labels.indexed)
                            () {
                              final hand = _getHandAt(row: i, col: j);
                              if (hand == null) {
                                return Container(
                                  width: cellSize,
                                  height: cellSize,
                                  decoration: BoxDecoration(
                                    color: AppColor.darkBlueGrey.withValues(alpha: 0.3),
                                    border: Border.all(color: AppColor.grey),
                                  ),
                                );
                              }
                              final handPowerNumber = powerNumberMatrix.getPowerNumber(hand);
                              final backgroundColor = switch (handPowerNumber) {
                                AlwaysAllInHandPowerNumber() => AppColor.red.withValues(alpha: 0.6),
                                SelectableHandPowerNumber(:final powerNumber) =>
                                  switch (powerNumber) {
                                    >= 35 => AppColor.yellow.withValues(alpha: 0.6),
                                    >= 20 => AppColor.green.withValues(alpha: 0.6),
                                    >= 10 => AppColor.blue.withValues(alpha: 0.6),
                                    _ => AppColor.white,
                                  },
                                FoldHandPowerNumber() => AppColor.darkBlueGrey.withValues(
                                  alpha: 0.3,
                                ),
                              };
                              return Container(
                                width: cellSize,
                                height: cellSize,
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  border: Border.all(color: AppColor.grey),
                                ),
                                child: Center(
                                  child: switch (handPowerNumber) {
                                    AlwaysAllInHandPowerNumber() => Text(
                                      '∞',
                                      style: context.titleMedium.copyWith(
                                        color:
                                            backgroundColor.computeLuminance() > 0.5
                                                ? AppColor.black
                                                : AppColor.white,
                                      ),
                                    ),
                                    SelectableHandPowerNumber(:final powerNumber) => Text(
                                      '$powerNumber',
                                      style: context.titleMedium.copyWith(
                                        color:
                                            backgroundColor.computeLuminance() > 0.5
                                                ? AppColor.black
                                                : AppColor.white,
                                      ),
                                    ),
                                    FoldHandPowerNumber() => null,
                                  },
                                ),
                              );
                            }(),
                        ],
                      ),
                    const Gap(32),
                    Text('メモ', style: context.titleMedium),
                    const Gap(8),
                    MarkdownUnorderedList(
                      children: [
                        MarkdownListItem(
                          child: Text(
                            'M 値 = 持ち点 / ポット (SB + BB + Ante)',
                            style: context.bodyMedium,
                          ),
                        ),
                        MarkdownListItem(
                          child: Text(
                            '有効 M 値 = 持ち点 / ポット (SB + BB + Ante) / 後ろの人数',
                            style: context.bodyMedium,
                          ),
                        ),
                        MarkdownListItem(
                          child: Text('一般に、', style: context.bodyMedium),
                          children: [
                            MarkdownListItem(
                              child: Text(
                                'M 値が 8 以下の場合：プリフロップでオールインすることがかなり増える',
                                style: context.bodyMedium,
                              ),
                            ),
                            MarkdownListItem(
                              child: Text(
                                'M 値が 5 以下の場合：オールインするかフォールドするかになる',
                                style: context.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        MarkdownListItem(
                          child: Text(
                            'コミット：持ち点の 1/3 以上をポットに入れると、オールインやコールが肯定される（プリフロップで降りられない）',
                            style: context.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const Gap(60),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
