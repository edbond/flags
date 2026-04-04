# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Get dependencies
flutter pub get

# Analyze (lint)
dart analyze

# Run tests
flutter test

# Run code generation (after modifying Freezed models)
flutter pub run build_runner build --delete-conflicting-outputs

# Build for Android (release)
flutter build appbundle

# Build for web
flutter build web

# Format code
dart format .
```

## Architecture

This is a Flutter flags quiz game targeting Android, iOS, and web.

### Navigation
`lib/main.dart` sets up `go_router` with two routes: `/` (HomePage) and `/quiz` (Quiz screen).

### State Management
BLoC pattern using `flutter_bloc` with Freezed-annotated immutable states:

- **`SettingsCubit`** (`lib/model/settings_cubit.dart`) — loads country data from `flags/country.json`, manages difficulty settings (Easy/Normal/Hard with different timers and allowed wrong guesses), and drives the homepage flag carousel. Provided above the router so both screens share it.
- **`QuizCubit`** (`lib/model/quiz_cubit.dart`) — manages quiz flow: question generation (1 correct + 3 random variants), answer validation, scoring, and per-question countdown timer.

### Data Models (`lib/model/`)
All models use `freezed` + `json_serializable` — generated files end in `.freezed.dart` and `.g.dart`. Key types: `Country` (code, name, capital, continent, flag paths), `SettingsState`, `QuizState`.

### Screens (`lib/screens/`)
- `homepage.dart` — Rotating flag carousel (2s interval), difficulty selector, START button
- `quiz.dart` — Flag display, 2×2 answer grid, timer bar, score display; uses nested `BlocBuilder` for `SettingsCubit` + `QuizCubit`

### Assets
Flag SVGs live in `flags/flags/1x1/` and `flags/flags/4x3/` (country code filenames, e.g. `us.svg`). Country metadata is `flags/country.json`.

### Publishing Android
Bump `version` in `pubspec.yaml`, then run `flutter build appbundle`. Upload to Google Play Console.
