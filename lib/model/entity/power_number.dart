import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/power_number/power_number.dart';
import 'preflop.dart';

part 'power_number.freezed.dart';

/// パワーナンバーのハンドマトリックス。
final powerNumberMatrix = PowerNumberHandMatrix.fromJson(powerNumberData);

/// パワーナンバーのハンド表。
@freezed
abstract class PowerNumberHandMatrix with _$PowerNumberHandMatrix {
  const factory PowerNumberHandMatrix({
    required String id,
    required String name,
    required Map<PreflopHand, HandPowerNumber> powerNumbers,
  }) = _PowerNumberHandMatrix;

  /// 指定された JSON からパワーナンバーのハンド表を生成する。
  ///
  /// [json] は下記のような JSON 形式を期待する。
  ///
  /// ```json
  /// {
  ///   "id": "パワーナンバーのハンド表の ID",
  ///   "name": "パワーナンバーのハンド表の名前",
  ///   "handPowerNumbers": {
  ///     "aces": "all",
  ///     "kings": 'all,
  ///     ...
  ///     "ace-ten-s": 36,
  ///     ...
  ///   }
  /// }
  factory PowerNumberHandMatrix.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String? ?? 'パワーナンバー表';
    final handPowerNumbers = json['handPowerNumbers'] as Map<String, dynamic>;
    return PowerNumberHandMatrix(
      id: id,
      name: name,
      powerNumbers: handPowerNumbers.map(
        (key, value) =>
            MapEntry(PreflopHand.fromString(key), HandPowerNumber.fromJson({key: value})),
      ),
    );
  }

  const PowerNumberHandMatrix._();

  /// 当該パワーナンバー表において、指定されたプリフロップハンドのパワーナンバー。
  HandPowerNumber getPowerNumber(PreflopHand preflopHand) {
    final powerNumber = powerNumbers[preflopHand];
    if (powerNumber == null) {
      throw ArgumentError('Invalid preflop hand: $preflopHand');
    }
    return powerNumber;
  }
}

/// ハンドのパワーナンバー。
@freezed
sealed class HandPowerNumber with _$HandPowerNumber {
  /// 有効 M 値に関係なく、常に All-in するハンド。
  const factory HandPowerNumber.alwaysAllIn(PreflopHand preflopHand) = AlwaysAllInHandPowerNumber;

  /// 有効 M 値に応じて、All-in するかフォールドするかを選択するハンド。
  const factory HandPowerNumber.selectable({
    required PreflopHand preflopHand,
    required int powerNumber,
  }) = SelectableHandPowerNumber;

  /// 有効 M 値に関係なく、常にフォールドするハンド。
  const factory HandPowerNumber.fold(PreflopHand preflopHand) = FoldHandPowerNumber;

  /// 指定された JSON からパワーナンバーを生成する。
  ///
  /// [json] は下記のような JSON 形式を期待する。
  ///
  /// AA の場合の例：
  ///
  /// ```json
  /// {
  ///   "aces": "all"
  /// }
  /// ```
  ///
  /// ATs の場合の例：
  ///
  /// ```json
  /// {
  ///   "ace-ten-s": 36
  /// }
  /// ```
  factory HandPowerNumber.fromJson(Map<String, dynamic> json) {
    // キーを取得し、対応する PreflopHand を生成する。
    final key = json.keys.first;
    final preflopHand = PreflopHand.fromString(key);

    // 値を取得する。
    final value = json[key];

    // 値が 'all' の場合は常に All-in するハンドである。
    if (value == 'all') {
      return HandPowerNumber.alwaysAllIn(preflopHand);
    }

    // 以下では value は整数値である。
    final powerNumber = value as int;

    // 値が 0 以下の場合は常にフォールドするハンドである。
    if (powerNumber <= 0) {
      return HandPowerNumber.fold(preflopHand);
    }

    // それ以外の場合は、有効 M 値に応じて All-in するかフォールドするかを選択するハンドである。
    return HandPowerNumber.selectable(preflopHand: preflopHand, powerNumber: powerNumber);
  }
}
