import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:task/view/bottom_nav_page/explore_page.dart';
import 'package:task/view/bottom_nav_page/home_page.dart';
import 'package:task/view/bottom_nav_page/inbox_page.dart';
import 'package:task/view/bottom_nav_page/shop_page.dart';
import 'bottom_nav_page/add_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomePage(),
        ExplorePage(),
        AddPage(),
        InboxPage(),
        ShopPage(),
      ];
    }

    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        _buildPersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/Home.svg",
            height: 29,
            fit: BoxFit.fitWidth,
          ),
          label: 'Home',
          acColor: Colors.deepOrange,
        ),
        _buildPersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Discovery.svg',
            color: Colors.deepOrange,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          label: 'Explore',
          acColor: Colors.deepOrange,
        ),
        _buildPersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/icons/add.svg',
              color: Colors.white, height: 29, fit: BoxFit.fitWidth),
          acColor: Colors.black,
        ),
        _buildPersistentBottomNavBarItem(
            icon: SvgPicture.asset('assets/icons/Message.svg',
                height: 29, fit: BoxFit.fitWidth),
            label: 'Inbox',
            acColor: Colors.deepOrange),
        _buildPersistentBottomNavBarItem(
            icon: SvgPicture.asset('assets/icons/Bag3.svg',
                height: 29, fit: BoxFit.fitWidth),
            label: 'Shop',
            acColor: Colors.deepOrange),
      ];
    }

    return PersistentTabView(
      context,

      controller: _controller,
      screens: _buildScreens(),
      padding: NavBarPadding.symmetric(vertical: .8),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 43),
    );
  }

  PersistentBottomNavBarItem _buildPersistentBottomNavBarItem(
      {required SvgPicture icon,
      Color? icColor,
      String? label,
      Color? acColor}) {
    return (PersistentBottomNavBarItem(
      icon: icon,
      title: label,
      activeColorPrimary: acColor!,
      inactiveColorPrimary: Colors.grey,
    ));
  }
}
