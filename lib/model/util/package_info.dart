import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

/// アプリのパッケージ情報を提供する。
///
/// 実際のアプリやユニットテストなどの動作環境によって適切な `ProviderScope` でオーバーライド
/// して使用される。
@riverpod
PackageInfo packageInfo(Ref ref) => throw UnimplementedError();

/// アプリのパッケージ情報を取得する。
Future<PackageInfo> getPackageInfo() => PackageInfo.fromPlatform();
