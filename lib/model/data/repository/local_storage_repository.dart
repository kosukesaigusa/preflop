import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/shared_preferences_service.dart';

part 'local_storage_repository.g.dart';

/// ローカルストレージのキーの列挙。
enum _LocalStorageKey {
  /// 最後に使用したハンドレンジの ID.
  lastUsedHandRangeId;

  /// キーの文字列を取得する。
  String get _key => name;
}

/// [LocalStorageRepository] クラスのインスタンスを提供する。
@riverpod
LocalStorageRepository localStorageRepository(Ref ref) => LocalStorageRepository(ref);

/// ローカルストレージとのデータの読み書きを行うリポジトリクラス。
class LocalStorageRepository {
  /// [LocalStorageRepository] を生成する。
  const LocalStorageRepository(this._ref);

  final Ref _ref;

  /// 最後に使用したハンドレンジの ID を取得する。
  Future<String?> fetchLastUsedHandRangeId() => _ref
      .read(sharedPreferencesServiceProvider)
      .getString(_LocalStorageKey.lastUsedHandRangeId._key);

  /// 最後に使用したハンドレンジの ID を保存する。
  Future<void> saveLastUsedHandRangeId(String handRangeId) => _ref
      .read(sharedPreferencesServiceProvider)
      .setString(_LocalStorageKey.lastUsedHandRangeId._key, handRangeId);
}
