import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarcard extends StatelessWidget {
  const AppBarcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        width: double.infinity,
        height: 49,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 45,
                height: 49,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/back.png',
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 2),
                height: 49,
                child: Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: GoogleFonts.sen().fontFamily,
                        fontWeight: FontWeight.normal),
                  ),
                )),
            const Spacer(),
            // InkWell(
            //   onTap: () {
            //     pushTo(context, CartScreen());
            //   },
            //   child: Container(
            //     // margin: EdgeInsets.symmetric(horizontal: 10),
            //     width: 45,
            //     height: 49,
            //     decoration: const BoxDecoration(
            //         color: Color(0xff181C2E), shape: BoxShape.circle),
            //     child: Image.asset(
            //       'assets/cart.png',
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
