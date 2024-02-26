import 'package:coody/core/models/users_addrees.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class AddreesContainer extends StatelessWidget {
  AddreesContainer({super.key, required this.user});
  UserAddressc user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xffF0F5FA),
      ),
      child: Row(children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: Image.asset(user.labelas == 0
                  ? 'assets/home.png'
                  : user.labelas == 1
                      ? 'assets/work.png'
                      : 'assets/maps.png'),
            )
          ],
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth - 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.labelas == 0
                        ? 'Home'
                        : user.labelas == 1
                            ? 'Work'
                            : 'Other',
                    style: getbodyStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textbload),
                  ),
                ],
              ),
            ),
            const Gap(15),
            SizedBox(
              width: 250,
              child: Text(
                user.address,
                softWrap: true,
                maxLines: 2,
                style: getbodyStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: const Color(0xff32343E)),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
