import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:coody/core/utils/colors.dart';

class TabBarsItem extends StatefulWidget {
  const TabBarsItem({super.key, required this.text, required this.isselecte});
  final String text;
  final bool isselecte;
  @override
  State<TabBarsItem> createState() => _TabBarsItemState();
}

class _TabBarsItemState extends State<TabBarsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            widget.text,
            style: getbodyStyle(
                color: widget.isselecte
                    ? AppColors.colorprimer
                    : const Color(0xffA5A7B9)),
          ),
        ),
      ),
    );
  }
}
