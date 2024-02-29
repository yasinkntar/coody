import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/prodcte/widget/dilogfilter.dart';
import 'package:coody/features/prodcte/widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:coody/core/utils/size_config.dart';
// // ignore: must_be_immutable
// class AppBarCustome extends StatefulWidget {
//   AppBarCustome({super.key, required this.onChanged});
//   void Function(String?)? onChanged;
//   @override
//   State<AppBarCustome> createState() => _AppBarCustomeState();
// }

// class _AppBarCustomeState extends State<AppBarCustome> {
//   String dropdownValue = 'All';
//   CategoriesModel drop =
//       CategoriesModel(selete: false, text: 'text', urlimage: 'urlimage');
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(top: 5),
//         width: double.infinity,
//         height: 49,
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () => Navigator.of(context).pop(),
//               child: Container(
//                 // margin: EdgeInsets.symmetric(horizontal: 10),
//                 width: 45,
//                 height: 50,
//                 decoration: const BoxDecoration(
//                     color: Color(0xffECF0F4), shape: BoxShape.circle),
//                 child: Image.asset('assets/back.png'),
//               ),
//             ),
//             Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: StreamBuilder(
//                     stream: FirebaseFirestore.instance
//                         .collection('categories')
//                         .where('visble', isEqualTo: true)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return const Center();
//                       }

//                       List<CategoriesModel>? listcatgory = [];
//                       listcatgory.insert(
//                           0,
//                           CategoriesModel(
//                               selete: true,
//                               text: 'All',
//                               urlimage:
//                                   'https://i.ytimg.com/vi/QsCByv3Udpc/maxresdefault.jpg'));
//                       snapshot.data?.docs.forEach((element) {
//                         listcatgory.add(CategoriesModel.fromJson(element));
//                       });
//                       return Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                         height: 45,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: const Color(0xffECF0F4), width: 1),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: DropdownButton(
//                           value: dropdownValue,
//                           items: listcatgory
//                               .map((e) => DropdownMenuItem<String>(
//                                     value: e.text,
//                                     child: Text(e.text,
//                                         style: getbodyStyle(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.bold)),
//                                   ))
//                               .toList(),
//                           underline: const SizedBox(),
//                           iconEnabledColor: const Color(0xffF58D1D),
//                           borderRadius: BorderRadius.circular(10),
//                           onChanged: (newValue) {
//                             setState(() {
//                               dropdownValue = newValue!.toString();
//                               widget.onChanged!.call(newValue);
//                             });
//                           },
//                         ),
//                       );
//                     })),
//             const Spacer(),
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 10),
//                   width: 45,
//                   height: 49,
//                   decoration: const BoxDecoration(
//                       color: Color(0xff181C2E), shape: BoxShape.circle),
//                   child: const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     showFilterDialog(context);
//                   },
//                   child: Container(
//                     // margin: EdgeInsets.symmetric(horizontal: 10),
//                     width: 45,
//                     height: 49,
//                     decoration: const BoxDecoration(
//                         color: Color(0xffECF0F4), shape: BoxShape.circle),
//                     child: Image.asset('assets/mix.png'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
// }
// //
PreferredSizeWidget appBarTabeed(BuildContext context) {
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
  return AppBar(
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
          )));
}
