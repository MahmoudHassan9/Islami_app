import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routes_manager.dart';
import '../quran_tab.dart';

class NameAndNumberRow extends StatelessWidget {
  const NameAndNumberRow({
    super.key,
    required this.model,
  });

  final SuraModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.quranDetailsRoute,
          arguments: model,
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              model.name,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              model.number,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
