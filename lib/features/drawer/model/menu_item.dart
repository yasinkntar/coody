import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuItems {
  static const trackorder = MenuItem('Track Order', Icons.track_changes);
  static const orderhistory = MenuItem('Order History', Icons.list_alt);
  static const offers = MenuItem('Offers', Icons.book);
  static const explorymune =
      MenuItem('Explore Menu', Icons.restaurant_menu);
  static const setting = MenuItem('Setting', Icons.settings);

  static const all = <MenuItem>[
    trackorder,
    orderhistory,
    offers,
    explorymune,
    setting,
  ];
}
