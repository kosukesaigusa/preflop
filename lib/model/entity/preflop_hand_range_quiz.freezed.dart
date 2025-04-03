// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflop_hand_range_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PreflopHandRangeQuiz {
  Hand get hand => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )
    answered,
    required TResult Function(Hand hand) unanswered,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult? Function(Hand hand)? unanswered,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult Function(Hand hand)? unanswered,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnsweredPreflopHandRangeQuiz value) answered,
    required TResult Function(UnansweredPreflopHandRangeQuiz value) unanswered,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult? Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreflopHandRangeQuizCopyWith<PreflopHandRangeQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflopHandRangeQuizCopyWith<$Res> {
  factory $PreflopHandRangeQuizCopyWith(
    PreflopHandRangeQuiz value,
    $Res Function(PreflopHandRangeQuiz) then,
  ) = _$PreflopHandRangeQuizCopyWithImpl<$Res, PreflopHandRangeQuiz>;
  @useResult
  $Res call({Hand hand});

  $HandCopyWith<$Res> get hand;
}

/// @nodoc
class _$PreflopHandRangeQuizCopyWithImpl<
  $Res,
  $Val extends PreflopHandRangeQuiz
>
    implements $PreflopHandRangeQuizCopyWith<$Res> {
  _$PreflopHandRangeQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hand = null}) {
    return _then(
      _value.copyWith(
            hand:
                null == hand
                    ? _value.hand
                    : hand // ignore: cast_nullable_to_non_nullable
                        as Hand,
          )
          as $Val,
    );
  }

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HandCopyWith<$Res> get hand {
    return $HandCopyWith<$Res>(_value.hand, (value) {
      return _then(_value.copyWith(hand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnsweredPreflopHandRangeQuizImplCopyWith<$Res>
    implements $PreflopHandRangeQuizCopyWith<$Res> {
  factory _$$AnsweredPreflopHandRangeQuizImplCopyWith(
    _$AnsweredPreflopHandRangeQuizImpl value,
    $Res Function(_$AnsweredPreflopHandRangeQuizImpl) then,
  ) = __$$AnsweredPreflopHandRangeQuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Hand hand, PreflopRank correctRank, PreflopRank answeredRank});

  @override
  $HandCopyWith<$Res> get hand;
  $PreflopRankCopyWith<$Res> get correctRank;
  $PreflopRankCopyWith<$Res> get answeredRank;
}

/// @nodoc
class __$$AnsweredPreflopHandRangeQuizImplCopyWithImpl<$Res>
    extends
        _$PreflopHandRangeQuizCopyWithImpl<
          $Res,
          _$AnsweredPreflopHandRangeQuizImpl
        >
    implements _$$AnsweredPreflopHandRangeQuizImplCopyWith<$Res> {
  __$$AnsweredPreflopHandRangeQuizImplCopyWithImpl(
    _$AnsweredPreflopHandRangeQuizImpl _value,
    $Res Function(_$AnsweredPreflopHandRangeQuizImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hand = null,
    Object? correctRank = null,
    Object? answeredRank = null,
  }) {
    return _then(
      _$AnsweredPreflopHandRangeQuizImpl(
        hand:
            null == hand
                ? _value.hand
                : hand // ignore: cast_nullable_to_non_nullable
                    as Hand,
        correctRank:
            null == correctRank
                ? _value.correctRank
                : correctRank // ignore: cast_nullable_to_non_nullable
                    as PreflopRank,
        answeredRank:
            null == answeredRank
                ? _value.answeredRank
                : answeredRank // ignore: cast_nullable_to_non_nullable
                    as PreflopRank,
      ),
    );
  }

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreflopRankCopyWith<$Res> get correctRank {
    return $PreflopRankCopyWith<$Res>(_value.correctRank, (value) {
      return _then(_value.copyWith(correctRank: value));
    });
  }

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreflopRankCopyWith<$Res> get answeredRank {
    return $PreflopRankCopyWith<$Res>(_value.answeredRank, (value) {
      return _then(_value.copyWith(answeredRank: value));
    });
  }
}

/// @nodoc

class _$AnsweredPreflopHandRangeQuizImpl extends AnsweredPreflopHandRangeQuiz {
  const _$AnsweredPreflopHandRangeQuizImpl({
    required this.hand,
    required this.correctRank,
    required this.answeredRank,
  }) : super._();

  @override
  final Hand hand;
  @override
  final PreflopRank correctRank;
  @override
  final PreflopRank answeredRank;

  @override
  String toString() {
    return 'PreflopHandRangeQuiz.answered(hand: $hand, correctRank: $correctRank, answeredRank: $answeredRank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredPreflopHandRangeQuizImpl &&
            (identical(other.hand, hand) || other.hand == hand) &&
            (identical(other.correctRank, correctRank) ||
                other.correctRank == correctRank) &&
            (identical(other.answeredRank, answeredRank) ||
                other.answeredRank == answeredRank));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hand, correctRank, answeredRank);

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredPreflopHandRangeQuizImplCopyWith<
    _$AnsweredPreflopHandRangeQuizImpl
  >
  get copyWith => __$$AnsweredPreflopHandRangeQuizImplCopyWithImpl<
    _$AnsweredPreflopHandRangeQuizImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )
    answered,
    required TResult Function(Hand hand) unanswered,
  }) {
    return answered(hand, correctRank, answeredRank);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult? Function(Hand hand)? unanswered,
  }) {
    return answered?.call(hand, correctRank, answeredRank);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult Function(Hand hand)? unanswered,
    required TResult orElse(),
  }) {
    if (answered != null) {
      return answered(hand, correctRank, answeredRank);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnsweredPreflopHandRangeQuiz value) answered,
    required TResult Function(UnansweredPreflopHandRangeQuiz value) unanswered,
  }) {
    return answered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult? Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
  }) {
    return answered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
    required TResult orElse(),
  }) {
    if (answered != null) {
      return answered(this);
    }
    return orElse();
  }
}

abstract class AnsweredPreflopHandRangeQuiz extends PreflopHandRangeQuiz {
  const factory AnsweredPreflopHandRangeQuiz({
    required final Hand hand,
    required final PreflopRank correctRank,
    required final PreflopRank answeredRank,
  }) = _$AnsweredPreflopHandRangeQuizImpl;
  const AnsweredPreflopHandRangeQuiz._() : super._();

  @override
  Hand get hand;
  PreflopRank get correctRank;
  PreflopRank get answeredRank;

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredPreflopHandRangeQuizImplCopyWith<
    _$AnsweredPreflopHandRangeQuizImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnansweredPreflopHandRangeQuizImplCopyWith<$Res>
    implements $PreflopHandRangeQuizCopyWith<$Res> {
  factory _$$UnansweredPreflopHandRangeQuizImplCopyWith(
    _$UnansweredPreflopHandRangeQuizImpl value,
    $Res Function(_$UnansweredPreflopHandRangeQuizImpl) then,
  ) = __$$UnansweredPreflopHandRangeQuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Hand hand});

  @override
  $HandCopyWith<$Res> get hand;
}

/// @nodoc
class __$$UnansweredPreflopHandRangeQuizImplCopyWithImpl<$Res>
    extends
        _$PreflopHandRangeQuizCopyWithImpl<
          $Res,
          _$UnansweredPreflopHandRangeQuizImpl
        >
    implements _$$UnansweredPreflopHandRangeQuizImplCopyWith<$Res> {
  __$$UnansweredPreflopHandRangeQuizImplCopyWithImpl(
    _$UnansweredPreflopHandRangeQuizImpl _value,
    $Res Function(_$UnansweredPreflopHandRangeQuizImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hand = null}) {
    return _then(
      _$UnansweredPreflopHandRangeQuizImpl(
        hand:
            null == hand
                ? _value.hand
                : hand // ignore: cast_nullable_to_non_nullable
                    as Hand,
      ),
    );
  }
}

/// @nodoc

class _$UnansweredPreflopHandRangeQuizImpl
    extends UnansweredPreflopHandRangeQuiz {
  const _$UnansweredPreflopHandRangeQuizImpl({required this.hand}) : super._();

  @override
  final Hand hand;

  @override
  String toString() {
    return 'PreflopHandRangeQuiz.unanswered(hand: $hand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnansweredPreflopHandRangeQuizImpl &&
            (identical(other.hand, hand) || other.hand == hand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hand);

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnansweredPreflopHandRangeQuizImplCopyWith<
    _$UnansweredPreflopHandRangeQuizImpl
  >
  get copyWith => __$$UnansweredPreflopHandRangeQuizImplCopyWithImpl<
    _$UnansweredPreflopHandRangeQuizImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )
    answered,
    required TResult Function(Hand hand) unanswered,
  }) {
    return unanswered(hand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult? Function(Hand hand)? unanswered,
  }) {
    return unanswered?.call(hand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Hand hand,
      PreflopRank correctRank,
      PreflopRank answeredRank,
    )?
    answered,
    TResult Function(Hand hand)? unanswered,
    required TResult orElse(),
  }) {
    if (unanswered != null) {
      return unanswered(hand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnsweredPreflopHandRangeQuiz value) answered,
    required TResult Function(UnansweredPreflopHandRangeQuiz value) unanswered,
  }) {
    return unanswered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult? Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
  }) {
    return unanswered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnsweredPreflopHandRangeQuiz value)? answered,
    TResult Function(UnansweredPreflopHandRangeQuiz value)? unanswered,
    required TResult orElse(),
  }) {
    if (unanswered != null) {
      return unanswered(this);
    }
    return orElse();
  }
}

abstract class UnansweredPreflopHandRangeQuiz extends PreflopHandRangeQuiz {
  const factory UnansweredPreflopHandRangeQuiz({required final Hand hand}) =
      _$UnansweredPreflopHandRangeQuizImpl;
  const UnansweredPreflopHandRangeQuiz._() : super._();

  @override
  Hand get hand;

  /// Create a copy of PreflopHandRangeQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnansweredPreflopHandRangeQuizImplCopyWith<
    _$UnansweredPreflopHandRangeQuizImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
