import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/quran_details_screen/quran_details_screen.dart';
import 'package:islami_app/providers/loclization_provider.dart';
import 'package:islami_app/providers/themeing_provider.dart';
import 'package:provider/provider.dart';

import '../config/themes/app_theme.dart';
import '../core/routes_manager.dart';
import '../presentation/screens/hadith_details_screen/hadith_details_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeingProvider themeingProvider = Provider.of(context);
    LoclizationProvider loclizationProvider = Provider.of(context);
    return MaterialApp(
      locale: Locale(loclizationProvider.languageCode),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeingProvider.currentTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.homeRoute: (_) => const HomeScreen(),
        RoutesManager.quranDetailsRoute: (_) => const QuranDetailsScreen(),
        RoutesManager.hadithDetailsRoute: (_) => const HadithDetailsScreen(),
      },
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
