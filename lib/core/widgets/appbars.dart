import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

PreferredSizeWidget appBars(
    {required BuildContext context,
    bool isback = true,
    bool isdacekbak = false,
    String? actioniamage,
    Widget? titte,
    Function()? ontap,
    Function()? ontapAction}) {
  return AppBar(
    leadingWidth: 60,
    leading: Container(
      margin: const EdgeInsets.only(top: 5, left: 15),
      width: double.infinity,
      height: 49,
      child: Row(children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
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
    title: titte ?? const Gap(1),
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
                decoration: const BoxDecoration(
                    color: Color(0xff181C2E), shape: BoxShape.circle),
                child: Image.asset(
                  actioniamage,
                  color: Colors.white,
                ),
              ),
            ),
    ],
  );
}
