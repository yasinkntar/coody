import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class AppBarCustome extends StatelessWidget {
  AppBarCustome(
      {super.key,
      this.isback = false,
      this.ontap,
      this.titte,
      this.isdacekbak = false,
      this.actioniamage,
      this.ontapAction});
  bool isback, isdacekbak;
  void Function()? ontap;
  Widget? titte;
  String? actioniamage;

  void Function()? ontapAction;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        width: double.infinity,
        height: 49,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (isback) {
                  Navigator.pop(context);
                }
                if (ontap != null) {
                  ontap!();
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
                child: Image.asset(
                    isback ? 'assets/back.png' : "assets/menu.png",
                    color: isdacekbak
                        ? const Color(0xffECF0F4)
                        : const Color(0xff212029)),
              ),
            ),
            titte != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    height: 49,
                    child: titte)
                : const Gap(1),
            const Spacer(),
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
                        actioniamage!,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ));
  }
}
