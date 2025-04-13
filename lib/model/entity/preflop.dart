import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflop.freezed.dart';

/// プリフロップハンドレンジ表。
@freezed
abstract class PreflopHandRangeMatrix with _$PreflopHandRangeMatrix {
  const factory PreflopHandRangeMatrix({
    required String id,
    required String name,
    required List<PreflopRank> preflopRanks,
    required Map<PreflopHand, PreflopRank> rangeData,
  }) = _PreflopHandRange;

  /// 指定された JSON からプリフロップハンドレンジ表を生成する。
  ///
  /// [json] は下記のような JSON 形式を期待する。
  ///
  /// ```json
  /// {
  ///   "id": "ハンドレンジ表の ID",
  ///   "name": "ハンドレンジ表の名前",
  ///   "ranks": [
  ///     {
  ///       "rank": 1,
  ///       "description": "当該ハンドレンジにおける rank1 の説明",
  ///       "colorCode": "#000000"
  ///     },
  ///     {
  ///       "rank": 2,
  ///       "description": "当該ハンドレンジにおける rank2 の説明",
  ///       "colorCode": "#000000"
  ///     },
  ///     ...
  ///   ],
  ///   "handRanks": {
  ///     "aces": 2,
  ///     "kings": 2,
  ///     "queens": 2,
  ///     "jacks": 1,
  ///     "tens": 1,
  ///     ...
  ///   }
  /// }
  factory PreflopHandRangeMatrix.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String? ?? 'ハンドレンジ表';
    final preflopRanks =
        (json['ranks'] as List<dynamic>)
            .map((e) => PreflopRank.fromJson(e as Map<String, dynamic>))
            .toList();
    final handRanksMap = json['handRanks'] as Map<String, dynamic>;
    return PreflopHandRangeMatrix(
      id: id,
      name: name,
      preflopRanks: preflopRanks,
      rangeData: handRanksMap.map(
        (key, value) =>
            MapEntry(PreflopHand.fromString(key), preflopRanks.where((e) => e.rank == value).first),
      ),
    );
  }

  const PreflopHandRangeMatrix._();

  /// 当該プリフロップハンドレンジ表における最大ランク。
  int get maxRank => preflopRanks.fold(0, (max, value) => max > value.rank ? max : value.rank);

  /// 当該プリフロップハンドレンジ表において、指定したプリフロップハンドのランク。
  PreflopRank getRank(PreflopHand hand) {
    final preflopRank = rangeData[hand];
    if (preflopRank == null) {
      throw ArgumentError('Invalid preflop hand: $hand');
    }
    return preflopRank;
  }
}

/// プリフロップハンドレンジ表における、あるハンドのランク。
@freezed
sealed class PreflopRank with _$PreflopRank {
  /// ランクが指定されたランク。
  const factory PreflopRank.ranked({
    required int rank,
    required String description,
    required String colorCode,
  }) = RankedPreflopRank;

  /// フォールドするべきランク。
  const factory PreflopRank.fold({required String description, required String colorCode}) =
      FoldPreflopRank;

  /// 指定された JSON からプリフロップランクを生成する。
  factory PreflopRank.fromJson(Map<String, dynamic> map) {
    final rank = map['rank'] as int;
    final description = map['description'] as String;
    final colorCode = map['colorCode'] as String;
    if (rank <= 0) {
      return PreflopRank.fold(description: description, colorCode: colorCode);
    }
    return PreflopRank.ranked(rank: rank, description: description, colorCode: colorCode);
  }

  const PreflopRank._();

  /// ランクの値を取得する。
  int get rank => switch (this) {
    RankedPreflopRank(:final rank) => rank,
    FoldPreflopRank() => 0,
  };

  /// 表示テキストを取得する。
  String get displayText => switch (this) {
    RankedPreflopRank(:final rank) => rank.toString(),
    FoldPreflopRank() => 'fold',
  };

  /// 説明文を取得する。
  @override
  String get description => switch (this) {
    RankedPreflopRank(:final description) => description,
    FoldPreflopRank(:final description) => description,
  };

  /// カラーコードを取得する。
  @override
  String get colorCode => switch (this) {
    RankedPreflopRank(:final colorCode) => colorCode,
    FoldPreflopRank(:final colorCode) => colorCode,
  };

  /// 色を取得する。
  Color get color {
    final code = int.parse(colorCode.substring(1), radix: 16);
    return Color(0xFF000000 | code);
  }
}

/// プリフロップのハンド一覧。
enum PreflopHand {
  // ポケットペア一覧 (13)。
  aces(row: 0, col: 0),
  kings(row: 1, col: 1),
  queens(row: 2, col: 2),
  jacks(row: 3, col: 3),
  tens(row: 4, col: 4),
  nines(row: 5, col: 5),
  eights(row: 6, col: 6),
  sevens(row: 7, col: 7),
  sixes(row: 8, col: 8),
  fives(row: 9, col: 9),
  fours(row: 10, col: 10),
  threes(row: 11, col: 11),
  twos(row: 12, col: 12),

  // スーテッドのハイカード一覧 (78)。
  aceKingS(row: 0, col: 1),
  aceQueenS(row: 0, col: 2),
  aceJackS(row: 0, col: 3),
  aceTenS(row: 0, col: 4),
  aceNineS(row: 0, col: 5),
  aceEightS(row: 0, col: 6),
  aceSevenS(row: 0, col: 7),
  aceSixS(row: 0, col: 8),
  aceFiveS(row: 0, col: 9),
  aceFourS(row: 0, col: 10),
  aceThreeS(row: 0, col: 11),
  aceTwoS(row: 0, col: 12),
  kingQueenS(row: 1, col: 2),
  kingJackS(row: 1, col: 3),
  kingTenS(row: 1, col: 4),
  kingNineS(row: 1, col: 5),
  kingEightS(row: 1, col: 6),
  kingSevenS(row: 1, col: 7),
  kingSixS(row: 1, col: 8),
  kingFiveS(row: 1, col: 9),
  kingFourS(row: 1, col: 10),
  kingThreeS(row: 1, col: 11),
  kingTwoS(row: 1, col: 12),
  queenJackS(row: 2, col: 3),
  queenTenS(row: 2, col: 4),
  queenNineS(row: 2, col: 5),
  queenEightS(row: 2, col: 6),
  queenSevenS(row: 2, col: 7),
  queenSixS(row: 2, col: 8),
  queenFiveS(row: 2, col: 9),
  queenFourS(row: 2, col: 10),
  queenThreeS(row: 2, col: 11),
  queenTwoS(row: 2, col: 12),
  jackTenS(row: 3, col: 4),
  jackNineS(row: 3, col: 5),
  jackEightS(row: 3, col: 6),
  jackSevenS(row: 3, col: 7),
  jackSixS(row: 3, col: 8),
  jackFiveS(row: 3, col: 9),
  jackFourS(row: 3, col: 10),
  jackThreeS(row: 3, col: 11),
  jackTwoS(row: 3, col: 12),
  tenNineS(row: 4, col: 5),
  tenEightS(row: 4, col: 6),
  tenSevenS(row: 4, col: 7),
  tenSixS(row: 4, col: 8),
  tenFiveS(row: 4, col: 9),
  tenFourS(row: 4, col: 10),
  tenThreeS(row: 4, col: 11),
  tenTwoS(row: 4, col: 12),
  nineEightS(row: 5, col: 6),
  nineSevenS(row: 5, col: 7),
  nineSixS(row: 5, col: 8),
  nineFiveS(row: 5, col: 9),
  nineFourS(row: 5, col: 10),
  nineThreeS(row: 5, col: 11),
  nineTwoS(row: 5, col: 12),
  eightSevenS(row: 6, col: 7),
  eightSixS(row: 6, col: 8),
  eightFiveS(row: 6, col: 9),
  eightFourS(row: 6, col: 10),
  eightThreeS(row: 6, col: 11),
  eightTwoS(row: 6, col: 12),
  sevenSixS(row: 7, col: 8),
  sevenFiveS(row: 7, col: 9),
  sevenFourS(row: 7, col: 10),
  sevenThreeS(row: 7, col: 11),
  sevenTwoS(row: 7, col: 12),
  sixFiveS(row: 8, col: 9),
  sixFourS(row: 8, col: 10),
  sixThreeS(row: 8, col: 11),
  sixTwoS(row: 8, col: 12),
  fiveFourS(row: 9, col: 10),
  fiveThreeS(row: 9, col: 11),
  fiveTwoS(row: 9, col: 12),
  fourThreeS(row: 10, col: 11),
  fourTwoS(row: 10, col: 12),
  threeTwoS(row: 11, col: 12),

  // オフスートのハイカード一覧 (78)。
  aceKingO(row: 1, col: 0),
  aceQueenO(row: 2, col: 0),
  aceJackO(row: 3, col: 0),
  aceTenO(row: 4, col: 0),
  aceNineO(row: 5, col: 0),
  aceEightO(row: 6, col: 0),
  aceSevenO(row: 7, col: 0),
  aceSixO(row: 8, col: 0),
  aceFiveO(row: 9, col: 0),
  aceFourO(row: 10, col: 0),
  aceThreeO(row: 11, col: 0),
  aceTwoO(row: 12, col: 0),
  kingQueenO(row: 2, col: 1),
  kingJackO(row: 3, col: 1),
  kingTenO(row: 4, col: 1),
  kingNineO(row: 5, col: 1),
  kingEightO(row: 6, col: 1),
  kingSevenO(row: 7, col: 1),
  kingSixO(row: 8, col: 1),
  kingFiveO(row: 9, col: 1),
  kingFourO(row: 10, col: 1),
  kingThreeO(row: 11, col: 1),
  kingTwoO(row: 12, col: 1),
  queenJackO(row: 3, col: 2),
  queenTenO(row: 4, col: 2),
  queenNineO(row: 5, col: 2),
  queenEightO(row: 6, col: 2),
  queenSevenO(row: 7, col: 2),
  queenSixO(row: 8, col: 2),
  queenFiveO(row: 9, col: 2),
  queenFourO(row: 10, col: 2),
  queenThreeO(row: 11, col: 2),
  queenTwoO(row: 12, col: 2),
  jackTenO(row: 4, col: 3),
  jackNineO(row: 5, col: 3),
  jackEightO(row: 6, col: 3),
  jackSevenO(row: 7, col: 3),
  jackSixO(row: 8, col: 3),
  jackFiveO(row: 9, col: 3),
  jackFourO(row: 10, col: 3),
  jackThreeO(row: 11, col: 3),
  jackTwoO(row: 12, col: 3),
  tenNineO(row: 5, col: 4),
  tenEightO(row: 6, col: 4),
  tenSevenO(row: 7, col: 4),
  tenSixO(row: 8, col: 4),
  tenFiveO(row: 9, col: 4),
  tenFourO(row: 10, col: 4),
  tenThreeO(row: 11, col: 4),
  tenTwoO(row: 12, col: 4),
  nineEightO(row: 6, col: 5),
  nineSevenO(row: 7, col: 5),
  nineSixO(row: 8, col: 5),
  nineFiveO(row: 9, col: 5),
  nineFourO(row: 10, col: 5),
  nineThreeO(row: 11, col: 5),
  nineTwoO(row: 12, col: 5),
  eightSevenO(row: 7, col: 6),
  eightSixO(row: 8, col: 6),
  eightFiveO(row: 9, col: 6),
  eightFourO(row: 10, col: 6),
  eightThreeO(row: 11, col: 6),
  eightTwoO(row: 12, col: 6),
  sevenSixO(row: 8, col: 7),
  sevenFiveO(row: 9, col: 7),
  sevenFourO(row: 10, col: 7),
  sevenThreeO(row: 11, col: 7),
  sevenTwoO(row: 12, col: 7),
  sixFiveO(row: 9, col: 8),
  sixFourO(row: 10, col: 8),
  sixThreeO(row: 11, col: 8),
  sixTwoO(row: 12, col: 8),
  fiveFourO(row: 10, col: 9),
  fiveThreeO(row: 11, col: 9),
  fiveTwoO(row: 12, col: 9),
  fourThreeO(row: 11, col: 10),
  fourTwoO(row: 12, col: 10),
  threeTwoO(row: 12, col: 11);

  const PreflopHand({required this.row, required this.col});

  /// ハンドを表す文字列からハンドを生成する。
  factory PreflopHand.fromString(String value) => switch (value) {
    // ポケットペア一覧 (13)。
    'aces' => PreflopHand.aces,
    'kings' => PreflopHand.kings,
    'queens' => PreflopHand.queens,
    'jacks' => PreflopHand.jacks,
    'tens' => PreflopHand.tens,
    'nines' => PreflopHand.nines,
    'eights' => PreflopHand.eights,
    'sevens' => PreflopHand.sevens,
    'sixes' => PreflopHand.sixes,
    'fives' => PreflopHand.fives,
    'fours' => PreflopHand.fours,
    'threes' => PreflopHand.threes,
    'twos' => PreflopHand.twos,

    // スーテッドのハイカード一覧 (78)。
    'ace-king-s' => PreflopHand.aceKingS,
    'ace-queen-s' => PreflopHand.aceQueenS,
    'ace-jack-s' => PreflopHand.aceJackS,
    'ace-ten-s' => PreflopHand.aceTenS,
    'ace-nine-s' => PreflopHand.aceNineS,
    'ace-eight-s' => PreflopHand.aceEightS,
    'ace-seven-s' => PreflopHand.aceSevenS,
    'ace-six-s' => PreflopHand.aceSixS,
    'ace-five-s' => PreflopHand.aceFiveS,
    'ace-four-s' => PreflopHand.aceFourS,
    'ace-three-s' => PreflopHand.aceThreeS,
    'ace-two-s' => PreflopHand.aceTwoS,
    'king-queen-s' => PreflopHand.kingQueenS,
    'king-jack-s' => PreflopHand.kingJackS,
    'king-ten-s' => PreflopHand.kingTenS,
    'king-nine-s' => PreflopHand.kingNineS,
    'king-eight-s' => PreflopHand.kingEightS,
    'king-seven-s' => PreflopHand.kingSevenS,
    'king-six-s' => PreflopHand.kingSixS,
    'king-five-s' => PreflopHand.kingFiveS,
    'king-four-s' => PreflopHand.kingFourS,
    'king-three-s' => PreflopHand.kingThreeS,
    'king-two-s' => PreflopHand.kingTwoS,
    'queen-jack-s' => PreflopHand.queenJackS,
    'queen-ten-s' => PreflopHand.queenTenS,
    'queen-nine-s' => PreflopHand.queenNineS,
    'queen-eight-s' => PreflopHand.queenEightS,
    'queen-seven-s' => PreflopHand.queenSevenS,
    'queen-six-s' => PreflopHand.queenSixS,
    'queen-five-s' => PreflopHand.queenFiveS,
    'queen-four-s' => PreflopHand.queenFourS,
    'queen-three-s' => PreflopHand.queenThreeS,
    'queen-two-s' => PreflopHand.queenTwoS,
    'jack-ten-s' => PreflopHand.jackTenS,
    'jack-nine-s' => PreflopHand.jackNineS,
    'jack-eight-s' => PreflopHand.jackEightS,
    'jack-seven-s' => PreflopHand.jackSevenS,
    'jack-six-s' => PreflopHand.jackSixS,
    'jack-five-s' => PreflopHand.jackFiveS,
    'jack-four-s' => PreflopHand.jackFourS,
    'jack-three-s' => PreflopHand.jackThreeS,
    'jack-two-s' => PreflopHand.jackTwoS,
    'ten-nine-s' => PreflopHand.tenNineS,
    'ten-eight-s' => PreflopHand.tenEightS,
    'ten-seven-s' => PreflopHand.tenSevenS,
    'ten-six-s' => PreflopHand.tenSixS,
    'ten-five-s' => PreflopHand.tenFiveS,
    'ten-four-s' => PreflopHand.tenFourS,
    'ten-three-s' => PreflopHand.tenThreeS,
    'ten-two-s' => PreflopHand.tenTwoS,
    'nine-eight-s' => PreflopHand.nineEightS,
    'nine-seven-s' => PreflopHand.nineSevenS,
    'nine-six-s' => PreflopHand.nineSixS,
    'nine-five-s' => PreflopHand.nineFiveS,
    'nine-four-s' => PreflopHand.nineFourS,
    'nine-three-s' => PreflopHand.nineThreeS,
    'nine-two-s' => PreflopHand.nineTwoS,
    'eight-seven-s' => PreflopHand.eightSevenS,
    'eight-six-s' => PreflopHand.eightSixS,
    'eight-five-s' => PreflopHand.eightFiveS,
    'eight-four-s' => PreflopHand.eightFourS,
    'eight-three-s' => PreflopHand.eightThreeS,
    'eight-two-s' => PreflopHand.eightTwoS,
    'seven-six-s' => PreflopHand.sevenSixS,
    'seven-five-s' => PreflopHand.sevenFiveS,
    'seven-four-s' => PreflopHand.sevenFourS,
    'seven-three-s' => PreflopHand.sevenThreeS,
    'seven-two-s' => PreflopHand.sevenTwoS,
    'six-five-s' => PreflopHand.sixFiveS,
    'six-four-s' => PreflopHand.sixFourS,
    'six-three-s' => PreflopHand.sixThreeS,
    'six-two-s' => PreflopHand.sixTwoS,
    'five-four-s' => PreflopHand.fiveFourS,
    'five-three-s' => PreflopHand.fiveThreeS,
    'five-two-s' => PreflopHand.fiveTwoS,
    'four-three-s' => PreflopHand.fourThreeS,
    'four-two-s' => PreflopHand.fourTwoS,
    'three-two-s' => PreflopHand.threeTwoS,

    // オフスートのハイカード一覧 (78)。
    'ace-king-o' => PreflopHand.aceKingO,
    'ace-queen-o' => PreflopHand.aceQueenO,
    'ace-jack-o' => PreflopHand.aceJackO,
    'ace-ten-o' => PreflopHand.aceTenO,
    'ace-nine-o' => PreflopHand.aceNineO,
    'ace-eight-o' => PreflopHand.aceEightO,
    'ace-seven-o' => PreflopHand.aceSevenO,
    'ace-six-o' => PreflopHand.aceSixO,
    'ace-five-o' => PreflopHand.aceFiveO,
    'ace-four-o' => PreflopHand.aceFourO,
    'ace-three-o' => PreflopHand.aceThreeO,
    'ace-two-o' => PreflopHand.aceTwoO,
    'king-queen-o' => PreflopHand.kingQueenO,
    'king-jack-o' => PreflopHand.kingJackO,
    'king-ten-o' => PreflopHand.kingTenO,
    'king-nine-o' => PreflopHand.kingNineO,
    'king-eight-o' => PreflopHand.kingEightO,
    'king-seven-o' => PreflopHand.kingSevenO,
    'king-six-o' => PreflopHand.kingSixO,
    'king-five-o' => PreflopHand.kingFiveO,
    'king-four-o' => PreflopHand.kingFourO,
    'king-three-o' => PreflopHand.kingThreeO,
    'king-two-o' => PreflopHand.kingTwoO,
    'queen-jack-o' => PreflopHand.queenJackO,
    'queen-ten-o' => PreflopHand.queenTenO,
    'queen-nine-o' => PreflopHand.queenNineO,
    'queen-eight-o' => PreflopHand.queenEightO,
    'queen-seven-o' => PreflopHand.queenSevenO,
    'queen-six-o' => PreflopHand.queenSixO,
    'queen-five-o' => PreflopHand.queenFiveO,
    'queen-four-o' => PreflopHand.queenFourO,
    'queen-three-o' => PreflopHand.queenThreeO,
    'queen-two-o' => PreflopHand.queenTwoO,
    'jack-ten-o' => PreflopHand.jackTenO,
    'jack-nine-o' => PreflopHand.jackNineO,
    'jack-eight-o' => PreflopHand.jackEightO,
    'jack-seven-o' => PreflopHand.jackSevenO,
    'jack-six-o' => PreflopHand.jackSixO,
    'jack-five-o' => PreflopHand.jackFiveO,
    'jack-four-o' => PreflopHand.jackFourO,
    'jack-three-o' => PreflopHand.jackThreeO,
    'jack-two-o' => PreflopHand.jackTwoO,
    'ten-nine-o' => PreflopHand.tenNineO,
    'ten-eight-o' => PreflopHand.tenEightO,
    'ten-seven-o' => PreflopHand.tenSevenO,
    'ten-six-o' => PreflopHand.tenSixO,
    'ten-five-o' => PreflopHand.tenFiveO,
    'ten-four-o' => PreflopHand.tenFourO,
    'ten-three-o' => PreflopHand.tenThreeO,
    'ten-two-o' => PreflopHand.tenTwoO,
    'nine-eight-o' => PreflopHand.nineEightO,
    'nine-seven-o' => PreflopHand.nineSevenO,
    'nine-six-o' => PreflopHand.nineSixO,
    'nine-five-o' => PreflopHand.nineFiveO,
    'nine-four-o' => PreflopHand.nineFourO,
    'nine-three-o' => PreflopHand.nineThreeO,
    'nine-two-o' => PreflopHand.nineTwoO,
    'eight-seven-o' => PreflopHand.eightSevenO,
    'eight-six-o' => PreflopHand.eightSixO,
    'eight-five-o' => PreflopHand.eightFiveO,
    'eight-four-o' => PreflopHand.eightFourO,
    'eight-three-o' => PreflopHand.eightThreeO,
    'eight-two-o' => PreflopHand.eightTwoO,
    'seven-six-o' => PreflopHand.sevenSixO,
    'seven-five-o' => PreflopHand.sevenFiveO,
    'seven-four-o' => PreflopHand.sevenFourO,
    'seven-three-o' => PreflopHand.sevenThreeO,
    'seven-two-o' => PreflopHand.sevenTwoO,
    'six-five-o' => PreflopHand.sixFiveO,
    'six-four-o' => PreflopHand.sixFourO,
    'six-three-o' => PreflopHand.sixThreeO,
    'six-two-o' => PreflopHand.sixTwoO,
    'five-four-o' => PreflopHand.fiveFourO,
    'five-three-o' => PreflopHand.fiveThreeO,
    'five-two-o' => PreflopHand.fiveTwoO,
    'four-three-o' => PreflopHand.fourThreeO,
    'four-two-o' => PreflopHand.fourTwoO,
    'three-two-o' => PreflopHand.threeTwoO,
    _ => throw ArgumentError('Invalid preflop hand: $value'),
  };

  /// マトリックスにおける行番号。
  final int row;

  /// マトリックスにおける列番号。
  final int col;

  /// マトリックスにおける表示テキスト。
  String get displayText {
    final ranks = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'];
    final firstRank = ranks[row];
    final secondRank = ranks[col];
    if (row == col) {
      return '$firstRank$firstRank';
    }
    final suffix = row < col ? 's' : 'o';
    // 強い数字を前に表示する。
    final first = row < col ? firstRank : secondRank;
    final second = row < col ? secondRank : firstRank;
    return '$first$second$suffix';
  }
}
