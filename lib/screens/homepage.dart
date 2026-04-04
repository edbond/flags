import 'package:flags/colors.dart';
import 'package:flags/model/settings_cubit.dart';
import 'package:flags/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scale = getScale(context);

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
            backgroundColor: sand,
            body: SafeArea(
              minimum: EdgeInsets.all(16.0 * scale),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Flags Quiz",
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 52 * scale,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20 * scale),
                      child: SvgPicture.asset(
                        "flags/flags/4x3/${currentFlag(settings)}.svg",
                        height: 160 * scale,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SegmentedButton<Difficulty>(
                    //       showSelectedIcon: false,
                    //       segments: const <ButtonSegment<Difficulty>>[
                    //         ButtonSegment<Difficulty>(
                    //           value: Difficulty.easy,
                    //           label: Text("Easy"),
                    //         ),
                    //         ButtonSegment<Difficulty>(
                    //           value: Difficulty.normal,
                    //           label: Text("Normal"),
                    //         ),
                    //         ButtonSegment<Difficulty>(
                    //           value: Difficulty.hard,
                    //           label: Text("Hard"),
                    //         ),
                    //       ],
                    //       selected: <Difficulty>{settings.difficulty},
                    //       onSelectionChanged: (v) {
                    //         context
                    //             .read<SettingsCubit>()
                    //             .setDifficulty(v.first);
                    //       }),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        context.replace("/quiz");
                      },
                      style: actionButtonStyle,
                      child: Text(
                        "START",
                        style: TextStyle(fontSize: 28 * scale),
                      ),
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
