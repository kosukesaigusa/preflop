import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/hand_range/ring_game_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/tournament_yokosawa_preflop_hand_range.dart';
import '../entity/preflop.dart';

part 'preflop_hand_range_matrix.g.dart';

/// 利用可能なプリフロップハンドレンジ表一覧を取得する。
@riverpod
List<PreflopHandRangeMatrix> availablePreflopHandRangeMatrices(Ref ref) => [
  PreflopHandRangeMatrix.fromMap(tournamentYokosawaPreflopHandRangeData),
  PreflopHandRangeMatrix.fromMap(ringGameYokosawaPreflopHandRangeData),
];

/// 現在選択されているプリフロップハンドレンジ表を管理する。
@riverpod
class PreflopHandRangeMatricesNotifier
    extends _$PreflopHandRangeMatricesNotifier {
  @override
  PreflopHandRangeMatrix build() =>
      ref.watch(availablePreflopHandRangeMatricesProvider).first;

  /// 現在選択されているプリフロップハンドレンジ表を更新する。
  void update(PreflopHandRangeMatrix newMatrix) => state = newMatrix;
}
