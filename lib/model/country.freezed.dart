// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Country {
  @JsonKey(includeIfNull: false, required: false)
  String? get capital => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, required: false)
  String? get continent => throw _privateConstructorUsedError;
  @JsonKey(name: "flag_1x1")
  String get flag1x1 => throw _privateConstructorUsedError;
  @JsonKey(name: "flag_4x3")
  String get flag4x3 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get iso => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, required: false) String? capital,
      String code,
      @JsonKey(includeIfNull: false, required: false) String? continent,
      @JsonKey(name: "flag_1x1") String flag1x1,
      @JsonKey(name: "flag_4x3") String flag4x3,
      String name,
      bool iso});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capital = freezed,
    Object? code = null,
    Object? continent = freezed,
    Object? flag1x1 = null,
    Object? flag4x3 = null,
    Object? name = null,
    Object? iso = null,
  }) {
    return _then(_value.copyWith(
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      continent: freezed == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String?,
      flag1x1: null == flag1x1
          ? _value.flag1x1
          : flag1x1 // ignore: cast_nullable_to_non_nullable
              as String,
      flag4x3: null == flag4x3
          ? _value.flag4x3
          : flag4x3 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iso: null == iso
          ? _value.iso
          : iso // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, required: false) String? capital,
      String code,
      @JsonKey(includeIfNull: false, required: false) String? continent,
      @JsonKey(name: "flag_1x1") String flag1x1,
      @JsonKey(name: "flag_4x3") String flag4x3,
      String name,
      bool iso});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capital = freezed,
    Object? code = null,
    Object? continent = freezed,
    Object? flag1x1 = null,
    Object? flag4x3 = null,
    Object? name = null,
    Object? iso = null,
  }) {
    return _then(_$_Country(
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      continent: freezed == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String?,
      flag1x1: null == flag1x1
          ? _value.flag1x1
          : flag1x1 // ignore: cast_nullable_to_non_nullable
              as String,
      flag4x3: null == flag4x3
          ? _value.flag4x3
          : flag4x3 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iso: null == iso
          ? _value.iso
          : iso // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Country implements _Country {
  _$_Country(
      {@JsonKey(includeIfNull: false, required: false) this.capital,
      required this.code,
      @JsonKey(includeIfNull: false, required: false) this.continent,
      @JsonKey(name: "flag_1x1") required this.flag1x1,
      @JsonKey(name: "flag_4x3") required this.flag4x3,
      required this.name,
      required this.iso});

  @override
  @JsonKey(includeIfNull: false, required: false)
  final String? capital;
  @override
  final String code;
  @override
  @JsonKey(includeIfNull: false, required: false)
  final String? continent;
  @override
  @JsonKey(name: "flag_1x1")
  final String flag1x1;
  @override
  @JsonKey(name: "flag_4x3")
  final String flag4x3;
  @override
  final String name;
  @override
  final bool iso;

  @override
  String toString() {
    return 'Country(capital: $capital, code: $code, continent: $continent, flag1x1: $flag1x1, flag4x3: $flag4x3, name: $name, iso: $iso)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.continent, continent) ||
                other.continent == continent) &&
            (identical(other.flag1x1, flag1x1) || other.flag1x1 == flag1x1) &&
            (identical(other.flag4x3, flag4x3) || other.flag4x3 == flag4x3) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iso, iso) || other.iso == iso));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, capital, code, continent, flag1x1, flag4x3, name, iso);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);
}

abstract class _Country implements Country {
  factory _Country(
      {@JsonKey(includeIfNull: false, required: false) final String? capital,
      required final String code,
      @JsonKey(includeIfNull: false, required: false) final String? continent,
      @JsonKey(name: "flag_1x1") required final String flag1x1,
      @JsonKey(name: "flag_4x3") required final String flag4x3,
      required final String name,
      required final bool iso}) = _$_Country;

  @override
  @JsonKey(includeIfNull: false, required: false)
  String? get capital;
  @override
  String get code;
  @override
  @JsonKey(includeIfNull: false, required: false)
  String? get continent;
  @override
  @JsonKey(name: "flag_1x1")
  String get flag1x1;
  @override
  @JsonKey(name: "flag_4x3")
  String get flag4x3;
  @override
  String get name;
  @override
  bool get iso;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}
