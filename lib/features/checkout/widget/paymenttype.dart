import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OptionType extends StatefulWidget {
  const OptionType(
      {super.key,
      required this.selectitem,
      required this.name,
      required this.url});
  final bool selectitem;
  final String name, url;
  @override
  State<OptionType> createState() => _OptionTypeState();
}

class _OptionTypeState extends State<OptionType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 72,
          decoration: BoxDecoration(
              color: const Color(0xffF0F5FA),
              border: widget.selectitem
                  ? Border.all(color: AppColors.colorprimer, width: 3)
                  : null,
              borderRadius: BorderRadius.circular(20)),
          child: Center(child: Image.asset(widget.url)),
        ),
        const Gap(10),
        Text(
          widget.name,
          style: getbodyStyle(),
        )
      ],
    );
  }
}
