import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarWidget extends StatefulWidget {
  BarWidget({super.key, required this.lsit});

  List<Widget> lsit;
  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffF6F8FA),
          borderRadius: BorderRadius.circular(16)),
      child: Column(children: widget.lsit),
    );
  }
}
