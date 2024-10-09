import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/widgets/el_ahadith_title.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/widgets/hadith_name_widget.dart';

import '../../../../../core/assets_manager.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> ahadithList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadithList.isEmpty) readHadithfile();
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: Image.asset(
            AssetsManager.hadithHeaderImage,
          ),
        ),
        const ElAhadithTitle(),
        Expanded(
          flex: 70,
          child: ahadithList.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => HadithNameWidget(
                    model: ahadithList[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: ahadithList.length,
                ),
        )
      ],
    );
  }

  Future<void> readHadithfile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithList = fileContent.trim().split('#');
    for (var hadith in hadithList) {
      List<String> hadithLines = hadith.trim().split('\n');
      String name = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join('\n');
      ahadithList.add(HadithModel(
          name: name,
          content: content,
          index: ahadithList.isEmpty ? 0 : ahadithList.length,
          ahadithList: ahadithList));
      setState(() {});
    }
    ahadithList.removeLast();
  }
}

class HadithModel {
  String name;
  String content;
  int index;
  List<HadithModel> ahadithList;

  HadithModel({
    required this.name,
    required this.content,
    required this.index,
    required this.ahadithList,
  });
}
