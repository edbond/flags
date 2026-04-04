# Design: Move Timers from Freezed State to Cubit Fields

**Date:** 2026-04-04
**Scope:** `SettingsCubit`, `QuizCubit` — small refactor, no UI changes

---

## Context

Both cubits currently store `Timer?` inside their Freezed state objects. This introduces two bugs:

1. **Timer leaks**: `startTimer()` emits a new `Timer.periodic` into state without cancelling the previous one. If called more than once (e.g. navigating home → quiz → home), the old timer keeps firing indefinitely in the background.

2. **Broken state equality**: Freezed generates `==` from all fields. `Timer` does not implement `==`, so two states with identical logical data but different `Timer` instances compare as unequal, causing unnecessary `BlocBuilder` rebuilds on every tick.

---

## Design

### State Changes

Remove the `timer` field from both state classes entirely. State objects become pure data — no mutable resources.

```dart
// SettingsState — remove:
timer: Timer?

// QuizState._Running — remove:
timer: Timer?
```

### Cubit Changes

Add a private `Timer?` field to each Cubit. `startTimer()` cancels any existing timer before creating a new one. `close()` cancels the timer on disposal.

**SettingsCubit:**
```dart
Timer? _carouselTimer;

void startTimer() {
  _carouselTimer?.cancel();
  _carouselTimer = Timer.periodic(const Duration(seconds: 2), (_) {
    // existing carousel rotation logic
  });
}

@override
Future<void> close() {
  _carouselTimer?.cancel();
  return super.close();
}
```

**QuizCubit:**
```dart
Timer? _quizTimer;

void startTimer() {
  _quizTimer?.cancel();
  _quizTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
    // existing countdown logic
  });
}

void resetTimer() {
  _quizTimer?.cancel();
  _quizTimer = null;
}

@override
Future<void> close() {
  _quizTimer?.cancel();
  return super.close();
}
```

Any internal null-checks on `state.timer` to determine if a timer is active are replaced with `_carouselTimer != null` / `_quizTimer != null`.

---

## Files Changed

| File | Change |
|---|---|
| `lib/model/settings_cubit.dart` | Add `_carouselTimer` field; update `startTimer()`, `close()` |
| `lib/model/quiz_cubit.dart` | Add `_quizTimer` field; update `startTimer()`, `resetTimer()`, `close()` |
| `lib/model/settings_state.dart` | Remove `timer` field |
| `lib/model/quiz_state.dart` | Remove `timer` field from `_Running` |
| `lib/screens/homepage.dart` | No changes |
| `lib/screens/quiz.dart` | No changes |

---

## Post-Change

Regenerate Freezed files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Verification

1. Run the app — carousel rotates on homepage, quiz timer counts down normally
2. Navigate home → start quiz → press back → start quiz again — confirm no double-speed timer (the leak symptom)
3. `flutter analyze` passes with no errors
