import 'package:flutter/material.dart';

import '../../model/entity/preflop.dart';
import '../style/color.dart';
import '../style/typography.dart';

/// プリフロップハンドレンジ表を選択するドロップダウン。
class PreflopHandRangeMatrixDropdown extends StatelessWidget {
  /// プリフロップハンドレンジ表を選択するドロップダウンを作成する。
  const PreflopHandRangeMatrixDropdown({
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
        data: Theme.of(context).copyWith(canvasColor: AppColor.darkBlueGrey),
        child: DropdownButton<PreflopHandRangeMatrix>(
          value: selectedValue,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
