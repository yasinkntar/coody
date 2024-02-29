// ignore: file_names
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/prodcte_detile/models/option_menu.dart';
import 'package:coody/features/prodcte_detile/widget/item_option.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChoiceItem extends StatefulWidget {
  const ChoiceItem(
      {super.key,
      required this.onSelectedItem,
      required this.namechoice,
      required this.list,
      required this.ismandatory});
  final ValueChanged<OptionItem> onSelectedItem;
  final String namechoice;
  final bool ismandatory;
  final List<Widget> list;

  @override
  State<ChoiceItem> createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffefe6e1),
              offset: Offset(0, 3),
              blurRadius: 2,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.namechoice,
                style: getbodyStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.colorprimer),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.ismandatory ? 'Mandatory' : 'Option',
                    style: getbodyStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          const Gap(10),
          ItemOption(
            lsit: widget.list,
          ),
          
        ],
      ),
    );
  }
}
