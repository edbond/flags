// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizState {
  SettingsCubit get settingsCubit => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsCubit settingsCubit) initial,
    required TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SettingsCubit settingsCubit)? initial,
    TResult? Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsCubit settingsCubit)? initial,
    TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
  @useResult
  $Res call({SettingsCubit settingsCubit});
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsCubit = null,
  }) {
    return _then(_value.copyWith(
      settingsCubit: null == settingsCubit
          ? _value.settingsCubit
          : settingsCubit // ignore: cast_nullable_to_non_nullable
              as SettingsCubit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SettingsCubit settingsCubit});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsCubit = null,
  }) {
    return _then(_$_Initial(
      settingsCubit: null == settingsCubit
          ? _value.settingsCubit
          : settingsCubit // ignore: cast_nullable_to_non_nullable
              as SettingsCubit,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.settingsCubit});

  @override
  final SettingsCubit settingsCubit;

  @override
  String toString() {
    return 'QuizState.initial(settingsCubit: $settingsCubit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.settingsCubit, settingsCubit) ||
                other.settingsCubit == settingsCubit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settingsCubit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsCubit settingsCubit) initial,
    required TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)
        running,
  }) {
    return initial(settingsCubit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SettingsCubit settingsCubit)? initial,
    TResult? Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
  }) {
    return initial?.call(settingsCubit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsCubit settingsCubit)? initial,
    TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(settingsCubit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QuizState {
  const factory _Initial({required final SettingsCubit settingsCubit}) =
      _$_Initial;

  @override
  SettingsCubit get settingsCubit;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SettingsCubit settingsCubit,
      DateTime timeLimit,
      DateTime startedAt,
      Duration timeLeft,
      Country? country,
      List<Country>? variants,
      Timer? timer,
      bool timeout});

  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$_Running>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsCubit = null,
    Object? timeLimit = null,
    Object? startedAt = null,
    Object? timeLeft = null,
    Object? country = freezed,
    Object? variants = freezed,
    Object? timer = freezed,
    Object? timeout = null,
  }) {
    return _then(_$_Running(
      settingsCubit: null == settingsCubit
          ? _value.settingsCubit
          : settingsCubit // ignore: cast_nullable_to_non_nullable
              as SettingsCubit,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Country>?,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value));
    });
  }
}

/// @nodoc

class _$_Running implements _Running {
  const _$_Running(
      {required this.settingsCubit,
      required this.timeLimit,
      required this.startedAt,
      required this.timeLeft,
      this.country,
      final List<Country>? variants,
      this.timer,
      this.timeout = false})
      : _variants = variants;

  @override
  final SettingsCubit settingsCubit;
  @override
  final DateTime timeLimit;
  @override
  final DateTime startedAt;
  @override
  final Duration timeLeft;
  @override
  final Country? country;
  final List<Country>? _variants;
  @override
  List<Country>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Timer? timer;
  @override
  @JsonKey()
  final bool timeout;

  @override
  String toString() {
    return 'QuizState.running(settingsCubit: $settingsCubit, timeLimit: $timeLimit, startedAt: $startedAt, timeLeft: $timeLeft, country: $country, variants: $variants, timer: $timer, timeout: $timeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Running &&
            (identical(other.settingsCubit, settingsCubit) ||
                other.settingsCubit == settingsCubit) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settingsCubit,
      timeLimit,
      startedAt,
      timeLeft,
      country,
      const DeepCollectionEquality().hash(_variants),
      timer,
      timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      __$$_RunningCopyWithImpl<_$_Running>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsCubit settingsCubit) initial,
    required TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)
        running,
  }) {
    return running(settingsCubit, timeLimit, startedAt, timeLeft, country,
        variants, timer, timeout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SettingsCubit settingsCubit)? initial,
    TResult? Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
  }) {
    return running?.call(settingsCubit, timeLimit, startedAt, timeLeft, country,
        variants, timer, timeout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsCubit settingsCubit)? initial,
    TResult Function(
            SettingsCubit settingsCubit,
            DateTime timeLimit,
            DateTime startedAt,
            Duration timeLeft,
            Country? country,
            List<Country>? variants,
            Timer? timer,
            bool timeout)?
        running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(settingsCubit, timeLimit, startedAt, timeLeft, country,
          variants, timer, timeout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running implements QuizState {
  const factory _Running(
      {required final SettingsCubit settingsCubit,
      required final DateTime timeLimit,
      required final DateTime startedAt,
      required final Duration timeLeft,
      final Country? country,
      final List<Country>? variants,
      final Timer? timer,
      final bool timeout}) = _$_Running;

  @override
  SettingsCubit get settingsCubit;
  DateTime get timeLimit;
  DateTime get startedAt;
  Duration get timeLeft;
  Country? get country;
  List<Country>? get variants;
  Timer? get timer;
  bool get timeout;
  @override
  @JsonKey(ignore: true)
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      throw _privateConstructorUsedError;
}
