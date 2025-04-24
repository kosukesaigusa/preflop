import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repository/local_storage_repository.dart';
import '../entity/preflop.dart';
import 'preflop_hand_range_matrix.dart';

part 'last_selected_preflop_hand_range_matrix_use_case.g.dart';

@riverpod
FetchLastSelectedPreflopHandRangeMatrixUseCase fetchLastSelectedPreflopHandRangeMatrixUseCase(
  Ref ref,
) => FetchLastSelectedPreflopHandRangeMatrixUseCase(ref);

/// 前回最後に選択されたプリフロップハンドレンジ表を取得する。
class FetchLastSelectedPreflopHandRangeMatrixUseCase {
  /// [FetchLastSelectedPreflopHandRangeMatrixUseCase] を生成する。
  const FetchLastSelectedPreflopHandRangeMatrixUseCase(this._ref);

  final Ref _ref;

  /// 前回最後に選択されたプリフロップハンドレンジ表を取得する。
  ///
  /// 存在しない場合は `null` を返す。
  Future<PreflopHandRangeMatrix?> invoke() async {
    // 前回最後に選択されたプリフロップハンドレンジ表の ID を取得する。
    final lastSelectedPreflopHandRangeMatrixId =
        await _ref.read(localStorageRepositoryProvider).fetchLastUsedHandRangeId();

    // 前回最後に選択されたプリフロップハンドレンジ表の ID が存在しない場合は null を返す。
    if (lastSelectedPreflopHandRangeMatrixId == null) {
      return null;
    }

    // 利用可能なプリフロップハンドレンジ表一覧を取得する。
    final availablePreflopHandRangeMatrices = _ref.read(availablePreflopHandRangeMatricesProvider);

    // 前回最後に選択されたプリフロップハンドレンジ表の ID に対応するプリフロップハンドレンジ表を取得する。
    // 存在しない場合は null を返す。
    return availablePreflopHandRangeMatrices.firstWhereOrNull(
      (matrix) => matrix.id == lastSelectedPreflopHandRangeMatrixId,
    );
  }
}

@riverpod
SaveLastSelectedPreflopHandRangeMatrixUseCase saveLastSelectedPreflopHandRangeMatrixUseCase(
  Ref ref,
) => SaveLastSelectedPreflopHandRangeMatrixUseCase(ref);

/// 最後に選択されたプリフロップハンドレンジ表を保存する。
class SaveLastSelectedPreflopHandRangeMatrixUseCase {
  /// [SaveLastSelectedPreflopHandRangeMatrixUseCase] を生成する。
  const SaveLastSelectedPreflopHandRangeMatrixUseCase(this._ref);

  final Ref _ref;

  /// 最後に選択されたプリフロップハンドレンジ表を保存する。
  Future<void> invoke(PreflopHandRangeMatrix preflopHandRangeMatrix) =>
      _ref.read(localStorageRepositoryProvider).saveLastUsedHandRangeId(preflopHandRangeMatrix.id);
}
