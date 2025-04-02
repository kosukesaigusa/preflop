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
  String get name => throw _privateConstructorUsedError;
  List<PreflopRank> get preflopRanks => throw _privateConstructorUsedError;
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
  $Res call({
    String name,
    List<PreflopRank> preflopRanks,
    Map<PreflopHand, PreflopRank> rangeData,
  });
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
  $Res call({
    Object? name = null,
    Object? preflopRanks = null,
    Object? rangeData = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            preflopRanks:
                null == preflopRanks
                    ? _value.preflopRanks
                    : preflopRanks // ignore: cast_nullable_to_non_nullable
                        as List<PreflopRank>,
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
  $Res call({
    String name,
    List<PreflopRank> preflopRanks,
    Map<PreflopHand, PreflopRank> rangeData,
  });
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
  $Res call({
    Object? name = null,
    Object? preflopRanks = null,
    Object? rangeData = null,
  }) {
    return _then(
      _$PreflopHandRangeImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        preflopRanks:
            null == preflopRanks
                ? _value._preflopRanks
                : preflopRanks // ignore: cast_nullable_to_non_nullable
                    as List<PreflopRank>,
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
    required this.name,
    required final List<PreflopRank> preflopRanks,
    required final Map<PreflopHand, PreflopRank> rangeData,
  }) : _preflopRanks = preflopRanks,
       _rangeData = rangeData,
       super._();

  @override
  final String name;
  final List<PreflopRank> _preflopRanks;
  @override
  List<PreflopRank> get preflopRanks {
    if (_preflopRanks is EqualUnmodifiableListView) return _preflopRanks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preflopRanks);
  }

  final Map<PreflopHand, PreflopRank> _rangeData;
  @override
  Map<PreflopHand, PreflopRank> get rangeData {
    if (_rangeData is EqualUnmodifiableMapView) return _rangeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rangeData);
  }

  @override
  String toString() {
    return 'PreflopHandRangeMatrix(name: $name, preflopRanks: $preflopRanks, rangeData: $rangeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreflopHandRangeImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._preflopRanks,
              _preflopRanks,
            ) &&
            const DeepCollectionEquality().equals(
              other._rangeData,
              _rangeData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    const DeepCollectionEquality().hash(_preflopRanks),
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
    required final String name,
    required final List<PreflopRank> preflopRanks,
    required final Map<PreflopHand, PreflopRank> rangeData,
  }) = _$PreflopHandRangeImpl;
  const _PreflopHandRange._() : super._();

  @override
  String get name;
  @override
  List<PreflopRank> get preflopRanks;
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
  String get description => throw _privateConstructorUsedError;
  String get colorCode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int rank, String description, String colorCode)
    ranked,
    required TResult Function(String description, String colorCode) fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank, String description, String colorCode)? ranked,
    TResult? Function(String description, String colorCode)? fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank, String description, String colorCode)? ranked,
    TResult Function(String description, String colorCode)? fold,
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

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreflopRankCopyWith<PreflopRank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflopRankCopyWith<$Res> {
  factory $PreflopRankCopyWith(
    PreflopRank value,
    $Res Function(PreflopRank) then,
  ) = _$PreflopRankCopyWithImpl<$Res, PreflopRank>;
  @useResult
  $Res call({String description, String colorCode});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null, Object? colorCode = null}) {
    return _then(
      _value.copyWith(
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            colorCode:
                null == colorCode
                    ? _value.colorCode
                    : colorCode // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RankedPreflopRankImplCopyWith<$Res>
    implements $PreflopRankCopyWith<$Res> {
  factory _$$RankedPreflopRankImplCopyWith(
    _$RankedPreflopRankImpl value,
    $Res Function(_$RankedPreflopRankImpl) then,
  ) = __$$RankedPreflopRankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rank, String description, String colorCode});
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
  $Res call({
    Object? rank = null,
    Object? description = null,
    Object? colorCode = null,
  }) {
    return _then(
      _$RankedPreflopRankImpl(
        rank:
            null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                    as int,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        colorCode:
            null == colorCode
                ? _value.colorCode
                : colorCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RankedPreflopRankImpl extends RankedPreflopRank {
  const _$RankedPreflopRankImpl({
    required this.rank,
    required this.description,
    required this.colorCode,
  }) : super._();

  @override
  final int rank;
  @override
  final String description;
  @override
  final String colorCode;

  @override
  String toString() {
    return 'PreflopRank.ranked(rank: $rank, description: $description, colorCode: $colorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankedPreflopRankImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rank, description, colorCode);

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
    required TResult Function(int rank, String description, String colorCode)
    ranked,
    required TResult Function(String description, String colorCode) fold,
  }) {
    return ranked(rank, description, colorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank, String description, String colorCode)? ranked,
    TResult? Function(String description, String colorCode)? fold,
  }) {
    return ranked?.call(rank, description, colorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank, String description, String colorCode)? ranked,
    TResult Function(String description, String colorCode)? fold,
    required TResult orElse(),
  }) {
    if (ranked != null) {
      return ranked(rank, description, colorCode);
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

abstract class RankedPreflopRank extends PreflopRank {
  const factory RankedPreflopRank({
    required final int rank,
    required final String description,
    required final String colorCode,
  }) = _$RankedPreflopRankImpl;
  const RankedPreflopRank._() : super._();

  int get rank;
  @override
  String get description;
  @override
  String get colorCode;

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankedPreflopRankImplCopyWith<_$RankedPreflopRankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FoldPreflopRankImplCopyWith<$Res>
    implements $PreflopRankCopyWith<$Res> {
  factory _$$FoldPreflopRankImplCopyWith(
    _$FoldPreflopRankImpl value,
    $Res Function(_$FoldPreflopRankImpl) then,
  ) = __$$FoldPreflopRankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String colorCode});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null, Object? colorCode = null}) {
    return _then(
      _$FoldPreflopRankImpl(
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        colorCode:
            null == colorCode
                ? _value.colorCode
                : colorCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$FoldPreflopRankImpl extends FoldPreflopRank {
  const _$FoldPreflopRankImpl({
    required this.description,
    required this.colorCode,
  }) : super._();

  @override
  final String description;
  @override
  final String colorCode;

  @override
  String toString() {
    return 'PreflopRank.fold(description: $description, colorCode: $colorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoldPreflopRankImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, colorCode);

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoldPreflopRankImplCopyWith<_$FoldPreflopRankImpl> get copyWith =>
      __$$FoldPreflopRankImplCopyWithImpl<_$FoldPreflopRankImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int rank, String description, String colorCode)
    ranked,
    required TResult Function(String description, String colorCode) fold,
  }) {
    return fold(description, colorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int rank, String description, String colorCode)? ranked,
    TResult? Function(String description, String colorCode)? fold,
  }) {
    return fold?.call(description, colorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int rank, String description, String colorCode)? ranked,
    TResult Function(String description, String colorCode)? fold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(description, colorCode);
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

abstract class FoldPreflopRank extends PreflopRank {
  const factory FoldPreflopRank({
    required final String description,
    required final String colorCode,
  }) = _$FoldPreflopRankImpl;
  const FoldPreflopRank._() : super._();

  @override
  String get description;
  @override
  String get colorCode;

  /// Create a copy of PreflopRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoldPreflopRankImplCopyWith<_$FoldPreflopRankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
