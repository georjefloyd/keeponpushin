import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/settings_screen.dart';
import 'src/screens/profile_screen.dart';
import 'src/theme/app_theme.dart';

final class IOSPlaceholderApp extends StatelessWidget {
  const IOSPlaceholderApp({super.key});

  @override
  Widget build(BuildContext context) => CupertinoApp(
    debugShowCheckedModeBanner: false,
    theme: CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: AppTheme.primaryColor,
      barBackgroundColor: CupertinoColors.systemBackground.resolveFrom(
        context,
      ),
      textTheme: const CupertinoTextThemeData(
        primaryColor: AppTheme.textPrimary,
      ),
    ),
    home: const _RootTabBar(),
  );
}

final class _RootTabBar extends StatefulWidget {
  const _RootTabBar();

  @override
  State<_RootTabBar> createState() => _RootTabBarState();
}

class _RootTabBarState extends State<_RootTabBar> {
  int _currentTab = 0;

  static const _tabs = <Widget>[
    HomeScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      currentIndex: _currentTab,
      onTap: (i) => setState(() => _currentTab = i),
      activeColor: AppTheme.accentColor,
      inactiveColor: CupertinoColors.systemGrey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          activeIcon: Icon(CupertinoIcons.home_fill),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          activeIcon: Icon(CupertinoIcons.settings_solid),
          label: 'Настройки',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          activeIcon: Icon(CupertinoIcons.person_fill),
          label: 'Профиль',
        ),
      ],
    ),
    tabBuilder: (context, index) => CupertinoTabView(
      builder: (context) => _tabs[index],
    ),
  );
}
