
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/prodcte/widget/appbar.dart';
import 'package:coody/features/prodcte/widget/prodcte_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdcteView extends StatefulWidget {
  const ProdcteView({super.key});

  @override
  State<ProdcteView> createState() => _ProdcteViewState();
}

class _ProdcteViewState extends State<ProdcteView> {
 
  List<Widget> listcontrol = const [
    ProdcteItemV(),
    ProdcteItemV(),
    ProdcteItemV(),
    ProdcteItemV(),
    ProdcteItemV(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appBarTabeed(context,),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0xffefe6e1),
                  offset: Offset(0, 3),
                  blurRadius: 2,
                ),
              ]),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'Trending',
                      style: getTitleStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                const Gap(20),
                ...listcontrol.map((e) => const ProdcteItemV()).toList()
              ]),
            ),
            Container(
              height: 15,
              width: double.infinity,
              color: const Color(0xffD0D9E1),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0xffefe6e1),
                  offset: Offset(0, 3),
                  blurRadius: 2,
                ),
              ]),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'Trending',
                      style: getTitleStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                const Gap(20),
                ...listcontrol.map((e) => const ProdcteItemV()).toList()
              ]),
            )
          ],
        ),
      )),
    );
  }
}
