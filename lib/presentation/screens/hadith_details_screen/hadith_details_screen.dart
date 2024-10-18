import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/presentation/screens/hadith_details_screen/widgets/arrow_widget.dart';
import 'package:islami_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manager.dart';
import '../../../providers/themeing_provider.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeingProvider provider = Provider.of(context);

    HadithModel model =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
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
          title: const Text(
            'Islamy',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color:
                            provider.isDark ? Colors.transparent : Colors.black,
                        width: 4,
                      ),
                    ),
                    child: Card(
                      margin: const EdgeInsets.all(0),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }
}
