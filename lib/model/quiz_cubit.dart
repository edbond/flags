import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flags/model/country.dart';
import 'package:flags/model/settings_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_cubit.freezed.dart';
part 'quiz_state.dart';

const secondsToAnswer = 60;

class QuizCubit extends Cubit<QuizState> {
  Timer? _quizTimer;

  QuizCubit({required SettingsCubit settingsCubit})
      : super(QuizState.running(
          settingsCubit: settingsCubit,
          timeLimit: DateTime.now().add(const Duration(seconds: secondsToAnswer)),
          startedAt: DateTime.now(),
          timeLeft: const Duration(seconds: secondsToAnswer),
        ));

  @override
  Future<void> close() {
    _quizTimer?.cancel();
    return super.close();
  }

  resetTimer() {
    if (state is! _Running) {
      return;
    }

    _quizTimer?.cancel();

    final now = DateTime.now();
    final timeLeft = const Duration(seconds: secondsToAnswer);
    final timeLimit = now.add(timeLeft);

    emit((state as _Running)
        .copyWith(startedAt: now, timeLimit: timeLimit, timeLeft: timeLeft));

    startTimer();
  }

  startTimer() {
    if (state is! _Running) {
      return;
    }

    _quizTimer?.cancel();

    _quizTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      if (state is! _Running) {
        return;
      }

      final running = (state as _Running);
      final now = DateTime.now();
      final timeLeft = running.timeLimit.difference(now);

      if (timeLeft.inSeconds <= 0) {
        _quizTimer?.cancel();
        _quizTimer = null;
        emit(running.copyWith(
          timeLeft: Duration.zero,
          result: Result.timeout,
        ));
      } else {
        emit(running.copyWith(timeLeft: timeLeft));
      }
    });
  }

  nextQuestion() async {
    if (state is! _Running) {
      return;
    }
    var running = state as _Running;
    var settings = state.settingsCubit.state;

    if (settings.countries.isEmpty) {
      await state.settingsCubit.parse();
    }

    settings = state.settingsCubit.state;

    var countries = settings.countries;

    var idx = Random().nextInt(countries.length);

    // choose 3 answers + 1 correct
    var correct = countries[idx];
    Set<Country> variants = {correct};

    while (variants.length < 4) {
      var more = Random().nextInt(countries.length);
      var c = countries[more];
      if (!variants.contains(c)) {
        variants.add(c);
      }
    }

    // shuffle list
    var varList = variants.toList();
    varList.shuffle();

    emit(running.copyWith(
      guesses: null,
      result: Result.running,
      variants: varList,
      country: correct,
    ));
  }

  guess(Country g) {
    if (state is! _Running) {
      return;
    }

    final running = state as _Running;

    // correct answer
    if (running.country == g) {
      _quizTimer?.cancel();
      _quizTimer = null;
      emit(running.copyWith(
        questionNumber: running.questionNumber + 1,
        result: Result.valid,
        correctAnswers: running.correctAnswers + 1,
      ));
      return;
    }

    // invalid answer
    var guesses = running.guesses != null
        ? List<Country>.from(running.guesses!)
        : <Country>[];

    if (guesses.length >= 1) {
      _quizTimer?.cancel();
      _quizTimer = null;
      emit(running.copyWith(
        result: Result.invalid,
        questionNumber: running.questionNumber + 1,
      ));
      return;
    }

    guesses.add(g);
    emit(running.copyWith(guesses: guesses));
  }
}
