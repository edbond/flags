import 'dart:developer';

import 'package:flags/model/quiz_cubit.dart';
import 'package:flags/model/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

final correctColor = MaterialStateProperty.all<Color>(Colors.green);

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(SettingsState.initial())..parse(),
      child: BlocProvider(
        create: (context) {
          var settingsCubit = context.read<SettingsCubit>();
          return QuizCubit(settingsCubit: settingsCubit)
            ..nextQuestion()
            ..startTimer();
        },
        child: Scaffold(
          backgroundColor: Colors.purpleAccent.shade100,
          body: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, settingsState) {
              return BlocBuilder<QuizCubit, QuizState>(
                  builder: (context, state) {
                return SafeArea(
                    child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      state.maybeMap<Widget>(
                          orElse: () => SizedBox.shrink(),
                          running: (r) {
                            var seconds = r.timeLeft.inSeconds;
                            var secondsLeft =
                                seconds.toString().padLeft(2, "0");

                            if (r.timeout) {
                              secondsLeft = "timeout";
                            }

                            return Container(
                              color: Colors.yellow,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BackButton(
                                      onPressed: () {
                                        context.replace("/");
                                      },
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(secondsLeft,
                                              style: GoogleFonts.notoSansMono(
                                                  fontSize: 28)),
                                          SizedBox(width: 4),
                                          Icon(Icons.timer_outlined),
                                        ]),
                                  ],
                                ),
                              ),
                            );
                          }),
                      state.maybeMap<Widget>(
                          orElse: () => SizedBox.shrink(),
                          running: (r) {
                            return Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      context.read<QuizCubit>()
                                        ..resetTimer()
                                        ..nextQuestion();
                                    },
                                    child: Text("Reset timer")),
                                r.country != null
                                    ? SvgPicture.asset(
                                        "flags/flags/4x3/${r.country?.code ?? 'ua'}.svg",
                                        height: 160,
                                        fit: BoxFit.fill,
                                      )
                                    : SizedBox(width: 200, height: 160),
                                SizedBox(
                                  height: 20,
                                ),
                                Answers(state: r, i: 0, j: 2),
                                Answers(state: r, i: 2, j: 4),
                              ],
                            );
                          }),
                    ],
                  ),
                ));
              });
            },
          ),
        ),
      ),
    );
  }
}

class Answers extends StatelessWidget {
  final QuizState state;
  final int i;
  final int j;

  const Answers({
    super.key,
    required this.state,
    required this.i,
    required this.j,
  });

  @override
  Widget build(BuildContext context) {
    return state.maybeMap<Widget>(
        orElse: () => SizedBox.shrink(),
        running: (r) => Row(
            // alignment: WrapAlignment.center,
            // runAlignment: WrapAlignment.center,
            // spacing: 0,
            children: r.variants
                    ?.sublist(i, j)
                    ?.map((v) => ElevatedButton(
                        clipBehavior: Clip.antiAlias,
                        style: (r.timeout && v.code == r.country?.code
                            ? ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(MediaQuery.of(context).size.width / 2,
                                        48)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                backgroundColor: correctColor)
                            : ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(MediaQuery.of(context).size.width / 2,
                                        48)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                              )),
                        onPressed: () {
                          log(v.code);
                        },
                        child: Expanded(
                            child: Text(
                          v.name,
                          softWrap: true,
                          maxLines: 5,
                        ))))
                    .toList() ??
                []));
  }
}
