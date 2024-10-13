import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/widgets/salah_and_icon_column.dart';

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
              'Salah time',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SalahAndIconColumn(
                  text: 'fagr',
                ),
                SalahAndIconColumn(
                  text: 'zuhr',
                ),
                SalahAndIconColumn(
                  text: 'asr',
                ),
                SalahAndIconColumn(
                  text: 'maghrib',
                ),
                SalahAndIconColumn(
                  text: 'ashaa',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
