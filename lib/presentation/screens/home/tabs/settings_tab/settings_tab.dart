import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/loclization_provider.dart';
import 'package:islami_app/providers/themeing_provider.dart';
import 'package:provider/provider.dart';

class SetingsTab extends StatefulWidget {
  const SetingsTab({super.key});

  @override
  State<SetingsTab> createState() => _SetingsTabState();
}

class _SetingsTabState extends State<SetingsTab> {
  @override
  Widget build(BuildContext context) {
    ThemeingProvider themeingProvider = Provider.of(context);
    LoclizationProvider loclizationProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildSettingWidget(
            widget: SwitchListTile(
              title: Text(
                AppLocalizations.of(context)!.darkTheme,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
              activeColor: Theme.of(context).primaryColor,
              inactiveThumbColor: Colors.black.withOpacity(0.4),
              inactiveTrackColor: Colors.grey.withOpacity(0.4),
              trackOutlineColor: const WidgetStatePropertyAll(
                Colors.transparent,
              ),
              value: themeingProvider.isDark,
              onChanged: (val) => themeingProvider.changeTheme(val),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildSettingWidget(
            paddingVertical: 8,
            widget: ListTile(
              leading: Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
              trailing: DropdownButton<String>(
                underline: Container(),
                iconEnabledColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Theme.of(context).primaryColor,
                value: loclizationProvider.languageCode,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      'عربي',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
                onChanged: (value) {
                  loclizationProvider.changeLanguage(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSettingWidget extends StatelessWidget {
  const BuildSettingWidget(
      {super.key,
      required this.widget,
      this.paddingVertical,
      this.paddinghorizontal});

  final Widget widget;
  final double? paddingVertical;
  final double? paddinghorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical ?? 0,
        horizontal: paddinghorizontal ?? 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      child: widget,
    );
  }
}
