import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ItemCat extends StatefulWidget {
  ItemCat(
      {super.key,
      required this.icons,
      required this.text,
      required this.fontWeight});
  IconData icons;
  String text;
  FontWeight fontWeight;
  @override
  State<ItemCat> createState() => _ItemCatState();
}

class _ItemCatState extends State<ItemCat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icons,
          color: AppColors.colorprimer,
        ),
        const Gap(5),
        Text(
          widget.text,
          style: getbodyStyle(fontSize: 16, fontWeight: widget.fontWeight),
        ),
        const Gap(20)
      ],
    );
  }
}
