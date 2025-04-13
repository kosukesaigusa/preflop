import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/hand_range/ring_game_amu_preflop_3bet_hand_range.dart';
import '../data/hand_range/ring_game_amu_preflop_hand_range.dart';
import '../data/hand_range/ring_game_yokosawa_preflop_hand_range.dart';
import '../data/hand_range/tournament_yokosawa_preflop_hand_range.dart';
import '../entity/preflop.dart';

part 'preflop_hand_range_matrix.g.dart';

/// 利用可能なプリフロップハンドレンジ表一覧を取得する。
@riverpod
List<PreflopHandRangeMatrix> availablePreflopHandRangeMatrices(Ref ref) => [
  PreflopHandRangeMatrix.fromJson(tournamentYokosawaPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameYokosawaPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameAmuPreflopHandRangeData),
  PreflopHandRangeMatrix.fromJson(ringGameAmuPreflop3BetHandRangeData),
];
