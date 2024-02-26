import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteProdcteWidget extends StatefulWidget {
  const FavoriteProdcteWidget(
      {super.key, required this.prodcteid});
  final String prodcteid;
  @override
  State<FavoriteProdcteWidget> createState() => _FavoriteProdcteWidgetState();
}

class _FavoriteProdcteWidgetState extends State<FavoriteProdcteWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Favorite')
            .where('ProdcteID', isEqualTo: widget.prodcteid)
            .where('UserID', isEqualTo:  FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            isFavorite = false;
          } else {
            isFavorite = true;
          }
          return InkWell(
            onTap: () {
              if (isFavorite) {
                FirebaseFirestore.instance
                    .collection('Favorite')
                    .doc(snapshot.data!.docs.first.id)
                    .delete();
              } else {
                FirebaseFirestore.instance.collection('Favorite').doc().set(
                    {"UserID": FirebaseAuth.instance.currentUser!.uid, "ProdcteID": widget.prodcteid});
              }
            },
            child: Container(
                width: 45,
                height: 49,
                decoration: const BoxDecoration(
                    color: Color(0xffECF0F4), shape: BoxShape.circle),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: AppColors.colorprimer,
                )),
          );
        });
  }
}
