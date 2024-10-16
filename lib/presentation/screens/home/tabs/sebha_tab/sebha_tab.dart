import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int zekrCounter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
  ];
  double turns = 0;
  int time = 400;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 40,
                left: 10,
                right: 10,
                child: GestureDetector(
                  onTap: sebhaClick,
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(
                      milliseconds: time,
                    ),
                    child: Center(
                      child: Image.asset(
                        AssetsManager.sebhaHeaderImage,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: 105,
                width: 73,
                left: 192,
                top: 0,
                child: Image.asset(
                  AssetsManager.headOfSebha,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.numberOfTasbeeh,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor.withOpacity(0.57),
                ),
                child: Text(
                  sebhaCounter.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  azkar[zekrCounter],
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void sebhaClick() {
    Feedback.forTap(context);
    turns += 1 / 33;
    if (sebhaCounter == 33) {
      sebhaCounter = 0;
      zekrCounter++;
      turns = 0;
      time = 200;
    } else {
      time = 400;
    }
    if (zekrCounter == 3) {
      zekrCounter = 0;
    }
    sebhaCounter++;

    setState(() {});
  }
}
