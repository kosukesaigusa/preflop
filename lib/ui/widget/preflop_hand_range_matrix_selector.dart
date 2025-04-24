import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../model/entity/preflop.dart';
import '../style/color.dart';
import '../style/screen.dart';
import '../style/typography.dart';
import 'markdown_list.dart';

/// プリフロップハンドレンジ表を選択するウィジェット。
///
/// タップするとボトムシートが表示され、利用可能なレンジを選択できる。
class PreflopHandRangeMatrixSelector extends StatelessWidget {
  /// プリフロップハンドレンジ表を選択するウィジェットを作成する。
  const PreflopHandRangeMatrixSelector({
    super.key,
    required this.availableRanges,
    required this.selectedValue,
    required this.onChanged,
  });

  /// 利用可能なハンドレンジ一覧。
  final List<PreflopHandRangeMatrix> availableRanges;

  /// 現在選択されている値。
  final PreflopHandRangeMatrix selectedValue;

  /// 値が変更されたときに呼び出されるコールバック。
  final ValueChanged<PreflopHandRangeMatrix?> onChanged;

  @override
  Widget build(BuildContext context) {
    // 利用可能なハンドレンジがない場合は、何も表示しない。
    if (availableRanges.isEmpty) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.darkBlueGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.grey),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showRangeSelectionSheet(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedValue.name,
                      style: context.titleMedium.copyWith(color: AppColor.lightGrey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (selectedValue.conditions.isNotEmpty)
                      Text(
                        selectedValue.conditions.join(' / '),
                        style: context.bodyMedium.copyWith(color: AppColor.lightGrey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const Gap(8),
              const Icon(Icons.arrow_drop_down, color: AppColor.gold),
            ],
          ),
        ),
      ),
    );
  }

  /// ハンドレンジを選択するボトムシートを表示する。
  Future<void> _showRangeSelectionSheet(BuildContext context) =>
      showModalBottomSheet<PreflopHandRangeMatrix>(
        context: context,
        backgroundColor: AppColor.darkBlueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder:
            (context) => Column(
              children: [
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.only(
                    left: screenHorizontalPadding,
                    right: screenHorizontalPadding,
                    top: 16,
                  ),
                  child: Text(
                    'ハンドレンジを選択',
                    style: context.titleLarge.copyWith(color: AppColor.lightGrey),
                  ),
                ),
                const Gap(16),
                const Divider(height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(16),
                        for (final (index, matrix) in availableRanges.indexed) ...[
                          _Item(
                            matrix: matrix,
                            isSelected: matrix == selectedValue,
                            // タップされた選択肢を選択状態にして、ボトムシートを閉じる。
                            onTap: () {
                              onChanged(matrix);
                              Navigator.pop(context);
                            },
                          ),
                          if (index < availableRanges.length - 1) const Divider(height: 1),
                        ],
                        const Gap(64),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      );
}

/// ハンドレンジを選択するボトムシートのアイテム。
class _Item extends StatelessWidget {
  /// ハンドレンジを選択するボトムシートのアイテムを作成する。
  const _Item({required this.matrix, required this.isSelected, required this.onTap});

  /// ハンドレンジ。
  final PreflopHandRangeMatrix matrix;

  /// 選択状態。
  final bool isSelected;

  /// タップされたときに呼び出されるコールバック。
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      title: Text(
        matrix.name,
        style: context.titleMedium.copyWith(
          color: isSelected ? AppColor.gold : AppColor.lightGrey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final condition in matrix.conditions)
            MarkdownUnorderedList(
              children: [
                MarkdownListItem(
                  child: Text(
                    condition,
                    style: context.bodyMedium.copyWith(color: AppColor.lightGrey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        ],
      ),
      onTap: onTap,
      trailing: isSelected ? const Icon(Icons.check, color: AppColor.gold) : null,
    );
  }
}
