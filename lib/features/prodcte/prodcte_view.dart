import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/prodcte/widget/appbar.dart';
import 'package:coody/features/prodcte/widget/prodcte_item.dart';
import 'package:coody/features/prodcte/widget/prodctecategory.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdcteView extends StatefulWidget {
  const ProdcteView({super.key});

  @override
  State<ProdcteView> createState() => _ProdcteViewState();
}

class _ProdcteViewState extends State<ProdcteView> {
  // List<Map<String, Widget>> listprodcte = [
  //   {"Trending": const ProdcteItemV()},
  //   {"Trending": const ProdcteItemV()},
  //   {"Trending": const ProdcteItemV()},
  //   {"Trending": const ProdcteItemV()},
  //   {"Trending": const ProdcteItemV()},
  // ];
  // List<Widget> listcontrol = const [
  //   ProdcteItemV(),
  //   ProdcteItemV(),
  //   ProdcteItemV(),
  //   ProdcteItemV(),
  //   ProdcteItemV(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarTabeed(
        context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('categories')
                      .where('visble', isEqualTo: true)
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

                    return Column(
                      children: snapshot.data!.docs
                          .map((e) => ProdcteOfCatgory(
                                name: e["name"],
                                uid: e.id,
                              ))
                          .toList(),
                    );
                  }))),
    );
  }
}
