import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/widgets/salah_and_icon_column.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SalahCardTable extends StatelessWidget {
  const SalahCardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.salahTime,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SalahAndIconColumn(
                  text: AppLocalizations.of(context)!.fagr,
                ),
                SalahAndIconColumn(
                  text: AppLocalizations.of(context)!.zuhr,
                ),
                SalahAndIconColumn(
                  text: AppLocalizations.of(context)!.asr,
                ),
                SalahAndIconColumn(
                  text: AppLocalizations.of(context)!.maghrib,
                ),
                SalahAndIconColumn(
                  text: AppLocalizations.of(context)!.ashaa,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
