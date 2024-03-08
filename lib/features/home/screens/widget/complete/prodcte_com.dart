import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte/prodcte_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdcteComplete extends StatefulWidget {
  const ProdcteComplete({super.key});

  @override
  State<ProdcteComplete> createState() => _ProdcteCompleteState();
}

class _ProdcteCompleteState extends State<ProdcteComplete> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Prodcte').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Gap(10);
          }
          List<Prodcte>? listprodcte = [];

          snapshot.data?.docs.forEach((element) {
            listprodcte.add(Prodcte.fromJson(element,element.id));
          });
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending',
                      style: getbodyStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titlecolor)),
                  InkWell(
                    onTap: () {
                      pushTo(context, const ProdcteView());
                    },
                    child: Row(
                      children: [
                        Text('See All',
                            style: getbodyStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titlecolor)),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  )
                ],
              ),
              const Gap(15),

              SizedBox(
                height: SizeConfig.screenHeight * 0.35,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: SizeConfig.childAspectRatio,
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  children: listprodcte
                      .map((e) => Prodcteitem(
                            prodcte: e,
                          ))
                      .toList(),
                ),
              )

              // SizedBox(
              //     height: SizeConfig.screenHeight * 0.36,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       // separatorBuilder: (context, index) => const Gap(10),
              //       itemCount: listprodcte.length,
              //       itemBuilder: (context, index) => GridAnimatorWidget(
              //         child: GestureDetector(
              //           onTap: () {
              //             pushTo(
              //                 context,
              //                 ProdcteDetiles(
              //                   uidpodcte: snapshot.data!.docs[index].id,
              //                 ));
              //           },
              //           child: Prodcteitem(prodcte: listprodcte[index]),
              //         ),
              //       ),
              //     )),
              // const Gap(40),
            ],
          );
        });
  }
}
