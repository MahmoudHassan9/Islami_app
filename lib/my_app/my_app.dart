

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/themes/app_theme.dart';
import '../core/routes_manager.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.homeRoute: (_) => const HomeScreen(),
      },
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
