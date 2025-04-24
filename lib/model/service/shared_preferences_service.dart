import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_service.g.dart';

/// [SharedPreferencesService] クラスのインスタンスを取得する。
SharedPreferencesService getSharedPreferencesService() =>
    SharedPreferencesService(SharedPreferencesAsync());

@riverpod
/// [SharedPreferencesService] クラスのインスタンスを提供する。
@riverpod
SharedPreferencesService sharedPreferencesService(Ref ref) => throw UnimplementedError();

/// shared_preferences パッケージが提供する、値の取得や保存の機能をラップしたサービスクラス。
///
/// ほとんど shared_preferences のインターフェースの再実装のような内容になっているが、system
/// パッケージ以外が shared_preferences パッケージに直接依存しないように、また、一種の腐敗
/// 防止層としての目的でこのような実装にしている。
class SharedPreferencesService {
  /// [SharedPreferencesService] を生成する。
  const SharedPreferencesService(this._sharedPreferencesAsync);

  /// [SharedPreferences] のインスタンス。
  final SharedPreferencesAsync _sharedPreferencesAsync;

  /// 指定したキー [key] が存在するかどうか。
  Future<bool> containsKey(String key) => _sharedPreferencesAsync.containsKey(key);

  /// 指定したキー [key] に対応する [bool] 型の値を取得する。
  Future<bool?> getBool(String key) => _sharedPreferencesAsync.getBool(key);

  /// 指定したキー [key] に対応する [int] 型の値を取得する。
  Future<int?> getInt(String key) => _sharedPreferencesAsync.getInt(key);

  /// 指定したキー [key] に対応する [double] 型の値を取得する。
  Future<double?> getDouble(String key) => _sharedPreferencesAsync.getDouble(key);

  /// 指定したキー [key] に対応する [String] 型の値を取得する。
  Future<String?> getString(String key) => _sharedPreferencesAsync.getString(key);

  /// 指定したキー [key] に対応する `List<String>` 型の値を取得する。
  Future<List<String>?> getStringList(String key) => _sharedPreferencesAsync.getStringList(key);

  /// 指定したキー [key] に [bool] 型の値を保存する。
  // ignore: avoid_positional_boolean_parameters
  Future<void> setBool(String key, bool value) => _sharedPreferencesAsync.setBool(key, value);

  /// 指定したキー [key] に [int] 型の値を保存する。
  Future<void> setInt(String key, int value) => _sharedPreferencesAsync.setInt(key, value);

  /// 指定したキー [key] に [double] 型の値を保存する。
  Future<void> setDouble(String key, double value) => _sharedPreferencesAsync.setDouble(key, value);

  /// 指定したキー [key] に [String] 型の値を保存する。
  Future<void> setString(String key, String value) => _sharedPreferencesAsync.setString(key, value);

  /// 指定したキー [key] に `List<String>` 型の値を保存する。
  Future<void> setStringList(String key, List<String> value) =>
      _sharedPreferencesAsync.setStringList(key, value);

  /// 指定したキー [key] に対応する値を削除する。
  Future<void> remove(String key) => _sharedPreferencesAsync.remove(key);

  /// 保存されているすべてのキーと値を削除する。
  Future<void> clear() => _sharedPreferencesAsync.clear();
}
