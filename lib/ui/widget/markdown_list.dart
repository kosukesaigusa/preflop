import 'package:flutter/material.dart';

import '../style/typography.dart';

/// マークダウンのリスト表示ライクな表示をするウィジェット。
class MarkdownUnorderedList extends StatelessWidget {
  /// マークダウンのリスト表示ライクな表示をするウィジェットを作成する。
  const MarkdownUnorderedList({super.key, required this.children, this.spacing = 4});

  /// 項目一覧。
  final List<MarkdownListItem> children;

  /// 項目間のスペース。
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing,
      children: children,
    );
  }
}

/// マークダウンのリスト表示ライクな表示の各項目。
class MarkdownListItem extends StatelessWidget {
  /// マークダウンのリスト表示ライクな表示の各項目を作成する。
  const MarkdownListItem({
    super.key,
    required this.child,
    this.children = const [],
    this.bullet = '•',
    this.bulletRightPadding = 8,
    this.nestedListLeftPadding = 12,
  });

  /// 項目の内容。
  final Widget child;

  /// 子項目一覧。
  final List<MarkdownListItem> children;

  /// 項目のマーク。
  final String bullet;

  /// マークの右側のパディング。
  final double bulletRightPadding;

  /// 子項目の左側のパディング。
  final double nestedListLeftPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: bulletRightPadding),
              child: Text(bullet, style: context.bodyMedium),
            ),
            Expanded(child: child),
          ],
        ),
        if (children.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: nestedListLeftPadding),
            child: MarkdownUnorderedList(children: children),
          ),
      ],
    );
  }
}
