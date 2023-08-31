import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flags/model/country.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(super.initialState);

  @override
  Future<void> close() {
    state.timer?.cancel();
    return super.close();
  }

  Future<void> parse() async {
    emit(state.copyWith(countries: await _readCountries()));
  }

  setDifficulty(Difficulty d) {
    emit(state.copyWith(difficulty: d));

    switch (d) {
      case Difficulty.easy:
        easy();
      case Difficulty.normal:
        normal();
      case Difficulty.hard:
        hard();
    }
  }

  // switch to easy level
  easy() {
    emit(state.copyWith(attempts: 4, timeLimitSeconds: 60));
  }

  // normal
  normal() {
    emit(state.copyWith(attempts: 2, timeLimitSeconds: 30));
  }

  // hard
  hard() {
    emit(state.copyWith(
        attempts: 1, timeLimitSeconds: 10, difficulty: Difficulty.hard));
  }

  randomHomepageFlags() {
    var countries = List<Country>.from(state.countries);
    countries.shuffle();

    var flagsToShow = countries.take(10).toList();
    emit(state.copyWith(homepageFlags: flagsToShow));
  }

  startTimer() {
    state.timer?.cancel();

    var timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      if (state.homepageFlags.isEmpty) {
        randomHomepageFlags();
      }

      var idx = state.currentFlagIdx + 1;
      if (idx >= state.homepageFlags.length) {
        idx = 0;
      }
      emit(state.copyWith(currentFlagIdx: idx));
    });

    emit(state.copyWith(timer: timer));
  }

  Future<List<Country>> _readCountries() async {
    final file = await rootBundle.loadString("flags/country.json");
    return (json.decode(file) as List<dynamic>)
        .map((e) => Country.fromJSON(e))
        // Central European Free Trade Agreement
        .where((element) => element.code != "xx" && element.name.length < 26)
        .toList();
  }
}
