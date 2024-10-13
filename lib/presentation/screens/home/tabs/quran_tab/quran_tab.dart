import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/widgets/name_and_number_title.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/widgets/salah_card_table.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/widgets/sura_name_and_verses_number_list.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/constants/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: Image.asset(
            AssetsManager.quranHeaderImage,
          ),
        ),
        const SalahCardTable(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const NameAndNumberTitle(),
                  Expanded(
                    child: SuraNameAndVersusNumberListView(
                      suraNames: suraNames,
                      versesNumber: versesNumber,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                width: 3,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SuraModel {
  String name;
  String number;
  int index;

  SuraModel({
    required this.name,
    required this.number,
    required this.index,
  });
}





