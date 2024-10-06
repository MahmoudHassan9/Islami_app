import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../quran_tab.dart';
import 'name_and_number_row.dart';

class SuraNameAndVersusNumberListView extends StatelessWidget {
  const SuraNameAndVersusNumberListView({
    super.key,
    required this.suraNames,
    required this.versesNumber,
  });

  final List<String> suraNames;
  final List<int> versesNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => NameAndNumberRow(
        model: SuraModel(
          name: suraNames[index],
          number: versesNumber[index].toString(),
          index: index,
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: suraNames.length,
    );
  }
}