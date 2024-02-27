import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte/widget/appbar.dart';
import 'package:coody/features/prodcte/widget/dilogfilter.dart';
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
          child: Column(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: 189,
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Text(
                          'Thyme Manoucheh Manoucheh',
                          softWrap: true,
                          maxLines: 2,
                          style: getbodyStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(5),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'A delicious piece of grilled halal beef without any additives or preservatives, with a little salt and pepper and topped with pickles, fresh onions, ketchup and mustard. You have nothing but the original.',
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: getsmallStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffA0A5BA)),
                        ),
                      ),
                      const Spacer(),
                      Text('EG 150',
                          style: getbodyStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ],
                  ),
                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(image: NetworkImage()),
                        color: const Color(0xffD0D9E1)),
                  ),
                ]),
          ),
          const Divider()
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: SizeConfig.screenWidth * 0.1,
          //       height: AppBar().preferredSize.height,
          //       child: IconButton(
          //           onPressed: () {},
          //           icon: Image.asset(
          //             "assets/menu.png",
          //           )),
          //     ),
          //     SizedBox(
          //         width: SizeConfig.screenWidth * 0.8,
          //         height: AppBar().preferredSize.height,
          //         child: ListView.builder(
          //             itemCount: 50,
          //             scrollDirection: Axis.horizontal,
          //             itemBuilder: (context, index) => TabBarsItem()))
          //   ],
          // )
          // AppBarCustome(
          //   onChanged: (p0) {
          //     setState(() {
          //       valuecatgory = p0!;
          //     });
          //   },
          // ),
          // const Gap(20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       valuecatgory != "All" ? 'ALL $valuecatgory' : "ALL",
          //       style: GoogleFonts.sen().copyWith(
          //         fontSize: 20,
          //         color: const Color(0xff31343d),
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ],
          // ),
          // const Gap(20),
          // Expanded(
          //     child: StreamBuilder(
          //         stream: FirebaseFirestore.instance
          //             .collection('Prodcte')
          //             .snapshots(),
          //         builder: (context, snapshot) {
          //           if (!snapshot.hasData) {
          //             return const CircularProgressIndicator();
          //           } else {
          //             List<Prodcte>? listprodcte = [];
          //             List<Prodcte>? listprodcteview = [];
          //             snapshot.data?.docs.forEach((element) {
          //               listprodcte.add(Prodcte.fromJson(element));
          //             });
          //             listprodcteview = valuecatgory == "All"
          //                 ? listprodcte
          //                 : listprodcte
          //                     .where((element) =>
          //                         element.catgory == valuecatgory)
          //                     .toList();
          //             return GridView.builder(
          //               gridDelegate:
          //                   const SliverGridDelegateWithFixedCrossAxisCount(
          //                       mainAxisSpacing: 10,
          //                       crossAxisSpacing: 10,
          //                       crossAxisCount: 2),
          //               itemCount: listprodcteview.length,
          //               itemBuilder: (context, index) {
          //                 return GridAnimatorWidget(
          //                   child: BurgercomponentItemWidget(
          //                       prodcte: listprodcteview![index]),
          //                 );
          //               },
          //             );
          //           }
          //         }))
        ],
      )),
    );
  }
}
