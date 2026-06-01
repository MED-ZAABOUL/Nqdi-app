// lib/main.dart
//
// Nqdi — Moroccan-Darija personal budgeting app.
// Entry point: wires up Riverpod, forces RTL + Arabic locale, applies the
// Material 3 theme and launches the onboarding flow.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_theme.dart';
import 'screens/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Keep the app portrait — it's designed as a phone-first experience.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: NqdiApp()));
}

class NqdiApp extends StatelessWidget {
  const NqdiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نقدي – Nqdi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // Force Arabic so the whole UI lays out right-to-left.
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: const OnboardingScreen(),
    );
  }
}
