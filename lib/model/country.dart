import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

// {
// "capital": "Kabul",
// "code": "af",
// "continent": "Asia",
// "flag_1x1": "flags/1x1/af.svg",
// "flag_4x3": "flags/4x3/af.svg",
// "iso": true,
// "name": "Afghanistan"
// },

@freezed
@JsonSerializable()
sealed class Country with _$Country {
  factory Country({
    @JsonKey(includeIfNull: false, required: false) final String? capital,
    required String code,
    @JsonKey(includeIfNull: false, required: false) final String? continent,
    @JsonKey(name: "flag_1x1") required String flag1x1,
    @JsonKey(name: "flag_4x3") required String flag4x3,
    required String name,
    required bool iso,
  }) = _Country;

  factory Country.fromJSON(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
