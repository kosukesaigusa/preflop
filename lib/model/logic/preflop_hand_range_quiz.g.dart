// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preflop_hand_range_quiz.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredAnsweredQuizzesHash() =>
    r'3559b23235bf4f07a8967a340a7da5b5b01ad162';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
///
/// Copied from [filteredAnsweredQuizzes].
@ProviderFor(filteredAnsweredQuizzes)
const filteredAnsweredQuizzesProvider = FilteredAnsweredQuizzesFamily();

/// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
///
/// Copied from [filteredAnsweredQuizzes].
class FilteredAnsweredQuizzesFamily
    extends Family<List<AnsweredPreflopHandRangeQuiz>> {
  /// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
  ///
  /// Copied from [filteredAnsweredQuizzes].
  const FilteredAnsweredQuizzesFamily();

  /// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
  ///
  /// Copied from [filteredAnsweredQuizzes].
  FilteredAnsweredQuizzesProvider call({required QuizeReviewFilter filter}) {
    return FilteredAnsweredQuizzesProvider(filter: filter);
  }

  @override
  FilteredAnsweredQuizzesProvider getProviderOverride(
    covariant FilteredAnsweredQuizzesProvider provider,
  ) {
    return call(filter: provider.filter);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredAnsweredQuizzesProvider';
}

/// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
///
/// Copied from [filteredAnsweredQuizzes].
class FilteredAnsweredQuizzesProvider
    extends AutoDisposeProvider<List<AnsweredPreflopHandRangeQuiz>> {
  /// [filter] で絞り込まれた回答済みクイズ一覧を取得する。
  ///
  /// Copied from [filteredAnsweredQuizzes].
  FilteredAnsweredQuizzesProvider({required QuizeReviewFilter filter})
    : this._internal(
        (ref) => filteredAnsweredQuizzes(
          ref as FilteredAnsweredQuizzesRef,
          filter: filter,
        ),
        from: filteredAnsweredQuizzesProvider,
        name: r'filteredAnsweredQuizzesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$filteredAnsweredQuizzesHash,
        dependencies: FilteredAnsweredQuizzesFamily._dependencies,
        allTransitiveDependencies:
            FilteredAnsweredQuizzesFamily._allTransitiveDependencies,
        filter: filter,
      );

  FilteredAnsweredQuizzesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final QuizeReviewFilter filter;

  @override
  Override overrideWith(
    List<AnsweredPreflopHandRangeQuiz> Function(
      FilteredAnsweredQuizzesRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredAnsweredQuizzesProvider._internal(
        (ref) => create(ref as FilteredAnsweredQuizzesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AnsweredPreflopHandRangeQuiz>>
  createElement() {
    return _FilteredAnsweredQuizzesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredAnsweredQuizzesProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredAnsweredQuizzesRef
    on AutoDisposeProviderRef<List<AnsweredPreflopHandRangeQuiz>> {
  /// The parameter `filter` of this provider.
  QuizeReviewFilter get filter;
}

class _FilteredAnsweredQuizzesProviderElement
    extends AutoDisposeProviderElement<List<AnsweredPreflopHandRangeQuiz>>
    with FilteredAnsweredQuizzesRef {
  _FilteredAnsweredQuizzesProviderElement(super.provider);

  @override
  QuizeReviewFilter get filter =>
      (origin as FilteredAnsweredQuizzesProvider).filter;
}

String _$preflopHandRangeQuizzzesNotifierHash() =>
    r'899d07c91f37174f2e21e60ff66677b7cb07fc0d';

/// プリフロップのハンドレンジクイズを管理する。
///
/// Copied from [PreflopHandRangeQuizzzesNotifier].
@ProviderFor(PreflopHandRangeQuizzzesNotifier)
final preflopHandRangeQuizzzesNotifierProvider = AutoDisposeNotifierProvider<
  PreflopHandRangeQuizzzesNotifier,
  List<PreflopHandRangeQuiz>
>.internal(
  PreflopHandRangeQuizzzesNotifier.new,
  name: r'preflopHandRangeQuizzzesNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$preflopHandRangeQuizzzesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PreflopHandRangeQuizzzesNotifier =
    AutoDisposeNotifier<List<PreflopHandRangeQuiz>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
