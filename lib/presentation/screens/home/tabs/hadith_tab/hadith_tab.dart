import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/routes_manager.dart';

import '../../../../../core/assets_manager.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> ahadithList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadithList.isEmpty) readHadithfile();
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: Image.asset(
            AssetsManager.hadithHeaderImage,
          ),
        ),
        const ElAhadithTitle(),
        Expanded(
          flex: 70,
          child: ahadithList.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => HadithNameWidget(
                    model: ahadithList[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: ahadithList.length,
                ),
        )
      ],
    );
  }

  Future<void> readHadithfile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithList = fileContent.trim().split('#');
    for (var hadith in hadithList) {
      List<String> hadithLines = hadith.trim().split('\n');
      String name = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join('\n');
      ahadithList.add(HadithModel(
        name: name,
        content: content,
      ));
      setState(() {});
    }
  }
}

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
        'EL-Ahadith',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class HadithModel {
  String name;
  String content;

  HadithModel({
    required this.name,
    required this.content,
  });
}

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
