// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'power_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PowerNumberHandMatrix {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<PreflopHand, HandPowerNumber> get powerNumbers =>
      throw _privateConstructorUsedError;

  /// Create a copy of PowerNumberHandMatrix
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PowerNumberHandMatrixCopyWith<PowerNumberHandMatrix> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerNumberHandMatrixCopyWith<$Res> {
  factory $PowerNumberHandMatrixCopyWith(
    PowerNumberHandMatrix value,
    $Res Function(PowerNumberHandMatrix) then,
  ) = _$PowerNumberHandMatrixCopyWithImpl<$Res, PowerNumberHandMatrix>;
  @useResult
  $Res call({
    String id,
    String name,
    Map<PreflopHand, HandPowerNumber> powerNumbers,
  });
}

/// @nodoc
class _$PowerNumberHandMatrixCopyWithImpl<
  $Res,
  $Val extends PowerNumberHandMatrix
>
    implements $PowerNumberHandMatrixCopyWith<$Res> {
  _$PowerNumberHandMatrixCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PowerNumberHandMatrix
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? powerNumbers = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            powerNumbers:
                null == powerNumbers
                    ? _value.powerNumbers
                    : powerNumbers // ignore: cast_nullable_to_non_nullable
                        as Map<PreflopHand, HandPowerNumber>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PowerNumberHandMatrixImplCopyWith<$Res>
    implements $PowerNumberHandMatrixCopyWith<$Res> {
  factory _$$PowerNumberHandMatrixImplCopyWith(
    _$PowerNumberHandMatrixImpl value,
    $Res Function(_$PowerNumberHandMatrixImpl) then,
  ) = __$$PowerNumberHandMatrixImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    Map<PreflopHand, HandPowerNumber> powerNumbers,
  });
}

/// @nodoc
class __$$PowerNumberHandMatrixImplCopyWithImpl<$Res>
    extends
        _$PowerNumberHandMatrixCopyWithImpl<$Res, _$PowerNumberHandMatrixImpl>
    implements _$$PowerNumberHandMatrixImplCopyWith<$Res> {
  __$$PowerNumberHandMatrixImplCopyWithImpl(
    _$PowerNumberHandMatrixImpl _value,
    $Res Function(_$PowerNumberHandMatrixImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PowerNumberHandMatrix
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? powerNumbers = null,
  }) {
    return _then(
      _$PowerNumberHandMatrixImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        powerNumbers:
            null == powerNumbers
                ? _value._powerNumbers
                : powerNumbers // ignore: cast_nullable_to_non_nullable
                    as Map<PreflopHand, HandPowerNumber>,
      ),
    );
  }
}

/// @nodoc

class _$PowerNumberHandMatrixImpl extends _PowerNumberHandMatrix {
  const _$PowerNumberHandMatrixImpl({
    required this.id,
    required this.name,
    required final Map<PreflopHand, HandPowerNumber> powerNumbers,
  }) : _powerNumbers = powerNumbers,
       super._();

  @override
  final String id;
  @override
  final String name;
  final Map<PreflopHand, HandPowerNumber> _powerNumbers;
  @override
  Map<PreflopHand, HandPowerNumber> get powerNumbers {
    if (_powerNumbers is EqualUnmodifiableMapView) return _powerNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_powerNumbers);
  }

  @override
  String toString() {
    return 'PowerNumberHandMatrix(id: $id, name: $name, powerNumbers: $powerNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerNumberHandMatrixImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._powerNumbers,
              _powerNumbers,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_powerNumbers),
  );

  /// Create a copy of PowerNumberHandMatrix
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerNumberHandMatrixImplCopyWith<_$PowerNumberHandMatrixImpl>
  get copyWith =>
      __$$PowerNumberHandMatrixImplCopyWithImpl<_$PowerNumberHandMatrixImpl>(
        this,
        _$identity,
      );
}

abstract class _PowerNumberHandMatrix extends PowerNumberHandMatrix {
  const factory _PowerNumberHandMatrix({
    required final String id,
    required final String name,
    required final Map<PreflopHand, HandPowerNumber> powerNumbers,
  }) = _$PowerNumberHandMatrixImpl;
  const _PowerNumberHandMatrix._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  Map<PreflopHand, HandPowerNumber> get powerNumbers;

  /// Create a copy of PowerNumberHandMatrix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerNumberHandMatrixImplCopyWith<_$PowerNumberHandMatrixImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HandPowerNumber {
  PreflopHand get preflopHand => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PreflopHand preflopHand) alwaysAllIn,
    required TResult Function(PreflopHand preflopHand, int powerNumber)
    selectable,
    required TResult Function(PreflopHand preflopHand) fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult? Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult? Function(PreflopHand preflopHand)? fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult Function(PreflopHand preflopHand)? fold,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlwaysAllInHandPowerNumber value) alwaysAllIn,
    required TResult Function(SelectableHandPowerNumber value) selectable,
    required TResult Function(FoldHandPowerNumber value) fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult? Function(SelectableHandPowerNumber value)? selectable,
    TResult? Function(FoldHandPowerNumber value)? fold,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult Function(SelectableHandPowerNumber value)? selectable,
    TResult Function(FoldHandPowerNumber value)? fold,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HandPowerNumberCopyWith<HandPowerNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandPowerNumberCopyWith<$Res> {
  factory $HandPowerNumberCopyWith(
    HandPowerNumber value,
    $Res Function(HandPowerNumber) then,
  ) = _$HandPowerNumberCopyWithImpl<$Res, HandPowerNumber>;
  @useResult
  $Res call({PreflopHand preflopHand});
}

/// @nodoc
class _$HandPowerNumberCopyWithImpl<$Res, $Val extends HandPowerNumber>
    implements $HandPowerNumberCopyWith<$Res> {
  _$HandPowerNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preflopHand = null}) {
    return _then(
      _value.copyWith(
            preflopHand:
                null == preflopHand
                    ? _value.preflopHand
                    : preflopHand // ignore: cast_nullable_to_non_nullable
                        as PreflopHand,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlwaysAllInHandPowerNumberImplCopyWith<$Res>
    implements $HandPowerNumberCopyWith<$Res> {
  factory _$$AlwaysAllInHandPowerNumberImplCopyWith(
    _$AlwaysAllInHandPowerNumberImpl value,
    $Res Function(_$AlwaysAllInHandPowerNumberImpl) then,
  ) = __$$AlwaysAllInHandPowerNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PreflopHand preflopHand});
}

/// @nodoc
class __$$AlwaysAllInHandPowerNumberImplCopyWithImpl<$Res>
    extends
        _$HandPowerNumberCopyWithImpl<$Res, _$AlwaysAllInHandPowerNumberImpl>
    implements _$$AlwaysAllInHandPowerNumberImplCopyWith<$Res> {
  __$$AlwaysAllInHandPowerNumberImplCopyWithImpl(
    _$AlwaysAllInHandPowerNumberImpl _value,
    $Res Function(_$AlwaysAllInHandPowerNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preflopHand = null}) {
    return _then(
      _$AlwaysAllInHandPowerNumberImpl(
        null == preflopHand
            ? _value.preflopHand
            : preflopHand // ignore: cast_nullable_to_non_nullable
                as PreflopHand,
      ),
    );
  }
}

/// @nodoc

class _$AlwaysAllInHandPowerNumberImpl implements AlwaysAllInHandPowerNumber {
  const _$AlwaysAllInHandPowerNumberImpl(this.preflopHand);

  @override
  final PreflopHand preflopHand;

  @override
  String toString() {
    return 'HandPowerNumber.alwaysAllIn(preflopHand: $preflopHand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlwaysAllInHandPowerNumberImpl &&
            (identical(other.preflopHand, preflopHand) ||
                other.preflopHand == preflopHand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preflopHand);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlwaysAllInHandPowerNumberImplCopyWith<_$AlwaysAllInHandPowerNumberImpl>
  get copyWith => __$$AlwaysAllInHandPowerNumberImplCopyWithImpl<
    _$AlwaysAllInHandPowerNumberImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PreflopHand preflopHand) alwaysAllIn,
    required TResult Function(PreflopHand preflopHand, int powerNumber)
    selectable,
    required TResult Function(PreflopHand preflopHand) fold,
  }) {
    return alwaysAllIn(preflopHand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult? Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult? Function(PreflopHand preflopHand)? fold,
  }) {
    return alwaysAllIn?.call(preflopHand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult Function(PreflopHand preflopHand)? fold,
    required TResult orElse(),
  }) {
    if (alwaysAllIn != null) {
      return alwaysAllIn(preflopHand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlwaysAllInHandPowerNumber value) alwaysAllIn,
    required TResult Function(SelectableHandPowerNumber value) selectable,
    required TResult Function(FoldHandPowerNumber value) fold,
  }) {
    return alwaysAllIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult? Function(SelectableHandPowerNumber value)? selectable,
    TResult? Function(FoldHandPowerNumber value)? fold,
  }) {
    return alwaysAllIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult Function(SelectableHandPowerNumber value)? selectable,
    TResult Function(FoldHandPowerNumber value)? fold,
    required TResult orElse(),
  }) {
    if (alwaysAllIn != null) {
      return alwaysAllIn(this);
    }
    return orElse();
  }
}

abstract class AlwaysAllInHandPowerNumber implements HandPowerNumber {
  const factory AlwaysAllInHandPowerNumber(final PreflopHand preflopHand) =
      _$AlwaysAllInHandPowerNumberImpl;

  @override
  PreflopHand get preflopHand;

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlwaysAllInHandPowerNumberImplCopyWith<_$AlwaysAllInHandPowerNumberImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectableHandPowerNumberImplCopyWith<$Res>
    implements $HandPowerNumberCopyWith<$Res> {
  factory _$$SelectableHandPowerNumberImplCopyWith(
    _$SelectableHandPowerNumberImpl value,
    $Res Function(_$SelectableHandPowerNumberImpl) then,
  ) = __$$SelectableHandPowerNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PreflopHand preflopHand, int powerNumber});
}

/// @nodoc
class __$$SelectableHandPowerNumberImplCopyWithImpl<$Res>
    extends _$HandPowerNumberCopyWithImpl<$Res, _$SelectableHandPowerNumberImpl>
    implements _$$SelectableHandPowerNumberImplCopyWith<$Res> {
  __$$SelectableHandPowerNumberImplCopyWithImpl(
    _$SelectableHandPowerNumberImpl _value,
    $Res Function(_$SelectableHandPowerNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preflopHand = null, Object? powerNumber = null}) {
    return _then(
      _$SelectableHandPowerNumberImpl(
        preflopHand:
            null == preflopHand
                ? _value.preflopHand
                : preflopHand // ignore: cast_nullable_to_non_nullable
                    as PreflopHand,
        powerNumber:
            null == powerNumber
                ? _value.powerNumber
                : powerNumber // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$SelectableHandPowerNumberImpl implements SelectableHandPowerNumber {
  const _$SelectableHandPowerNumberImpl({
    required this.preflopHand,
    required this.powerNumber,
  });

  @override
  final PreflopHand preflopHand;
  @override
  final int powerNumber;

  @override
  String toString() {
    return 'HandPowerNumber.selectable(preflopHand: $preflopHand, powerNumber: $powerNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectableHandPowerNumberImpl &&
            (identical(other.preflopHand, preflopHand) ||
                other.preflopHand == preflopHand) &&
            (identical(other.powerNumber, powerNumber) ||
                other.powerNumber == powerNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preflopHand, powerNumber);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectableHandPowerNumberImplCopyWith<_$SelectableHandPowerNumberImpl>
  get copyWith => __$$SelectableHandPowerNumberImplCopyWithImpl<
    _$SelectableHandPowerNumberImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PreflopHand preflopHand) alwaysAllIn,
    required TResult Function(PreflopHand preflopHand, int powerNumber)
    selectable,
    required TResult Function(PreflopHand preflopHand) fold,
  }) {
    return selectable(preflopHand, powerNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult? Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult? Function(PreflopHand preflopHand)? fold,
  }) {
    return selectable?.call(preflopHand, powerNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult Function(PreflopHand preflopHand)? fold,
    required TResult orElse(),
  }) {
    if (selectable != null) {
      return selectable(preflopHand, powerNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlwaysAllInHandPowerNumber value) alwaysAllIn,
    required TResult Function(SelectableHandPowerNumber value) selectable,
    required TResult Function(FoldHandPowerNumber value) fold,
  }) {
    return selectable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult? Function(SelectableHandPowerNumber value)? selectable,
    TResult? Function(FoldHandPowerNumber value)? fold,
  }) {
    return selectable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult Function(SelectableHandPowerNumber value)? selectable,
    TResult Function(FoldHandPowerNumber value)? fold,
    required TResult orElse(),
  }) {
    if (selectable != null) {
      return selectable(this);
    }
    return orElse();
  }
}

abstract class SelectableHandPowerNumber implements HandPowerNumber {
  const factory SelectableHandPowerNumber({
    required final PreflopHand preflopHand,
    required final int powerNumber,
  }) = _$SelectableHandPowerNumberImpl;

  @override
  PreflopHand get preflopHand;
  int get powerNumber;

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectableHandPowerNumberImplCopyWith<_$SelectableHandPowerNumberImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FoldHandPowerNumberImplCopyWith<$Res>
    implements $HandPowerNumberCopyWith<$Res> {
  factory _$$FoldHandPowerNumberImplCopyWith(
    _$FoldHandPowerNumberImpl value,
    $Res Function(_$FoldHandPowerNumberImpl) then,
  ) = __$$FoldHandPowerNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PreflopHand preflopHand});
}

/// @nodoc
class __$$FoldHandPowerNumberImplCopyWithImpl<$Res>
    extends _$HandPowerNumberCopyWithImpl<$Res, _$FoldHandPowerNumberImpl>
    implements _$$FoldHandPowerNumberImplCopyWith<$Res> {
  __$$FoldHandPowerNumberImplCopyWithImpl(
    _$FoldHandPowerNumberImpl _value,
    $Res Function(_$FoldHandPowerNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preflopHand = null}) {
    return _then(
      _$FoldHandPowerNumberImpl(
        null == preflopHand
            ? _value.preflopHand
            : preflopHand // ignore: cast_nullable_to_non_nullable
                as PreflopHand,
      ),
    );
  }
}

/// @nodoc

class _$FoldHandPowerNumberImpl implements FoldHandPowerNumber {
  const _$FoldHandPowerNumberImpl(this.preflopHand);

  @override
  final PreflopHand preflopHand;

  @override
  String toString() {
    return 'HandPowerNumber.fold(preflopHand: $preflopHand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoldHandPowerNumberImpl &&
            (identical(other.preflopHand, preflopHand) ||
                other.preflopHand == preflopHand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preflopHand);

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoldHandPowerNumberImplCopyWith<_$FoldHandPowerNumberImpl> get copyWith =>
      __$$FoldHandPowerNumberImplCopyWithImpl<_$FoldHandPowerNumberImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PreflopHand preflopHand) alwaysAllIn,
    required TResult Function(PreflopHand preflopHand, int powerNumber)
    selectable,
    required TResult Function(PreflopHand preflopHand) fold,
  }) {
    return fold(preflopHand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult? Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult? Function(PreflopHand preflopHand)? fold,
  }) {
    return fold?.call(preflopHand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PreflopHand preflopHand)? alwaysAllIn,
    TResult Function(PreflopHand preflopHand, int powerNumber)? selectable,
    TResult Function(PreflopHand preflopHand)? fold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(preflopHand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlwaysAllInHandPowerNumber value) alwaysAllIn,
    required TResult Function(SelectableHandPowerNumber value) selectable,
    required TResult Function(FoldHandPowerNumber value) fold,
  }) {
    return fold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult? Function(SelectableHandPowerNumber value)? selectable,
    TResult? Function(FoldHandPowerNumber value)? fold,
  }) {
    return fold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlwaysAllInHandPowerNumber value)? alwaysAllIn,
    TResult Function(SelectableHandPowerNumber value)? selectable,
    TResult Function(FoldHandPowerNumber value)? fold,
    required TResult orElse(),
  }) {
    if (fold != null) {
      return fold(this);
    }
    return orElse();
  }
}

abstract class FoldHandPowerNumber implements HandPowerNumber {
  const factory FoldHandPowerNumber(final PreflopHand preflopHand) =
      _$FoldHandPowerNumberImpl;

  @override
  PreflopHand get preflopHand;

  /// Create a copy of HandPowerNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoldHandPowerNumberImplCopyWith<_$FoldHandPowerNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
