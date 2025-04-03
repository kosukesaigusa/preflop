// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:freezed_annotation/freezed_annotation.dart';

import 'card.dart';
import 'preflop.dart';

part 'hand.freezed.dart';

@freezed
class Hand with _$Hand {
  const factory Hand({required Card card1, required Card card2}) = _Hand;

  /// ランダムにハンドを生成する。
  ///
  /// 52 種類のカードからランダムに異なる 2 枚を選択して返す。
  factory Hand.random() {
    // 52 枚のカードリストを取得し、シャッフルする
    final cards = List<Card>.from(Card.values)..shuffle();
    // シャッフルされたリストから最初の 2 枚を選んで返す。
    return Hand(card1: cards[0], card2: cards[1]);
  }

  const Hand._();

  /// ハンドのカードを取得する。
  ///
  /// - ハンドのランクが高い順（A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3 > 2）
  /// - ハンドのマークの優先度順（スペード > ハート > ダイヤ > クラブ）
  ///
  /// で並び替えて返す。
  List<Card> get cards => [card1, card2]..sort((a, b) {
    // ランクが異なる場合のみ、ランクの優先度順にソートする。
    if (a.rank != b.rank) {
      return a.rank.index.compareTo(b.rank.index);
    }
    // ランクが同じ場合のみ、マークの優先度順にソートする。
    return a.mark.index.compareTo(b.mark.index);
  });

  /// プリフロップにおけるハンドの ID を返す。
  ///
  /// ハンドのカードの順序は問わない。
  ///
  /// 例：
  ///
  /// - ペア："aces".
  /// - スーテッドのハイカード："ace-king-s".
  /// - スーテッドのローカード："ace-king-o"
  PreflopHand get asPreflopHand {
    // Rank enum のインデックスに基づいてランクの高いカードと低いカードを決定する (インデックスが小さいほどランクが高い)。
    final highCard = card1.rank.index < card2.rank.index ? card1 : card2;
    final lowCard = card1.rank.index > card2.rank.index ? card1 : card2;

    // ポケットペアの場合のプリフロップハンドを返す。
    if (card1.rank == card2.rank) {
      // 単純な複数形化 (例: ace -> aces) をする。
      final rankName = card1.rank.name;
      // 'six' の場合は 'sixes' に、それ以外は 's' を追加する。
      final preflopHandId = rankName == 'six' ? 'sixes' : '${rankName}s';
      return PreflopHand.fromString(preflopHandId);
    }

    // スーテッドかオフスートかを判定する。
    final suited = card1.mark == card2.mark;
    final suffix = suited ? 's' : 'o';

    // ハイカードとローカードのランクを結合してプリフロップハンドを返す。
    final preflopHandId = '${highCard.rank.name}-${lowCard.rank.name}-$suffix';
    return PreflopHand.fromString(preflopHandId);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Hand) {
      return false;
    }

    // カード ID をソートして、順序が比較に影響しないようにする。
    final sortedIds = [card1.id, card2.id]..sort();
    final otherSortedIds = [other.card1.id, other.card2.id]..sort();

    // ソートされたリストを比較する。
    return const DeepCollectionEquality().equals(sortedIds, otherSortedIds);
  }

  @override
  int get hashCode {
    // カード ID をソートし、それらのハッシュコードを結合する。
    final sortedIds = [card1.id, card2.id]..sort();
    return const DeepCollectionEquality().hash(sortedIds);
  }
}
