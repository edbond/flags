part of 'quiz_cubit.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial({required SettingsCubit settingsCubit}) =
      _Initial;

  const factory QuizState.running({
    required SettingsCubit settingsCubit,
    required DateTime timeLimit,
    required DateTime startedAt,
    required Duration timeLeft,
    Country? country,
    List<Country>? variants,
    Timer? timer,
    @Default(false) bool timeout,
  }) = _Running;
}
