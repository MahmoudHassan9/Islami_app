import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NameAndNumberTitle extends StatelessWidget {
  const NameAndNumberTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 3,
            color: Theme.of(context).dividerTheme.color!,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.suraName,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.versesNumber,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}