# Timer Cubit Field Refactor — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Move `Timer?` out of Freezed state classes and into private Cubit instance fields, fixing a timer leak in `QuizCubit` and removing mutable resources from immutable state.

**Architecture:** Each Cubit owns a private `Timer?` field. `startTimer()` cancels the previous timer before creating a new one. State classes become pure data. No UI changes required.

**Tech Stack:** Flutter, flutter_bloc, freezed, dart:async

---

## File Map

| File | Change |
|---|---|
| `lib/model/settings_state.dart` | Remove `Timer? timer` field |
| `lib/model/settings_cubit.dart` | Add `_carouselTimer` field; update `startTimer()`, `close()` |
| `lib/model/quiz_state.dart` | Remove `Timer? timer` field from `_Running` |
| `lib/model/quiz_cubit.dart` | Add `_quizTimer` field; update `startTimer()`, `resetTimer()`, `guess()`, `close()` |
| `test/cubit_timer_test.dart` | New: unit tests for timer lifecycle |

Freezed-generated files (`*.freezed.dart`) are regenerated, not edited manually.

---

## Task 1: Remove timer from SettingsState and update SettingsCubit

**Files:**
- Modify: `lib/model/settings_state.dart`
- Modify: `lib/model/settings_cubit.dart`

- [ ] **Step 1: Write the failing test**

Create `test/cubit_timer_test.dart`:

```dart
import 'package:flags/model/country.dart';
import 'package:flags/model/settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// Minimal country list for tests — no JSON loading needed
List<Country> _mockCountries() => List.generate(
      10,
      (i) => Country(
        code: 'c$i',
        name: 'Country $i',
        capital: 'Capital $i',
        continent: 'EU',
        flag: 'flags/flags/4x3/c$i.svg',
        flag11: 'flags/flags/1x1/c$i.svg',
      ),
    );

void main() {
  group('SettingsCubit timer', () {
    test('state has no timer field', () {
      final cubit = SettingsCubit(SettingsState.initial(
        countries: _mockCountries(),
        homepageFlags: _mockCountries(),
      ));
      // This line should fail to compile until timer is removed from state:
      // ignore: undefined_getter
      expect(() => cubit.state.timer, throwsNoSuchMethodError);
    });

    test('calling startTimer twice does not double the tick rate', () async {
      final cubit = SettingsCubit(SettingsState.initial(
        countries: _mockCountries(),
        homepageFlags: _mockCountries(),
      ));

      cubit.startTimer();
      cubit.startTimer(); // should cancel first timer

      final before = cubit.state.currentFlagIdx;
      await Future.delayed(const Duration(milliseconds: 2100));
      final after = cubit.state.currentFlagIdx;

      // Exactly one 2-second tick should have fired
      expect((after - before).abs(), equals(1));

      await cubit.close();
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

```bash
cd /Users/Eduard/Projects/flags
flutter test test/cubit_timer_test.dart
```

Expected: FAIL — `state.timer` exists on state (not yet removed), and `startTimer()` called twice causes 2 ticks.

- [ ] **Step 3: Remove `Timer? timer` from SettingsState**

Replace the entire contents of `lib/model/settings_state.dart`:

```dart
part of 'settings_cubit.dart';

enum Difficulty { easy, normal, hard }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    @Default(2) attempts,
    @Default(30) timeLimitSeconds,
    @Default([]) List<Country> countries,
    @Default([]) List<Country> homepageFlags,
    @Default(0) int currentFlagIdx,
    @Default(Difficulty.normal) Difficulty difficulty,
    SharedPreferences? prefs,
  }) = _Initial;
}
```

- [ ] **Step 4: Update SettingsCubit**

Replace the entire contents of `lib/model/settings_cubit.dart`:

```dart
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
  Timer? _carouselTimer;

  SettingsCubit(super.initialState);

  @override
  Future<void> close() {
    _carouselTimer?.cancel();
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
    _carouselTimer?.cancel();

    _carouselTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
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
```

- [ ] **Step 5: Regenerate Freezed files**

```bash
cd /Users/Eduard/Projects/flags
flutter pub run build_runner build --delete-conflicting-outputs
```

Expected: Completes with no errors. `lib/model/settings_cubit.freezed.dart` is regenerated without `timer` field.

- [ ] **Step 6: Run tests**

```bash
flutter test test/cubit_timer_test.dart --name "SettingsCubit"
```

Expected: Both SettingsCubit tests PASS.

- [ ] **Step 7: Commit**

```bash
git add lib/model/settings_state.dart lib/model/settings_cubit.dart lib/model/settings_cubit.freezed.dart test/cubit_timer_test.dart
git commit -m "refactor: move carousel timer from SettingsState to Cubit field"
```

---

## Task 2: Remove timer from QuizState and update QuizCubit

**Files:**
- Modify: `lib/model/quiz_state.dart`
- Modify: `lib/model/quiz_cubit.dart`

- [ ] **Step 1: Write the failing tests**

Append to `test/cubit_timer_test.dart` (inside `main()`):

```dart
  group('QuizCubit timer', () {
    late SettingsCubit settings;

    setUp(() {
      settings = SettingsCubit(SettingsState.initial(
        countries: _mockCountries(),
        homepageFlags: _mockCountries(),
      ));
    });

    tearDown(() async {
      await settings.close();
    });

    test('state has no timer field', () {
      final cubit = QuizCubit(settingsCubit: settings);
      final running = cubit.state as dynamic;
      // Should fail to compile until timer is removed:
      expect(() => running.timer, throwsNoSuchMethodError);
    });

    test('calling startTimer twice does not double the tick rate', () async {
      final cubit = QuizCubit(settingsCubit: settings);
      await cubit.nextQuestion();

      cubit.startTimer();
      cubit.startTimer(); // should cancel first

      int ticksBefore = 0;
      if (cubit.state is _Running) {
        // capture timeLeft
        ticksBefore = (cubit.state as dynamic).timeLeft.inMilliseconds;
      }

      await Future.delayed(const Duration(milliseconds: 600));

      if (cubit.state is _Running) {
        final timeLeft = (cubit.state as dynamic).timeLeft.inMilliseconds;
        // With 500ms tick interval, one tick should fire in 600ms
        // If two timers fired, time would have advanced ~1000ms instead of ~500ms
        final elapsed = ticksBefore - timeLeft;
        expect(elapsed, lessThan(700)); // single tick ~500ms
      }

      await cubit.close();
    });

    test('resetTimer cancels previous timer before starting new one', () async {
      final cubit = QuizCubit(settingsCubit: settings);
      await cubit.nextQuestion();

      cubit.startTimer();
      await Future.delayed(const Duration(milliseconds: 100));
      cubit.resetTimer(); // must cancel previous timer

      // Wait 1.1 seconds — if old timer leaked, it would fire twice in this window
      int emitCount = 0;
      cubit.stream.listen((_) => emitCount++);
      await Future.delayed(const Duration(milliseconds: 1100));

      // Single timer: ~2 ticks in 1100ms (at 500ms interval)
      // Double timer: ~4 ticks in 1100ms
      expect(emitCount, lessThanOrEqualTo(3));

      await cubit.close();
    });

    test('close() after startTimer completes cleanly', () async {
      final cubit = QuizCubit(settingsCubit: settings);
      await cubit.nextQuestion();
      cubit.startTimer();
      await cubit.close(); // must not throw or hang
    });
  });
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
flutter test test/cubit_timer_test.dart --name "QuizCubit"
```

Expected: FAIL — `state.timer` still exists, double-timer behavior present.

- [ ] **Step 3: Remove `Timer? timer` from QuizState**

Replace the entire contents of `lib/model/quiz_state.dart`:

```dart
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
    @Default(Result.running) Result result,
    List<Country>? guesses,
    @Default(0) int questionNumber,
    @Default(0) int correctAnswers,
  }) = _Running;
}
```

- [ ] **Step 4: Update QuizCubit**

Replace the entire contents of `lib/model/quiz_cubit.dart`:

```dart
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
          timeLimit: DateTime.now().add(const Duration(seconds: 30)),
          startedAt: DateTime.now(),
          timeLeft: const Duration(seconds: 30),
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

    // TODO: check if it was already answered

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
```

- [ ] **Step 5: Regenerate Freezed files**

```bash
cd /Users/Eduard/Projects/flags
flutter pub run build_runner build --delete-conflicting-outputs
```

Expected: Completes with no errors. `lib/model/quiz_cubit.freezed.dart` is regenerated without `timer` field.

- [ ] **Step 6: Run all tests**

```bash
flutter test test/cubit_timer_test.dart
```

Expected: All tests PASS.

- [ ] **Step 7: Analyze**

```bash
flutter analyze
```

Expected: No errors or warnings related to changed files.

- [ ] **Step 8: Commit**

```bash
git add lib/model/quiz_state.dart lib/model/quiz_cubit.dart lib/model/quiz_cubit.freezed.dart test/cubit_timer_test.dart
git commit -m "refactor: move quiz timer from QuizState to Cubit field, fix timer leak in resetTimer"
```

---

## Task 3: Manual verification

- [ ] **Step 1: Run the app on the emulator**

```bash
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
flutter run -d emulator-5554
```

- [ ] **Step 2: Verify carousel on homepage**

Open the app. The flag carousel should rotate every 2 seconds as before.

- [ ] **Step 3: Verify quiz timer**

Tap START. The timer bar should count down normally. Answer a question correctly — timer stops. Tap next question — timer resets and counts down again.

- [ ] **Step 4: Verify no double-speed timer**

Navigate: HOME → START QUIZ → back → START QUIZ again. The timer should count down at normal speed (not double-speed, which would be the symptom of the old leak).

- [ ] **Step 5: Final commit**

```bash
git add -u
git commit -m "verify: timer refactor manual smoke test passed"
git push origin master
```
