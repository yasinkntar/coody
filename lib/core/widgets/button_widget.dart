import 'package:coody/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Buton extends StatefulWidget {
  Buton({super.key, required this.text, this.ontap, this.hidget = 62});
  String text;
  Function()? ontap;
  double hidget;
  @override
  State<Buton> createState() => _ButonState();
}

class _ButonState extends State<Buton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: SizeConfig.screenWidth,
        height: widget.hidget,
        decoration: BoxDecoration(
          color: const Color(0xffff7622),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.sen().copyWith(
                fontSize: 14,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
