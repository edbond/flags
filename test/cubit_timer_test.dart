import 'package:flags/model/country.dart';
import 'package:flags/model/quiz_cubit.dart';
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
        flag1x1: 'flags/flags/1x1/c$i.svg',
        flag4x3: 'flags/flags/4x3/c$i.svg',
        iso: true,
      ),
    );

void main() {
  group('SettingsCubit timer', () {
    test('state has no timer field', () {
      final cubit = SettingsCubit(SettingsState.initial(
        countries: _mockCountries(),
        homepageFlags: _mockCountries(),
      ));
      // Verify timer is not accessible on state (removed from state class).
      // Access via dynamic to get a runtime NoSuchMethodError instead of a
      // compile-time error, confirming the field no longer exists on the type.
      // ignore: undefined_getter
      expect(() => (cubit.state as dynamic).timer, throwsNoSuchMethodError);
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
      // Should throw NoSuchMethodError since timer field is removed from state:
      expect(() => running.timer, throwsNoSuchMethodError);
    });

    test('calling startTimer twice does not double the tick rate', () async {
      final cubit = QuizCubit(settingsCubit: settings);
      await cubit.nextQuestion();

      cubit.startTimer();
      cubit.startTimer(); // should cancel first

      int ticksBefore = 0;
      if ((cubit.state as dynamic).runtimeType.toString().contains('Running')) {
        ticksBefore = (cubit.state as dynamic).timeLeft.inMilliseconds as int;
      }

      await Future.delayed(const Duration(milliseconds: 600));

      if ((cubit.state as dynamic).runtimeType.toString().contains('Running')) {
        final timeLeft =
            (cubit.state as dynamic).timeLeft.inMilliseconds as int;
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
}
