import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/hand_range/basic/ring_game_amu_preflop_3bet_hand_range.dart';
import '../data/hand_range/basic/ring_game_amu_preflop_hand_range.dart';
import '../data/hand_range/basic/ring_game_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/basic/tournament_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/mtt_bb_vs_button_open_100bb_preflop_hand_range.dart';
import '../data/hand_range/mtt_sb_vs_button_open_100bb_preflop_hand_range.dart';
import '../entity/preflop.dart';
import 'last_selected_preflop_hand_range_matrix_use_case.dart';

part 'preflop_hand_range_matrix.g.dart';

/// 最初に選択状態にするプリフロップハンドレンジ表を取得する。
///
/// アプリの起動時に予め初期化しておき、keepAlive: true にすることで、ウィジェットツリーからの
/// 参照が切れても、[eagerlyInitializedSelectedPreflopHandRangeMatrix] から利用できる
/// ようにしている。
@Riverpod(keepAlive: true)
Future<PreflopHandRangeMatrix?> initialPreflopHandRangeMatrix(Ref ref) =>
    ref.read(fetchLastSelectedPreflopHandRangeMatrixUseCaseProvider).invoke();

/// 最後に選択されたプリフロップハンドレンジ表を同期的に取得する。
///
/// 予め [eagerlyInitializedSelectedPreflopHandRangeMatrix] が初期化済みであることを
/// 期待する。
@Riverpod(keepAlive: true)
PreflopHandRangeMatrix? eagerlyInitializedSelectedPreflopHandRangeMatrix(Ref ref) {
  try {
    return ref.read(initialPreflopHandRangeMatrixProvider).requireValue;
  }
  // NOTE: .requireValue に失敗すると発生する StateError およびその他のエラーもまとめて
  // 握りつぶして、意図的に null を返すことにしている。
  // ignore: avoid_catching_errors
  on Error {
    return null;
  }
}

/// 利用可能なプリフロップハンドレンジ表一覧を取得する。
@riverpod
List<PreflopHandRangeMatrix> availablePreflopHandRangeMatrices(Ref ref) => [
  // 基本のハンドレンジ表。
  PreflopHandRangeMatrix.fromJson(tournamentYokosawaPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameYokosawaPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameAmuPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameAmuPreflop3BetHandRangeData),
  // GTO によるシチュエーションごとのハンドレンジ表。
  PreflopHandRangeMatrix.fromJson(mttBbVsBtnOpen100bbPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(mttSbVsBtnOpen100bbPreflopHandRangeData),
];
