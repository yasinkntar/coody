import 'package:coody/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gap/gap.dart';

PreferredSizeWidget appBars(
    {required BuildContext context,
    bool isback = true,
    bool isdacekbak = false,
    String? actioniamage,
    Widget? titte,
    Color imagecolor = AppColors.buttoncolor,
    Color color = Colors.white,
    Function()? ontap,
    Function()? ontapAction}) {
  return AppBar(
    backgroundColor: color,
    leadingWidth: 60,
    leading: Container(
      margin: const EdgeInsets.only(top: 5, left: 15),
      width: double.infinity,
      height: 49,
      child: Row(children: [
        InkWell(
          onTap: () {
            if (isback) {
              Navigator.pop(context);
            } else {
              if (ZoomDrawer.of(context)!.isOpen()) {
                ZoomDrawer.of(context)!.close();
              } else {
                ZoomDrawer.of(context)!.open();
              }
            }
          },
          child: Container(
            width: 45,
            height: 49,
            decoration: BoxDecoration(
                color: isdacekbak
                    ? const Color(0xff212029)
                    : const Color(0xffECF0F4),
                shape: BoxShape.circle),
            child: Image.asset(isback ? 'assets/back.png' : "assets/menu.png",
                color: isdacekbak
                    ? const Color(0xffECF0F4)
                    : const Color(0xff212029)),
          ),
        ),
      ]),
    ),
    title: titte ?? const SizedBox(),
    centerTitle: false,
    actions: [
      actioniamage == null
          ? const Gap(1)
          : InkWell(
              onTap: () {
                ontapAction!();
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                width: 45,
                height: 49,
                decoration:
                    BoxDecoration(color: imagecolor, shape: BoxShape.circle),
                child: Image.asset(
                  actioniamage,
                  color: Colors.white,
                ),
              ),
            ),
      const Gap(15)
    ],
  );
}
