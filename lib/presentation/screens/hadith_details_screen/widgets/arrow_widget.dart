import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes_manager.dart';
import '../../home/tabs/hadith_tab/hadith_tab.dart';
import '../../home/tabs/quran_tab/quran_tab.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({
    super.key,
    required this.icon,
    required this.index,
    this.ahaditList,
    this.onTap,
    required this.next,
    this.model,
  });

  final IconData icon;
  final int index;
  final List<HadithModel>? ahaditList;
  final bool next;
  final Function? onTap;
  final SuraModel? model;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
      radius: 24,
      child: IconButton(
        onPressed: () {
          if (ahaditList != null) {
            Navigator.pushReplacementNamed(
                context, RoutesManager.hadithDetailsRoute,
                arguments: ahaditList![next ? index + 1 : index - 1]);
          } else if (ahaditList == null) {
            Navigator.pushReplacementNamed(
                context, RoutesManager.quranDetailsRoute,
                arguments: SuraModel(
                  name: suraNames[next ? model!.index + 1 : model!.index - 1],
                  number:
                      versesNumber[next ? model!.index + 1 : model!.index - 1]
                          .toString(),
                  index: next ? model!.index + 1 : model!.index - 1,
                ));
          }
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
