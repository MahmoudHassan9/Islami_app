import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/presentation/screens/hadith_details_screen/widgets/arrow_widget.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/presentation/screens/quran_details_screen/widgets/sura_verses_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/themeing_provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraModel model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    ThemeingProvider provider = Provider.of(context);

    if (verses.isEmpty) readQuranFile(model.index + 1);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.isDark
                ? AssetsManager.darkBackground
                : AssetsManager.lightBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.name,
          ),
          actions: [
            if (model.index != 0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ArrowWidget(
                  icon: Icons.arrow_back_ios_new_outlined,
                  index: model.index,
                  next: false,
                  model: model,
                ),
              ),
            if (model.index != 113)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ArrowWidget(
                  icon: Icons.arrow_forward_ios_outlined,
                  index: model.index,
                  next: true,
                  model: model,
                ),
              ),
          ],
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    children: [
                      if (verses.length != 7 && verses.length != 129)
                        const SizedBox(
                          width: double.infinity,
                          child: SuraVersesWidget(
                            verse: 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                          ),
                        ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => SuraVersesWidget(
                          verse: verses[index],
                        ),
                        itemCount: verses.length,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> readQuranFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/$index.txt');

    verses = fileContent.trim().split('\n');
    setState(() {});
  }
}
