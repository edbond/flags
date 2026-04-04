part of 'quiz_cubit.dart';

enum Result { timeout, running, valid, invalid }

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
    @Default(Result.running) Result result,
    List<Country>? guesses,
    @Default(0) int questionNumber,
    @Default(0) int correctAnswers,
  }) = _Running;
}
