import 'package:flutter/material.dart';
import 'package:zipzap/src/features/onboarding_page.dart';
import 'package:zipzap/src/reusable_widgets/loader.dart';
import 'package:zipzap/src/utils/theme/theme.dart';

class ZipZapApp extends StatelessWidget {
  const ZipZapApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ZipZap',
        theme: ZipZapTheme.lightTheme,
        darkTheme: ZipZapTheme.dartTheme,
        home: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const OnboardingScreen();
              } else {
                return const Loader();
              }
            }));
  }
}
