import 'package:coody/core/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';

class AppBarAuth extends StatelessWidget {
  const AppBarAuth({super.key});
  
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
                decoration: const BoxDecoration(
                    color: Color(0xffECF0F4), shape: BoxShape.circle),
                child: Image.asset('assets/back.png'),
              ),
            ),
            const Spacer(),
          ],
        ));
  }
}
