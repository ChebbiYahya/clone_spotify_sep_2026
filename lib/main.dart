import 'package:clone_spotify_sep_2026/test_page.dart';
import 'package:flutter/material.dart';

import 'test_theme/test_button.dart';
import 'utils/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: TestButton(),
    );
  }
}
