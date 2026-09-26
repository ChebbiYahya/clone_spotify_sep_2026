import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../utils/constants/colors.dart';
import 'nav_pages/nav_add_page.dart';
import 'nav_pages/nav_home_page.dart';
import 'nav_pages/nav_library_page.dart';
import 'nav_pages/nav_profile_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    NavHomePage(),
    NavAddPage(),
    NavLibraryPage(),
    NavProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    bool isLight = brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset("assets/images/logo-spotify.svg", height: 30),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            gap: 10,
            padding: EdgeInsets.all(12),
            activeColor: TColors.primary,
            duration: Duration(milliseconds: 600),
            color: isLight ? TColors.secondary : TColors.white,
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            tabs: [
              GButton(icon: Icons.home_rounded, text: "Home"),
              GButton(icon: Icons.add, text: "Add"),
              GButton(icon: Icons.library_music_outlined, text: "Library"),
              GButton(icon: Icons.person_outline_rounded, text: "Profile"),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
