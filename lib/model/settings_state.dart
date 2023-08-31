part of 'settings_cubit.dart';

enum Difficulty { easy, normal, hard }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    @Default(2) attempts,
    @Default(30) timeLimitSeconds,
    @Default([]) List<Country> countries,
    @Default([]) List<Country> homepageFlags,
    Timer? timer,
    @Default(0) int currentFlagIdx,
    @Default(Difficulty.normal) Difficulty difficulty,
    SharedPreferences? prefs,
  }) = _Initial;
}
