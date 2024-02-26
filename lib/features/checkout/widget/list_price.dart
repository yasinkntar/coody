import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListPrice extends StatefulWidget {
  const ListPrice(
      {super.key,
      this.fontWeight = FontWeight.normal,
      required this.name,
      required this.value,
      this.color});
  final String name;
  final double value;
  final Color? color;
  final FontWeight fontWeight;
  @override
  State<ListPrice> createState() => _ListPriceState();
}

class _ListPriceState extends State<ListPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.name,
              style: getbodyStyle(
                  fontWeight: widget.fontWeight,
                  color: widget.color ?? Colors.black),
            ),
            Text('${widget.value.toStringAsFixed(2)} EG',
                style: getbodyStyle(fontWeight: widget.fontWeight)),
          ],
        ),
      ],
    );
  }
}
