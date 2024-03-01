import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/prodcte/widget/prodcte_item.dart';
import 'package:coody/features/prodcte_detile/prodcte_detiles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdcteOfCatgory extends StatefulWidget {
  const ProdcteOfCatgory({super.key, required this.name, required this.uid});
  final String name, uid;
  @override
  State<ProdcteOfCatgory> createState() => _ProdcteOfCatgoryState();
}

class _ProdcteOfCatgoryState extends State<ProdcteOfCatgory> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  widget.name,
                  style: getTitleStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            const Gap(20),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Prodcte')
                    .where('catgory', isEqualTo: widget.uid)
                    .snapshots(),
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
                    listprodcte.add(Prodcte.fromJson(element, element.id));
                  });
                  return Column(
                      children: listprodcte
                          .map((e) => GestureDetector(
                                onTap: () => pushTo(
                                    context,
                                    ProdcteDetiles(
                                      uidpodcte: e.uid,
                                    )),
                                child: ProdcteItemV(
                                  prodcte: e,
                                ),
                              ))
                          .toList());
                }),

            // ...listcontrol.map((e) => const ProdcteItemV()).toList()
          ]),
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: const Color(0xffD0D9E1),
        ),
      ],
    );
  }
}
