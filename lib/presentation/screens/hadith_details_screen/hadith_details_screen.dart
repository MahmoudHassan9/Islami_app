import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/presentation/screens/hadith_details_screen/widgets/arrow_widget.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';

import '../../../core/assets_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel model =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
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
          title: const Text(
            'Islamy',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          model.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 28,
                          endIndent: 28,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 28,
                          ),
                          child: Text(
                            model.content,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (model.index != 0)
                        ArrowWidget(
                          icon: Icons.arrow_back_ios_outlined,
                          index: model.index,
                          ahaditList: model.ahadithList,
                          next: false,
                        ),
                      const SizedBox(
                        width: 40,
                      ),
                      if (model.index != 49)
                        ArrowWidget(
                          icon: Icons.arrow_forward_ios_outlined,
                          index: model.index,
                          ahaditList: model.ahadithList,
                          next: true,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

