import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ItemProdcte extends StatefulWidget {
//   const ItemProdcte({super.key});

//   @override
//   State<ItemProdcte> createState() => _ItemProdcteState();
// }

// class _ItemProdcteState extends State<ItemProdcte> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 210,
//       width: 200,
//       child: Stack(children: [
//         Positioned(
//           top: 210,
//           left: 0,
//           bottom: 0,
//           child: Align(
//             child: Container(
//               width: 200,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: const Color(0xffffffff),
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color(0xadd7dae0),
//                     offset: Offset(1, 12),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           // smokinburgeruAV (38:1130)
//           left: 12,
//           bottom: 88,
//           child: Align(
//             child: SizedBox(
//               height: 19,
//               child: Text(
//                 'SMOKIN\' BURGER',
//                 style: GoogleFonts.sen().copyWith(
//                   fontSize: 15,
//                   color: const Color(0xff31343d),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           // YjF (38:1131)
//           left: 13,
//           bottom: 30,
//           child: Align(
//             child: SizedBox(
//               height: 20,
//               child: Text(
//                 '\$60',
//                 textAlign: TextAlign.right,
//                 style: GoogleFonts.sen().copyWith(
//                   fontSize: 16,
//                   color: const Color(0xff31343d),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           // cafeniorestaurantpwf (38:1132)
//           left: 12,
//           bottom: 65,
//           child: Align(
//             child: SizedBox(
//               width: 119,
//               height: 16,
//               child: Text(
//                 'CAFENIO RESTAURANT',
//                 style: GoogleFonts.sen().copyWith(
//                   fontSize: 13,
//                   color: const Color(0xff31343d),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           // imageqwK (602:10)
//           left: 17,
//           right: 17,
//           top: 0,
//           child: Align(
//             child: SizedBox(
//               width: 122,
//               height: 84,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   // color: Color(0xff98a8b8),
//                   image: const DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                       'https://firebasestorage.googleapis.com/v0/b/foody-b6e39.appspot.com/o/pngtree-fast-food-big-ham-burger-png-image_6244235.png?alt=media&token=c28ab7ee-7898-4d3f-b64a-e061072de409',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           // group25138mK (38:1149)
//           right: 15,
//           bottom: 15,
//           child: Align(
//               child: Container(
//             width: 30,
//             height: 30,
//             decoration: const BoxDecoration(
//                 color: Color(0xffF58D1D), shape: BoxShape.circle),
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           )),
//         ),
//       ]),
//     );
//   }
// }
class Prodcteitem extends StatelessWidget {
  const Prodcteitem({super.key, required this.prodcte});
  final Prodcte prodcte;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xadd7dae0),
              offset: Offset(1, 12),
              blurRadius: 10,
            ),
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 125,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(prodcte.urlimage), fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Gap(6),
              Text(
                prodcte.fullname,
                style: getbodyStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              // const Gap(2),
              Text(
                prodcte.catgory,
                style: getbodyStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textnorlma),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 4,
                    ),
                    child: Text(
                      '${prodcte.price} EG',
                      style: getbodyStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.colorprimer, shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

// ignore: must_be_immutable
class BurgercomponentItemWidget extends StatelessWidget {
  BurgercomponentItemWidget({Key? key, required this.prodcte})
      : super(
          key: key,
        );
  Prodcte prodcte;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xadd7dae0),
                offset: Offset(1, 12),
                blurRadius: 10,
              ),
            ]),
        child: SizedBox(
          height: 190,
          width: 153,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 130,
                    width: 153,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          prodcte.urlimage,
                          height: 79,
                          width: 153,
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        prodcte.fullname,
                        style: getbodyStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const Gap(6),
                      Text(
                        prodcte.catgory,
                        style: getbodyStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: AppColors.textnorlma),
                      ),
                      const Gap(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 4,
                            ),
                            child: Text(
                              '${prodcte.price} EG',
                              style: getbodyStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.colorprimer,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
