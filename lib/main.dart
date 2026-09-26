import 'package:clone_spotify_sep_2026/screens/login/splash_page.dart';
import 'package:flutter/material.dart';

import 'screens/home/route.page.dart';
import 'screens/login/signin_page.dart';
import 'screens/login/signup_page.dart';
import 'test_theme/test_bottomsheet.dart';
import 'test_theme/test_button.dart';
import 'test_theme/test_formfield.dart';
import 'test_theme/test_showdialog.dart';
import 'test_theme/test_text.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: RoutePage(),
    );
  }
}
