import 'package:coody/core/functions/routing.dart';
import 'package:coody/features/drawer/menu_screen.dart';
import 'package:coody/features/drawer/model/menu_item.dart';
import 'package:coody/features/favorite/favorite_view.dart';
import 'package:coody/features/history/hisotryorder_view.dart';
import 'package:coody/features/home/screens/home_view.dart';
import 'package:coody/features/prodcte/prodcte_view.dart';
import 'package:coody/features/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  MenuItem currentItem = MenuItems.explorymune;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuBackgroundColor: const Color(0xff121223),
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
            pushTo(context, getscreen(item));
          },
          currentItem: currentItem,
        );
      }),
      mainScreen: const HomeView(),
      menuScreenWidth: 500,
      style: DrawerStyle.defaultStyle,
      borderRadius: 24.0,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      angle: -0,
      duration: const Duration(microseconds: 500),
      isRtl: false,
    );
  }

  Widget getscreen(MenuItem item) {
    switch (item) {
      case MenuItems.explorymune:
        return const ProdcteView();
      case MenuItems.offers:
        return const FavoriteView();
      case MenuItems.orderhistory:
        return const HistoryOrderView();
      case MenuItems.setting:
        return const Settings();
      case MenuItems.trackorder:
        return const HistoryOrderView();
      default:
        return const HomeView();
    }
  }
}
