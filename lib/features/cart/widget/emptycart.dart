import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/prodcte/prodcte_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class EmpatyCart extends StatelessWidget {
  const EmpatyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset('assets/emptycart.json',
              fit: BoxFit.fill, width: 200, height: 200),
          const Gap(15),
          Text(
            'Empty is Cart',
            style: getTitleStyle(color: Colors.black, fontSize: 20),
          ),
          const Gap(15),
          Buton(
            text: 'Add Prodcte',
            ontap: () {
              pushTo(context, const ProdcteView());
            },
          )
        ]),
      )),
    );
  }
}
