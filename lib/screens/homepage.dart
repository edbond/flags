import 'package:flags/model/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (context) {
          var settings = SettingsCubit(SettingsState.initial())
            ..parse()
            ..startTimer();

          return settings;
        }),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settings) {
          return Scaffold(
            body: SafeArea(
              minimum: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Flags Quiz",
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      "flags/flags/4x3/${currentFlag(settings)}.svg",
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SegmentedButton<Difficulty>(
                          showSelectedIcon: false,
                          segments: const <ButtonSegment<Difficulty>>[
                            ButtonSegment<Difficulty>(
                              value: Difficulty.easy,
                              label: Text("Easy"),
                            ),
                            ButtonSegment<Difficulty>(
                              value: Difficulty.normal,
                              label: Text("Normal"),
                            ),
                            ButtonSegment<Difficulty>(
                              value: Difficulty.hard,
                              label: Text("Hard"),
                            ),
                          ],
                          selected: <Difficulty>{settings.difficulty},
                          onSelectionChanged: (v) {
                            context
                                .read<SettingsCubit>()
                                .setDifficulty(v.first);
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.replace("/quiz");
                      },
                      child: const Text("START"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String currentFlag(SettingsState settings) {
    if (settings.homepageFlags.isEmpty) {
      return "ua";
    }

    var idx = settings.currentFlagIdx;
    return settings.homepageFlags[idx].code;
  }
}
