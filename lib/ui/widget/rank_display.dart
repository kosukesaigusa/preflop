import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../model/entity/preflop.dart';
import '../style/color.dart';
import '../style/typography.dart';

/// ランクと補足説明を表示するウィジェット。
class RankDisplay extends StatelessWidget {
  /// 押下して回答するボタンとして、ランクと補足説明を表示するウィジェットを生成する。
  const RankDisplay.answerButton({super.key, required this.rank, required VoidCallback onPressed})
    : _onPressed = onPressed;

  /// 表示のみの目的で、ランクと補足説明を表示するウィジェットを生成する。
  const RankDisplay.readOnly({super.key, required this.rank}) : _onPressed = null;

  /// ランク。
  final PreflopRank rank;

  /// ボタン押下時のコールバック。
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_onPressed) {
      case null:
        return Container(
          width: 136,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.darkBlueGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.grey),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withValues(alpha: 0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: _child(context),
        );
      default:
        return SizedBox(
          width: 136,
          child: Material(
            color: AppColor.transparent,
            child: InkWell(
              onTap: _onPressed,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.darkBlueGrey,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: _child(context),
              ),
            ),
          ),
        );
    }
  }

  /// ランクと補足説明を表示するウィジェットの子要素を返す。
  Widget _child(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: rank.color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: rank.color.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          rank.displayText,
          style: context.titleLarge.copyWith(
            color: rank.color.computeLuminance() > 0.5 ? AppColor.black : AppColor.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const Gap(8),
      SizedBox(
        height: context.bodySmallLineHeight * 2,
        child: Text(
          rank.description,
          style: context.bodySmall.copyWith(color: AppColor.lightGrey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
