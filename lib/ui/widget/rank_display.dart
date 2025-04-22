import 'package:flutter/material.dart';

import '../../model/entity/preflop.dart';
import '../style/color.dart';
import '../style/screen.dart';
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
          width: (context.screenWidth - screenHorizontalPadding * 2 - 48) / 2,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Container(
                width: context.titleMediumLineHeight,
                height: context.titleMediumLineHeight,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: rank.color, shape: BoxShape.circle),
                child: Text(
                  rank.displayText.substring(0, 1),
                  style: context.titleMedium.copyWith(
                    color: rank.color.computeLuminance() > 0.5 ? AppColor.black : AppColor.white,
                  ),
                ),
              ),
              Text(
                rank.description,
                style: context.bodySmall.copyWith(color: AppColor.lightGrey),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      default:
        return SizedBox(
          width: (context.screenWidth - screenHorizontalPadding * 2 - 24) / 3,
          child: Material(
            color: AppColor.transparent,
            child: InkWell(
              onTap: _onPressed,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    Container(
                      width: context.titleMediumLineHeight,
                      height: context.titleMediumLineHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: rank.color, shape: BoxShape.circle),
                      child: Text(
                        rank.displayText.substring(0, 1),
                        style: context.titleMedium.copyWith(
                          color:
                              rank.color.computeLuminance() > 0.5 ? AppColor.black : AppColor.white,
                        ),
                      ),
                    ),
                    Text(
                      rank.description,
                      style: context.bodySmall.copyWith(color: AppColor.lightGrey),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
}
