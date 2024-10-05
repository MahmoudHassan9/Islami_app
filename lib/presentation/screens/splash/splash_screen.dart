import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/presentation/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(
          context,
          RoutesManager.homeRoute,
        );
      }
    });
    return Image.asset(
      AssetsManager.lightSplash,
    );
  }
}
