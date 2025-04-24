import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/hand_range/basic/ring_game_amu_preflop_3bet_hand_range.dart';
import '../data/hand_range/basic/ring_game_amu_preflop_hand_range.dart';
import '../data/hand_range/basic/ring_game_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/basic/tournament_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/mtt_bb_vs_button_open_100bb_preflop_hand_range.dart';
import '../data/hand_range/mtt_sb_vs_button_open_100bb_preflop_hand_range.dart';
import '../entity/preflop.dart';

part 'preflop_hand_range_matrix.g.dart';

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
