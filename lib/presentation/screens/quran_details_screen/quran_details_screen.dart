import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/presentation/screens/quran_details_screen/widgets/sura_verses_widget.dart';

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
    if (verses.isEmpty) readQuranFile(model.index + 1);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsManager.lightBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.name,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SingleChildScrollView(
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
    );
  }

  Future<void> readQuranFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/$index.txt');
    verses = fileContent.trim().split('\n');
    setState(() {});
  }
}
