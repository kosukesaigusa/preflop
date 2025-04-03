import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../entity/preflop.dart';
import '../../style/typography.dart';

/// ランクと補足説明を表示するウィジェット。
class RankDisplay extends StatelessWidget {
  /// 押下して回答するボタンとして、ランクと補足説明を表示するウィジェットを生成する。
  const RankDisplay.answerButton({required this.rank, required VoidCallback onPressed, super.key})
    : _onPressed = onPressed;

  /// 表示のみの目的で、ランクと補足説明を表示するウィジェットを生成する。
  const RankDisplay.readOnly({required this.rank, super.key}) : _onPressed = null;

  /// ランク。
  final PreflopRank rank;

  /// ボタン押下時のコールバック。
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_onPressed) {
      case null:
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C44), // ダークブルーグレー
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade800),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _child(context),
        );
      default:
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _onPressed,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C44), // ダークブルーグレー
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade800),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _child(context),
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
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: rank.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: rank.color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          rank.displayText,
          style: context.displaySmall.copyWith(
            color: rank.color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const Gap(12),
      Text(
        rank.description,
        style: context.bodyMedium.copyWith(color: const Color(0xFFE4E4E7), height: 1.4),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
