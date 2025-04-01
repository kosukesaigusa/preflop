// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PreflopHandRangeMatrix {
  int get maxRank => throw _privateConstructorUsedError;
  Map<PreflopHand, PreflopRank> get rangeData =>
      throw _privateConstructorUsedError;

  /// Create a copy of PreflopHandRangeMatrix
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreflopHandRangeMatrixCopyWith<PreflopHandRangeMatrix> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflopHandRangeMatrixCopyWith<$Res> {
  factory $PreflopHandRangeMatrixCopyWith(
    PreflopHandRangeMatrix value,
    $Res Function(PreflopHandRangeMatrix) then,
  ) = _$PreflopHandRangeMatrixCopyWithImpl<$Res, PreflopHandRangeMatrix>;
  @useResult
  $Res call({int maxRank, Map<PreflopHand, PreflopRank> rangeData});
}

/// @nodoc
class _$PreflopHandRangeMatrixCopyWithImpl<
  $Res,
  $Val extends PreflopHandRangeMatrix
>
    implements $PreflopHandRangeMatrixCopyWith<$Res> {
  _$PreflopHandRangeMatrixCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflopHandRangeMatrix
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? maxRank = null, Object? rangeData = null}) {
    return _then(
      _value.copyWith(
            maxRank:
                null == maxRank
                    ? _value.maxRank
                    : maxRank // ignore: cast_nullable_to_non_nullable
                        as int,
            rangeData:
                null == rangeData
                    ? _value.rangeData
                    : rangeData // ignore: cast_nullable_to_non_nullable
                        as Map<PreflopHand, PreflopRank>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreflopHandRangeImplCopyWith<$Res>
    implements $PreflopHandRangeMatrixCopyWith<$Res> {
  factory _$$PreflopHandRangeImplCopyWith(
    _$PreflopHandRangeImpl value,
    $Res Function(_$PreflopHandRangeImpl) then,
  ) = __$$PreflopHandRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int maxRank, Map<PreflopHand, PreflopRank> rangeData});
}

/// @nodoc
class __$$PreflopHandRangeImplCopyWithImpl<$Res>
    extends _$PreflopHandRangeMatrixCopyWithImpl<$Res, _$PreflopHandRangeImpl>
    implements _$$PreflopHandRangeImplCopyWith<$Res> {
  __$$PreflopHandRangeImplCopyWithImpl(
    _$PreflopHandRangeImpl _value,
    $Res Function(_$PreflopHandRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflopHandRangeMatrix
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? maxRank = null, Object? rangeData = null}) {
    return _then(
      _$PreflopHandRangeImpl(
        maxRank:
            null == maxRank
                ? _value.maxRank
                : maxRank // ignore: cast_nullable_to_non_nullable
                    as int,
        rangeData:
            null == rangeData
                ? _value._rangeData
                : rangeData // ignore: cast_nullable_to_non_nullable
                    as Map<PreflopHand, PreflopRank>,
      ),
    );
  }
}

/// @nodoc

class _$PreflopHandRangeImpl extends _PreflopHandRange {
  const _$PreflopHandRangeImpl({
    required this.maxRank,
    required final Map<PreflopHand, PreflopRank> rangeData,
  }) : _rangeData = rangeData,
       super._();

  @override
  final int maxRank;
  final Map<PreflopHand, PreflopRank> _rangeData;
  @override
  Map<PreflopHand, PreflopRank> get rangeData {
    if (_rangeData is EqualUnmodifiableMapView) return _rangeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rangeData);
  }

  @override
  String toString() {
    return 'PreflopHandRangeMatrix(maxRank: $maxRank, rangeData: $rangeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreflopHandRangeImpl &&
            (identical(other.maxRank, maxRank) || other.maxRank == maxRank) &&
            const DeepCollectionEquality().equals(
              other._rangeData,
              _rangeData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    maxRank,
    const DeepCollectionEquality().hash(_rangeData),
  );

  /// Create a copy of PreflopHandRangeMatrix
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreflopHandRangeImplCopyWith<_$PreflopHandRangeImpl> get copyWith =>
      __$$PreflopHandRangeImplCopyWithImpl<_$PreflopHandRangeImpl>(
        this,
        _$identity,
      );
}

abstract class _PreflopHandRange extends PreflopHandRangeMatrix {
  const factory _PreflopHandRange({
    required final int maxRank,
    required final Map<PreflopHand, PreflopRank> rangeData,
  }) = _$PreflopHandRangeImpl;
  const _PreflopHandRange._() : super._();

  @override
  int get maxRank;
  @override
  Map<PreflopHand, PreflopRank> get rangeData;

  /// Create a copy of PreflopHandRangeMatrix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreflopHandRangeImplCopyWith<_$PreflopHandRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PreflopRank {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int rank) ranked,
    required TResult Function() fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank)? ranked,
    TResult? Function()? fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank)? ranked,
    TResult Function()? fold,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankedPreflopRank value) ranked,
    required TResult Function(FoldPreflopRank value) fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankedPreflopRank value)? ranked,
    TResult? Function(FoldPreflopRank value)? fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankedPreflopRank value)? ranked,
    TResult Function(FoldPreflopRank value)? fold,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflopRankCopyWith<$Res> {
  factory $PreflopRankCopyWith(
    PreflopRank value,
    $Res Function(PreflopRank) then,
  ) = _$PreflopRankCopyWithImpl<$Res, PreflopRank>;
}

/// @nodoc
class _$PreflopRankCopyWithImpl<$Res, $Val extends PreflopRank>
    implements $PreflopRankCopyWith<$Res> {
  _$PreflopRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RankedPreflopRankImplCopyWith<$Res> {
  factory _$$RankedPreflopRankImplCopyWith(
    _$RankedPreflopRankImpl value,
    $Res Function(_$RankedPreflopRankImpl) then,
  ) = __$$RankedPreflopRankImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int rank});
}

/// @nodoc
class __$$RankedPreflopRankImplCopyWithImpl<$Res>
    extends _$PreflopRankCopyWithImpl<$Res, _$RankedPreflopRankImpl>
    implements _$$RankedPreflopRankImplCopyWith<$Res> {
  __$$RankedPreflopRankImplCopyWithImpl(
    _$RankedPreflopRankImpl _value,
    $Res Function(_$RankedPreflopRankImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rank = null}) {
    return _then(
      _$RankedPreflopRankImpl(
        null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$RankedPreflopRankImpl implements RankedPreflopRank {
  const _$RankedPreflopRankImpl(this.rank);

  @override
  final int rank;

  @override
  String toString() {
    return 'PreflopRank.ranked(rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankedPreflopRankImpl &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rank);

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankedPreflopRankImplCopyWith<_$RankedPreflopRankImpl> get copyWith =>
      __$$RankedPreflopRankImplCopyWithImpl<_$RankedPreflopRankImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int rank) ranked,
    required TResult Function() fold,
  }) {
    return ranked(rank);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank)? ranked,
    TResult? Function()? fold,
  }) {
    return ranked?.call(rank);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank)? ranked,
    TResult Function()? fold,
    required TResult orElse(),
  }) {
    if (ranked != null) {
      return ranked(rank);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankedPreflopRank value) ranked,
    required TResult Function(FoldPreflopRank value) fold,
  }) {
    return ranked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankedPreflopRank value)? ranked,
    TResult? Function(FoldPreflopRank value)? fold,
  }) {
    return ranked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankedPreflopRank value)? ranked,
    TResult Function(FoldPreflopRank value)? fold,
    required TResult orElse(),
  }) {
    if (ranked != null) {
      return ranked(this);
    }
    return orElse();
  }
}

abstract class RankedPreflopRank implements PreflopRank {
  const factory RankedPreflopRank(final int rank) = _$RankedPreflopRankImpl;

  int get rank;

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankedPreflopRankImplCopyWith<_$RankedPreflopRankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FoldPreflopRankImplCopyWith<$Res> {
  factory _$$FoldPreflopRankImplCopyWith(
    _$FoldPreflopRankImpl value,
    $Res Function(_$FoldPreflopRankImpl) then,
  ) = __$$FoldPreflopRankImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FoldPreflopRankImplCopyWithImpl<$Res>
    extends _$PreflopRankCopyWithImpl<$Res, _$FoldPreflopRankImpl>
    implements _$$FoldPreflopRankImplCopyWith<$Res> {
  __$$FoldPreflopRankImplCopyWithImpl(
    _$FoldPreflopRankImpl _value,
    $Res Function(_$FoldPreflopRankImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FoldPreflopRankImpl implements FoldPreflopRank {
  const _$FoldPreflopRankImpl();

  @override
  String toString() {
    return 'PreflopRank.fold()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FoldPreflopRankImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int rank) ranked,
    required TResult Function() fold,
  }) {
    return fold();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank)? ranked,
    TResult? Function()? fold,
  }) {
    return fold?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank)? ranked,
    TResult Function()? fold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankedPreflopRank value) ranked,
    required TResult Function(FoldPreflopRank value) fold,
  }) {
    return fold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankedPreflopRank value)? ranked,
    TResult? Function(FoldPreflopRank value)? fold,
  }) {
    return fold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankedPreflopRank value)? ranked,
    TResult Function(FoldPreflopRank value)? fold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(this);
    }
    return orElse();
  }
}

abstract class FoldPreflopRank implements PreflopRank {
  const factory FoldPreflopRank() = _$FoldPreflopRankImpl;
}
