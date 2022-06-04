import 'package:flutter/material.dart';
import 'package:rescatadog/home/page.dart';

import '../chat/page.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import 'widgets/bottom_bar_item.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTab = 0;
  List barItems = [
    {
      'icon': 'assets/icons/pet-border.svg',
      'active_icon': 'assets/icons/pet.svg',
      'page': const Center(
        child: HomePage(),
      ),
      'title': ' '
    },
    {
      'icon': 'assets/icons/setting-border.svg',
      'active_icon': 'assets/icons/setting.svg',
      'page': const Center(
        child: Text('Setting Page'),
      ),
      'title': ' '
    },
    {
      'icon': 'assets/icons/pet-border.svg',
      'active_icon': 'assets/icons/pet.svg',
      'page': const ChatPage(),
      'title': ' '
    },
  ];

//====== Animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: animatedBodyMs),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== END Animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children: List.generate(
        barItems.length,
        (index) => animatedPage(barItems[index]['page']),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          barItems.length,
          (index) => BottomBarItem(
            activeTab == index
                ? barItems[index]['active_icon']
                : barItems[index]['icon'],
            '',
            isActive: activeTab == index,
            activeColor: primary,
            onTap: () {
              onPageChanged(index);
            },
          ),
        ),
      ),
    );
  }
}
