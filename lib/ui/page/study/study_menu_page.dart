import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../style/color.dart';
import '../../style/screen.dart';
import '../../style/typography.dart';
import '../power_number_matrix/power_number_matrix_page.dart';

/// 学習メニューを表示するページ。
class StudyMenuPage extends HookConsumerWidget {
  /// 学習メニューを表示するページを作成する。
  const StudyMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('学習メニュー')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(16),
              _MenuCard(
                leading: const Icon(Icons.table_chart, size: 32, color: AppColor.gold),
                title: 'パワーナンバー表',
                description: 'MTT のショートスタック戦略として push or fold 戦略を取る際に用いられる指標を確認できます。',
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const PowerNumberMatrixPage(),
                        fullscreenDialog: true,
                      ),
                    ),
              ),
              // const Gap(16),
              // _MenuCard(
              //   title: 'パワーナンバークイズ',
              //   description: 'パワーナンバーの暗記を練習できます。',
              //   icon: Icons.quiz,
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute<void>(
              //         builder: (context) => const PowerNumberQuizPage(),
              //         fullscreenDialog: true,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/// メニューカード。
class _MenuCard extends StatelessWidget {
  /// メニューカードを作成する。
  const _MenuCard({
    required this.title,
    required this.description,
    required this.leading,
    required this.onTap,
  });

  /// タイトル。
  final String title;

  /// 説明。
  final String description;

  /// 先頭に表示するウィジェット。
  final Widget leading;

  /// タップ時のコールバック。
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            spacing: 16,
            children: [
              leading,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(title, style: context.titleMedium),
                    Text(description, style: context.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColor.white),
            ],
          ),
        ),
      ),
    );
  }
}
