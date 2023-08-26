// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  dynamic get attempts => throw _privateConstructorUsedError;
  dynamic get timeLimitSeconds => throw _privateConstructorUsedError;
  List<Country> get countries => throw _privateConstructorUsedError;
  List<Country> get homepageFlags => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  int get currentFlagIdx => throw _privateConstructorUsedError;
  Difficulty get difficulty => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {dynamic attempts,
      dynamic timeLimitSeconds,
      List<Country> countries,
      List<Country> homepageFlags,
      Timer? timer,
      int currentFlagIdx,
      Difficulty difficulty});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempts = freezed,
    Object? timeLimitSeconds = freezed,
    Object? countries = null,
    Object? homepageFlags = null,
    Object? timer = freezed,
    Object? currentFlagIdx = null,
    Object? difficulty = null,
  }) {
    return _then(_value.copyWith(
      attempts: freezed == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds
          : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as dynamic,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      homepageFlags: null == homepageFlags
          ? _value.homepageFlags
          : homepageFlags // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      currentFlagIdx: null == currentFlagIdx
          ? _value.currentFlagIdx
          : currentFlagIdx // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic attempts,
      dynamic timeLimitSeconds,
      List<Country> countries,
      List<Country> homepageFlags,
      Timer? timer,
      int currentFlagIdx,
      Difficulty difficulty});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempts = freezed,
    Object? timeLimitSeconds = freezed,
    Object? countries = null,
    Object? homepageFlags = null,
    Object? timer = freezed,
    Object? currentFlagIdx = null,
    Object? difficulty = null,
  }) {
    return _then(_$_Initial(
      attempts: freezed == attempts ? _value.attempts! : attempts,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds!
          : timeLimitSeconds,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      homepageFlags: null == homepageFlags
          ? _value._homepageFlags
          : homepageFlags // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      currentFlagIdx: null == currentFlagIdx
          ? _value.currentFlagIdx
          : currentFlagIdx // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.attempts = 2,
      this.timeLimitSeconds = 30,
      final List<Country> countries = const [],
      final List<Country> homepageFlags = const [],
      this.timer,
      this.currentFlagIdx = 0,
      this.difficulty = Difficulty.normal})
      : _countries = countries,
        _homepageFlags = homepageFlags;

  @override
  @JsonKey()
  final dynamic attempts;
  @override
  @JsonKey()
  final dynamic timeLimitSeconds;
  final List<Country> _countries;
  @override
  @JsonKey()
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<Country> _homepageFlags;
  @override
  @JsonKey()
  List<Country> get homepageFlags {
    if (_homepageFlags is EqualUnmodifiableListView) return _homepageFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homepageFlags);
  }

  @override
  final Timer? timer;
  @override
  @JsonKey()
  final int currentFlagIdx;
  @override
  @JsonKey()
  final Difficulty difficulty;

  @override
  String toString() {
    return 'SettingsState.initial(attempts: $attempts, timeLimitSeconds: $timeLimitSeconds, countries: $countries, homepageFlags: $homepageFlags, timer: $timer, currentFlagIdx: $currentFlagIdx, difficulty: $difficulty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.attempts, attempts) &&
            const DeepCollectionEquality()
                .equals(other.timeLimitSeconds, timeLimitSeconds) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality()
                .equals(other._homepageFlags, _homepageFlags) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.currentFlagIdx, currentFlagIdx) ||
                other.currentFlagIdx == currentFlagIdx) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attempts),
      const DeepCollectionEquality().hash(timeLimitSeconds),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_homepageFlags),
      timer,
      currentFlagIdx,
      difficulty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)
        initial,
  }) {
    return initial(attempts, timeLimitSeconds, countries, homepageFlags, timer,
        currentFlagIdx, difficulty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)?
        initial,
  }) {
    return initial?.call(attempts, timeLimitSeconds, countries, homepageFlags,
        timer, currentFlagIdx, difficulty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            dynamic attempts,
            dynamic timeLimitSeconds,
            List<Country> countries,
            List<Country> homepageFlags,
            Timer? timer,
            int currentFlagIdx,
            Difficulty difficulty)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(attempts, timeLimitSeconds, countries, homepageFlags,
          timer, currentFlagIdx, difficulty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
  const factory _Initial(
      {final dynamic attempts,
      final dynamic timeLimitSeconds,
      final List<Country> countries,
      final List<Country> homepageFlags,
      final Timer? timer,
      final int currentFlagIdx,
      final Difficulty difficulty}) = _$_Initial;

  @override
  dynamic get attempts;
  @override
  dynamic get timeLimitSeconds;
  @override
  List<Country> get countries;
  @override
  List<Country> get homepageFlags;
  @override
  Timer? get timer;
  @override
  int get currentFlagIdx;
  @override
  Difficulty get difficulty;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
