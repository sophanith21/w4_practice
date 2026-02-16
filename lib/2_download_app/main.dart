import 'package:flutter/material.dart';

import 'ui/providers/theme_color_provider.dart';
import 'ui/screens/settings/settings_screen.dart';
import 'ui/screens/downloads/downloads_screen.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  final List<Widget> _pages = [DownloadsScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    String appBarTitle = _currentIndex == 0 ? "Downloads" : "Settings";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: ListenableBuilder(
        listenable: ThemeColorProvider.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                appBarTitle,
                style: AppTextStyles.heading.copyWith(
                  color: ThemeColorProvider.instance.currentThemeColor.color,
                ),
              ),
            ),
            backgroundColor:
                ThemeColorProvider.instance.currentThemeColor.backgroundColor,
            body: _pages[_currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor:
                  ThemeColorProvider.instance.currentThemeColor.color,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Downloads',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
