import 'package:flutter/material.dart';

class NavLibraryPage extends StatefulWidget {
  const NavLibraryPage({super.key});

  @override
  State<NavLibraryPage> createState() => _NavLibraryPageState();
}

class _NavLibraryPageState extends State<NavLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      width: double.infinity,
      child: Center(child: Text("Hello NavLibraryPage")),
    );
  }
}
