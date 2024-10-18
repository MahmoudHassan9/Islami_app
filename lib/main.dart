import 'package:flutter/cupertino.dart';
import 'package:islami_app/providers/loclization_provider.dart';
import 'package:islami_app/providers/themeing_provider.dart';
import 'package:provider/provider.dart';

import 'my_app/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeingProvider()..getTheme(),
          child: const MyApp(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoclizationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
