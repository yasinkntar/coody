import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte/prodcte_view.dart';
import 'package:coody/features/prodcte_detile/prodcte_detiles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

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
        
            listprodcte.add(Prodcte.fromJson(element));
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
                  height: 200,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemCount: listprodcte.length,
                    itemBuilder: (context, index) {
                      return GridAnimatorWidget(
                        child: GestureDetector(
                          onTap: () {
                            pushTo(
                                context,
                                ProdcteDetiles(
                                  uidpodcte: snapshot.data!.docs[index].id,
                                ));
                          },
                          child: BurgercomponentItemWidget(
                              prodcte: listprodcte[index]),
                        ),
                      );
                    },
                  ))
            ],
          );
        });
  }
}
