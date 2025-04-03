import 'package:flutter/material.dart';

import '../../style/typography.dart';

/// 次の問題へ進むボタン。
class NextQuizButton extends StatelessWidget {
  /// 次の問題へ進むボタンを作成する。
  const NextQuizButton({required this.onPressed, super.key});

  /// ボタン押下時のコールバック。
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        backgroundColor: const Color(0xFFE5B94E), // ゴールド
        foregroundColor: Colors.black,
        elevation: 4,
        shadowColor: const Color(0xFFE5B94E).withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('次の問題へ', style: context.titleMedium),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, size: 20),
        ],
      ),
    );
  }
}
