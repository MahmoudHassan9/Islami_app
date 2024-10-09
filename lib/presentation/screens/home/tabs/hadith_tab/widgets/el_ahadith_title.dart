import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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