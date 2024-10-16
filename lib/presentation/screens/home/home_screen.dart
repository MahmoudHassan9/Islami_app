import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    SetingsTab(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsManager.lightBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islamy,
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items:  [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.quranIcon,
                ),
              ),
              label: AppLocalizations.of(context)!.quranTab,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.hadithIcon,
                ),
              ),
              label: AppLocalizations.of(context)!.hadithTab,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.sebhaIcon,
                ),
              ),
              label:  AppLocalizations.of(context)!.sebhaTab,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.radioIcon,
                ),
              ),
              label:  AppLocalizations.of(context)!.radioTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                size: 35,
              ),
              label: AppLocalizations.of(context)!.settingsTab,
            ),
          ],
        ),
      ),
    );
  }
}
