import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../style/color.dart';
import '../../style/typography.dart';
import '../../util/package_info.dart';

/// パッケージ情報を表示するウィジェット。
class PackageInfoText extends ConsumerWidget {
  /// パッケージ情報を表示するウィジェットを作成する。
  const PackageInfoText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    return Text(
      'v${packageInfo.version}+${packageInfo.buildNumber}',
      style: context.bodySmall.copyWith(color: AppColor.mediumGrey),
    );
  }
}
