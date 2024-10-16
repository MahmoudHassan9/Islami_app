import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/colors_manager.dart';

class SetingsTab extends StatefulWidget {
  const SetingsTab({super.key});

  @override
  State<SetingsTab> createState() => _SetingsTabState();
}

class _SetingsTabState extends State<SetingsTab> {
  bool darkTheme = false;
  String langCode = 'en';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildSettingWidget(
            widget: SwitchListTile(
              title: Text(
                'Dark Theme',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
              activeColor: ColorsManager.mainColor,
              inactiveThumbColor: Colors.black.withOpacity(0.4),
              inactiveTrackColor: Colors.grey.withOpacity(0.4),
              trackOutlineColor: const WidgetStatePropertyAll(
                Colors.transparent,
              ),
              value: darkTheme,
              onChanged: (val) {
                darkTheme = val;
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildSettingWidget(
            paddingVertical: 8,
            widget: ListTile(
              leading: Text(
                'Language',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
              trailing: DropdownButton<String>(
                underline: Container(),
                iconEnabledColor: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: ColorsManager.mainColor,
                value: langCode,
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      'عربي',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  langCode = value ?? langCode;
                  setState(() {});
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
        border: Border.all(color: ColorsManager.mainColor, width: 2),
      ),
      child: widget,
    );
  }
}
