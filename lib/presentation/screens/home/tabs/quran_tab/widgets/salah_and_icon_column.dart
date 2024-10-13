import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalahAndIconColumn extends StatefulWidget {
  const SalahAndIconColumn({super.key, required this.text});

  final String text;

  @override
  State<SalahAndIconColumn> createState() => _SalahAndIconColumnState();
}

class _SalahAndIconColumnState extends State<SalahAndIconColumn> {
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            if (iconColor == Colors.white) {
              iconColor = Colors.black;
            } else {
              iconColor = Colors.white;
            }

            setState(() {});
          },
          icon: Icon(
            Icons.check_circle,
            color: iconColor,
          ),
        ),
        Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: iconColor),
        ),
      ],
    );
  }
}