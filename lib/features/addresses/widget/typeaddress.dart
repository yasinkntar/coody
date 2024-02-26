import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TypeAddress extends StatefulWidget {
  TypeAddress({super.key, required this.isSelect, required this.name});
  bool isSelect;
  String name;
  @override
  State<TypeAddress> createState() => _TypeAddressState();
}

class _TypeAddressState extends State<TypeAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.5),
          color: widget.isSelect
              ? AppColors.selectitem1
              : const Color(0xffF0F5FA)),
      child: Center(
          child: Text(
        widget.name,
        style: getbodyStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: widget.isSelect ? AppColors.white : AppColors.textbload),
      )),
    );
  }
  // }
}
