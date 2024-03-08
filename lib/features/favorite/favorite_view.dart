import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => FavoriteViewState();
}

class FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars(
        context: context,
        isback: true,
        titte: Text(
          'My Favorite',
          style: getappbartextStyle(),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Favorite')
              .where('UserID',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<favirite>? listprodcte = [];

            snapshot.data?.docs.forEach((element) {
              listprodcte.add(favirite.fromJson(element));
            });
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: SizeConfig.childAspectRatio,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      children: listprodcte
                          .map((e) => BurgercomponentItemWidget(docm: e.docm))
                          .toList(),
                    )));
          }),
    );
  }
}

class favirite {
  String userid, prodcteid;
  final DocumentReference docm;
  favirite({required this.docm, required this.prodcteid, required this.userid});
  factory favirite.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return favirite(
        docm: json["Prodcte"],
        prodcteid: json["ProdcteID"],
        userid: json["UserID"]);
  }
}
