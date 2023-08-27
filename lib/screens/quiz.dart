import 'package:flags/colors.dart';
import 'package:flags/model/quiz_cubit.dart';
import 'package:flags/model/settings_cubit.dart';
import 'package:flags/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = getScale(context);

    return BlocProvider(
      create: (context) => SettingsCubit(SettingsState.initial())..parse(),
      child: BlocProvider(
        create: (context) {
          var settingsCubit = context.read<SettingsCubit>();
          return QuizCubit(settingsCubit: settingsCubit)
            ..nextQuestion()
            ..startTimer();
        },
        child: Semantics(
          label: "Flags quiz container",
          container: true,
          child: Scaffold(
            backgroundColor: sand,
            body: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, settingsState) {
                return BlocBuilder<QuizCubit, QuizState>(
                    builder: (context, state) {
                  return SafeArea(
                      child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        state.maybeMap<Widget>(
                            orElse: () => SizedBox.shrink(),
                            running: (r) {
                              var seconds = r.timeLeft.inSeconds;
                              var secondsLeft = seconds.toString();

                              if (r.result == Result.timeout) {
                                secondsLeft = "time out";
                              }

                              return Padding(
                                padding: EdgeInsets.all(16.0 * scale),
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
                                                  fontSize: 28 * scale)),
                                          SizedBox(width: 4 * scale),
                                          Icon(Icons.timer_outlined),
                                        ]),
                                  ],
                                ),
                              );
                            }),
                        state.maybeMap<Widget>(
                            orElse: () => SizedBox.shrink(),
                            running: (r) {
                              return Column(
                                children: [
                                  r.country != null
                                      ? SvgPicture.asset(
                                          "flags/flags/4x3/${r.country?.code ?? 'ua'}.svg",
                                          height: 160 * scale,
                                          fit: BoxFit.fill,
                                        )
                                      : SizedBox(
                                          width: 200 * scale,
                                          height: 160 * scale),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16.0 * scale),
                                    child: Text(
                                        "${r.correctAnswers} correct out of ${r.questionNumber} total",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 28 * scale)),
                                  ),
                                  Answers(state: r, i: 0, j: 2),
                                  SizedBox(height: 8 * scale),
                                  Answers(state: r, i: 2, j: 4),
                                  r.result != Result.running
                                      ? Padding(
                                          padding: EdgeInsets.all(8.0 * scale),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                context.read<QuizCubit>()
                                                  ..resetTimer()
                                                  ..nextQuestion();
                                              },
                                              style: actionButtonStyle,
                                              child: Text("Next Question",
                                                  style: TextStyle(
                                                      fontSize: 28 * scale))),
                                        )
                                      : SizedBox.shrink(),
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
    final scale = getScale(context);
    final w = MediaQuery.of(context).size.width / 2 - 16 * scale;

    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(w, 100 * scale),
      maximumSize: Size(w, MediaQuery.of(context).size.height * scale),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    final quiz = context.read<QuizCubit>();

    return state.maybeMap<Widget>(
        orElse: () => SizedBox.shrink(),
        running: (r) => SizedBox(
              width: MediaQuery.of(context).size.width - 20 * scale,
              child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.start,
                  spacing: 0,
                  children: r.variants?.sublist(i, j).map((v) {
                        var btnStyle = buttonStyle;
                        var enabled = true;

                        if (r.guesses != null && r.guesses!.contains(v)) {
                          enabled = false;
                        }

                        if (r.result != Result.running &&
                            v.code == r.country?.code) {
                          btnStyle = btnStyle.copyWith(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(green));
                        } else if (r.guesses != null &&
                            r.guesses!.contains(v)) {
                          btnStyle = btnStyle.copyWith(
                              foregroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black54),
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black12));
                        }

                        return ElevatedButton(
                            style: btnStyle,
                            onPressed: enabled && r.result == Result.running
                                ? () {
                                    if (r.result == Result.running) {
                                      quiz.guess(v);
                                    }
                                  }
                                : null,
                            child: Text(
                              v.name,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w500,
                              ),
                            ));
                      }).toList() ??
                      []),
            ));
  }
}
