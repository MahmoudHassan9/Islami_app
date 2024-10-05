import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';

import '../../../core/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [
    RadioTab(),
    SebhaTab(),
    HadithTab(),
    QuranTab(),
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
          title: const Text(
            'Isalmi',
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.radioIcon,
                ),
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.sebhaIcon,
                ),
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.hadithIcon,
                ),
              ),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                size: 35,
                AssetImage(
                  AssetsManager.quranIcon,
                ),
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
