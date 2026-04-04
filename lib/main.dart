import 'package:flags/colors.dart';
import 'package:flags/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const HomePage()),
    GoRoute(path: "/quiz", builder: (context, state) => const Quiz()),
  ], initialLocation: "/");

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.brown,
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserratTextTheme(textTheme)
              .apply(bodyColor: Colors.white)
              .titleLarge,
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blue, background: sand),
      ),
    );
  }
}
