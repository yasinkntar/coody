import 'package:coody/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonCart extends StatefulWidget {
  ButtonCart({super.key, required this.total, required this.ontap});
  final double total;
  Function ontap;
  @override
  State<ButtonCart> createState() => _ButtonCartState();
}

class _ButtonCartState extends State<ButtonCart> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.ontap();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: SizeConfig.screenWidth,
        height: 62,
        decoration: BoxDecoration(
          color: const Color(0xffff7622),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add To Cart',
                textAlign: TextAlign.center,
                style: GoogleFonts.sen().copyWith(
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '${widget.total} EG',
                textAlign: TextAlign.center,
                style: GoogleFonts.sen().copyWith(
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
