import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte/widget/appbar.dart';
import 'package:coody/features/prodcte/widget/dilogfilter.dart';
import 'package:coody/features/prodcte/widget/prodcte_item.dart';
import 'package:coody/features/prodcte/widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

class ProdcteView extends StatefulWidget {
  const ProdcteView({super.key});

  @override
  State<ProdcteView> createState() => _ProdcteViewState();
}

class _ProdcteViewState extends State<ProdcteView> {
  String valuecatgory = 'All';
  List<CategoriesModel> list = [
    CategoriesModel(selete: true, text: ' Trending', urlimage: ' urlimage'),
    CategoriesModel(selete: false, text: ' Manakish', urlimage: ' urlimage'),
    CategoriesModel(
        selete: false, text: ' Mix Manoucheh', urlimage: ' urlimage'),
    CategoriesModel(selete: false, text: ' Pizzas', urlimage: ' urlimage'),
    CategoriesModel(selete: false, text: ' Appetizers', urlimage: ' urlimage'),
    CategoriesModel(selete: false, text: ' Soupe', urlimage: ' urlimage'),
    CategoriesModel(
        selete: false, text: ' Chicken Shawema', urlimage: ' urlimage'),
    CategoriesModel(
        selete: false, text: ' Grills Sandwiches', urlimage: ' urlimage'),
  ];
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
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: const EdgeInsets.only(top: 5, left: 15),
              width: 45,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color(0xffECF0F4), shape: BoxShape.circle),
              child: Image.asset('assets/back.png'),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 45,
              height: 49,
              decoration: const BoxDecoration(
                  color: Color(0xff181C2E), shape: BoxShape.circle),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                showFilterDialog(context);
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                width: 45,
                height: 49,
                decoration: const BoxDecoration(
                    color: Color(0xffECF0F4), shape: BoxShape.circle),
                child: Image.asset('assets/mix.png'),
              ),
            ),
            const Gap(10)
          ],
          title: Text(
            'Explore Menu',
            style: getappbartextStyle(),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      // width: SizeConfig.screenWidth * 0.1,
                      height: AppBar().preferredSize.height,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/menu.png",
                          )),
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    height: 32,
                    width: 1,
                  ),
                  SizedBox(
                      width: SizeConfig.screenWidth * 0.8,
                      height: 46,
                      child: ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => TabBarsItem(
                                text: list[index].text,
                                isselecte: list[index].selete,
                              )))
                ],
              ))),
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
