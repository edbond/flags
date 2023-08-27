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
  QuizCubit({required SettingsCubit settingsCubit})
      : super(QuizState.running(
          settingsCubit: settingsCubit,
          timeLimit: DateTime.now().add(Duration(seconds: 30)),
          startedAt: DateTime.now(),
          timeLeft: Duration(seconds: 30),
        ));

  @override
  Future<void> close() {
    if (state is _Running) {
      (state as _Running).timer?.cancel();
    }

    return super.close();
  }

  resetTimer() {
    if (state is! _Running) {
      return;
    }

    final now = DateTime.now();
    final timeLeft = Duration(seconds: secondsToAnswer);
    final timeLimit = now.add(timeLeft);

    final newState = (state as _Running)
        .copyWith(startedAt: now, timeLimit: timeLimit, timeLeft: timeLeft);
    emit(newState);

    startTimer();
  }

  startTimer() {
    if (state is! _Running) {
      return;
    }

    var timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
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
        timer.cancel();
        emit(running.copyWith(
          timeLeft: Duration.zero,
          result: Result.timeout,
        ));
      } else {
        emit(running.copyWith(timeLeft: timeLeft));
      }
    });

    emit((state as _Running).copyWith(timer: timer));
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

    // TODO: check if it was already answered

    // choose 3 answers + 1 correct
    var correct = countries[idx];
    Set<Country> variants = {correct};

    // var cs = List<Country>.from(countries);
    // cs.sort((a, b) => b.name.length.compareTo(a.name.length));
    //
    // variants.addAll(cs.take(3).toList());

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
      emit(running.copyWith(
        questionNumber: running.questionNumber + 1,
        result: Result.valid,
        correctAnswers: running.correctAnswers + 1,
      ));
      running.timer?.cancel();
      return;
    }

    // invalid answer
    var guesses = running.guesses != null
        ? List<Country>.from(running.guesses!)
        : <Country>[];

    if (guesses.length >= 1) {
      emit(running.copyWith(
        result: Result.invalid,
        questionNumber: running.questionNumber + 1,
      ));
      running.timer?.cancel();
      return;
    }

    guesses.add(g);
    emit(running.copyWith(guesses: guesses));
  }
}
