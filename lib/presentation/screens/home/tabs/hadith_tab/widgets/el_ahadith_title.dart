import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ElAhadithTitle extends StatelessWidget {
  const ElAhadithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
      ),
      child: Text(
        AppLocalizations.of(context)!.elAhadith,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}