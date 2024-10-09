import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routes_manager.dart';
import '../hadith_tab.dart';

class HadithNameWidget extends StatelessWidget {
  const HadithNameWidget({super.key, required this.model});

  final HadithModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.hadithDetailsRoute,
          arguments: model,
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          model.name,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
