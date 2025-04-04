import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_last_updated_at.g.dart';

/// アプリの最終更新日時（デプロイ日時）を提供する。
///
/// 実際のアプリやユニットテストなどの動作環境によって適切な `ProviderScope` でオーバーライド
/// して使用される。
@riverpod
DateTime? appLastUpdatedAt(Ref ref) => null;
