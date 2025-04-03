// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Hand {
  Card get card1 => throw _privateConstructorUsedError;
  Card get card2 => throw _privateConstructorUsedError;

  /// Create a copy of Hand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HandCopyWith<Hand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandCopyWith<$Res> {
  factory $HandCopyWith(Hand value, $Res Function(Hand) then) =
      _$HandCopyWithImpl<$Res, Hand>;
  @useResult
  $Res call({Card card1, Card card2});
}

/// @nodoc
class _$HandCopyWithImpl<$Res, $Val extends Hand>
    implements $HandCopyWith<$Res> {
  _$HandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? card1 = null, Object? card2 = null}) {
    return _then(
      _value.copyWith(
            card1:
                null == card1
                    ? _value.card1
                    : card1 // ignore: cast_nullable_to_non_nullable
                        as Card,
            card2:
                null == card2
                    ? _value.card2
                    : card2 // ignore: cast_nullable_to_non_nullable
                        as Card,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HandImplCopyWith<$Res> implements $HandCopyWith<$Res> {
  factory _$$HandImplCopyWith(
    _$HandImpl value,
    $Res Function(_$HandImpl) then,
  ) = __$$HandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Card card1, Card card2});
}

/// @nodoc
class __$$HandImplCopyWithImpl<$Res>
    extends _$HandCopyWithImpl<$Res, _$HandImpl>
    implements _$$HandImplCopyWith<$Res> {
  __$$HandImplCopyWithImpl(_$HandImpl _value, $Res Function(_$HandImpl) _then)
    : super(_value, _then);

  /// Create a copy of Hand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? card1 = null, Object? card2 = null}) {
    return _then(
      _$HandImpl(
        card1:
            null == card1
                ? _value.card1
                : card1 // ignore: cast_nullable_to_non_nullable
                    as Card,
        card2:
            null == card2
                ? _value.card2
                : card2 // ignore: cast_nullable_to_non_nullable
                    as Card,
      ),
    );
  }
}

/// @nodoc

class _$HandImpl extends _Hand {
  const _$HandImpl({required this.card1, required this.card2}) : super._();

  @override
  final Card card1;
  @override
  final Card card2;

  @override
  String toString() {
    return 'Hand(card1: $card1, card2: $card2)';
  }

  /// Create a copy of Hand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HandImplCopyWith<_$HandImpl> get copyWith =>
      __$$HandImplCopyWithImpl<_$HandImpl>(this, _$identity);
}

abstract class _Hand extends Hand {
  const factory _Hand({required final Card card1, required final Card card2}) =
      _$HandImpl;
  const _Hand._() : super._();

  @override
  Card get card1;
  @override
  Card get card2;

  /// Create a copy of Hand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HandImplCopyWith<_$HandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
