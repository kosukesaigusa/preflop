// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preflop_hand_range_matrix.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availablePreflopHandRangeMatricesHash() =>
    r'7d7e6fb0130037cfe78523735475976cf93f6736';

/// 利用可能なプリフロップハンドレンジ表一覧を取得する。
///
/// Copied from [availablePreflopHandRangeMatrices].
@ProviderFor(availablePreflopHandRangeMatrices)
final availablePreflopHandRangeMatricesProvider =
    AutoDisposeProvider<List<PreflopHandRangeMatrix>>.internal(
      availablePreflopHandRangeMatrices,
      name: r'availablePreflopHandRangeMatricesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$availablePreflopHandRangeMatricesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailablePreflopHandRangeMatricesRef =
    AutoDisposeProviderRef<List<PreflopHandRangeMatrix>>;
String _$preflopHandRangeMatricesNotifierHash() =>
    r'7f7c274fabf72ba54b712e110e1edc5f216edbdb';

/// 現在選択されているプリフロップハンドレンジ表を管理する。
///
/// Copied from [PreflopHandRangeMatricesNotifier].
@ProviderFor(PreflopHandRangeMatricesNotifier)
final preflopHandRangeMatricesNotifierProvider = AutoDisposeNotifierProvider<
  PreflopHandRangeMatricesNotifier,
  PreflopHandRangeMatrix
>.internal(
  PreflopHandRangeMatricesNotifier.new,
  name: r'preflopHandRangeMatricesNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$preflopHandRangeMatricesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PreflopHandRangeMatricesNotifier =
    AutoDisposeNotifier<PreflopHandRangeMatrix>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
