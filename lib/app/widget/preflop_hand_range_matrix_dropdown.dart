import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/preflop.dart';
import '../../logic/preflop_hand_range_matrix.dart';
import '../../style/color.dart';
import '../../style/typography.dart';

/// プリフロップハンドレンジ表を選択するドロップダウン。
class PreflopHandRangeMatrixDropdown extends ConsumerWidget {
  /// プリフロップハンドレンジ表を選択するドロップダウンを作成する。
  const PreflopHandRangeMatrixDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択中のハンドレンジを取得する。
    final selectedRange = ref.watch(preflopHandRangeMatricesNotifierProvider);
    // 利用可能なハンドレンジ一覧を取得する。
    final availableRanges = ref.watch(availablePreflopHandRangeMatricesProvider);

    if (availableRanges.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
      child: Theme(
        data: Theme.of(context).copyWith(
          // ドロップダウンメニューの背景色
          canvasColor: AppColor.darkBlueGrey,
        ),
        child: DropdownButton<PreflopHandRangeMatrix>(
          value: selectedRange,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: AppColor.gold),
          underline: const SizedBox(),
          items: [
            for (final matrix in availableRanges)
              DropdownMenuItem<PreflopHandRangeMatrix>(
                value: matrix,
                child: Text(
                  matrix.name,
                  style: context.titleMedium.copyWith(color: AppColor.lightGrey),
                ),
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
    );
  }
}
