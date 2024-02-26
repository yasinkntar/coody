import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';

showFilterDialog(context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: const Color(0xff273F55).withOpacity(0.65),
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: SizeConfig.screenHeight * 0.80,
          width: SizeConfig.screenWidth * 0.92,
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(.25))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter your search',
                    style: getbodyStyle(
                        fontSize: 17, color: const Color(0xff181C2E)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 45,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color(0xffECF0F4), shape: BoxShape.circle),
                      child: const Icon(Icons.close),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      );
    },
  );
}
