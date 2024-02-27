import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte_detile/prodcte_detiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

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
      body: StreamBuilder<Object>(
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
           
            CollectionReference itemsRef = FirebaseFirestore.instance.collection("items");
            // Query query = itemsRef.("postedBy", user_id);
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GridAnimatorWidget(
                          child: GestureDetector(
                              onTap: () {
                                // pushTo(
                                //     context,
                                //     ProdcteDetiles(
                                //       // uidpodcte: snapshot.data!.docs[index].id,
                                //     ));
                              },
                              child: Center()

                              //  BurgercomponentItemWidget(
                              //     prodcte: ),
                              ),
                        );
                      },
                    )));
          }),
    );
  }
}
