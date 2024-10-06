import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuraVersesWidget extends StatelessWidget {
  const SuraVersesWidget({super.key, required this.verse});

  final String verse;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 4,
        ),
        child: Text(
          verse,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
