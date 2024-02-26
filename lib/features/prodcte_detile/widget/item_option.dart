import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemOption extends StatefulWidget {
  ItemOption({super.key, required this.lsit});
  List<Widget> lsit;
  @override
  State<ItemOption> createState() => _ItemOptionState();
}

class _ItemOptionState extends State<ItemOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.lsit,
    );
  }
}
