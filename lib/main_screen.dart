import 'package:aeon/ai_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() => [
    AIMainScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset("assets/icons/Lines.svg"),
      inactiveIcon: SvgPicture.asset("assets/icons/Lines_white.svg"),
      title: "Lines",
      inactiveColorPrimary: Color(0xFFFFFFFF).withValues(alpha: 50),
      activeColorSecondary: Color(0xFFFF7950),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset("assets/icons/Props.svg"),
      inactiveIcon: SvgPicture.asset("assets/icons/Props_white.svg"),
      title: "Props",
      inactiveColorPrimary: Color(0xFFFFFFFF).withValues(alpha: 50),
      activeColorSecondary: Color(0xFFFF7950),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset("assets/icons/Surebet.svg"),
      inactiveIcon: SvgPicture.asset("assets/icons/Surebet_white.svg"),
      title: "SureBet",
      inactiveColorPrimary: Color(0xFFFFFFFF).withValues(alpha: 50),
      activeColorSecondary: Color(0xFFFF7950),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset("assets/icons/EV.svg"),
      inactiveIcon: SvgPicture.asset("assets/icons/EV_white.svg"),
      title: "EV+",
      inactiveColorPrimary: Color(0xFFFFFFFF).withValues(alpha: 50),
      activeColorSecondary: Color(0xFFFF7950),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset("assets/icons/Bets.svg"),
      inactiveIcon: SvgPicture.asset("assets/icons/Bets_white.svg"),
      title: "Bets",
      inactiveColorPrimary: Color(0xFFFFFFFF).withValues(alpha: 50),
      activeColorSecondary: Color(0xFFFF7950),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Color(0xFF161519),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        navBarStyle: NavBarStyle.simple,
      ),
    );
  }
}
