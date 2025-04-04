import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/util/app_last_updated_at.dart';
import '../../model/util/package_info.dart';
import '../style/color.dart';
import '../style/typography.dart';

/// パッケージ情報およびアプリの最終更新日時（デプロイ日時）を表示するウィジェット。
class ApplicationInfoText extends ConsumerWidget {
  /// パッケージ情報を表示するウィジェットを作成する。
  const ApplicationInfoText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final version = packageInfo.version;
    final appLastUpdatedAt = ref.watch(appLastUpdatedAtProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        if (version.isNotEmpty)
          Text('v$version', style: context.bodySmall.copyWith(color: AppColor.mediumGrey)),
        if (appLastUpdatedAt != null)
          Text(
            appLastUpdatedAt.toLocal().toString().substring(0, 16),
            style: context.bodySmall.copyWith(color: AppColor.mediumGrey),
          ),
      ],
    );
  }
}
