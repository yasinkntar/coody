import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/features/history/widget/item_order.dart';
import 'package:coody/features/tackorder/taceorder_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOrderOngoing extends StatefulWidget {
  const ListOrderOngoing({super.key});

  @override
  State<ListOrderOngoing> createState() => _ListOrderOngoingState();
}

class _ListOrderOngoingState extends State<ListOrderOngoing> {
  User? user;

  String? userID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;

    userID = user?.uid;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('status', whereIn: [0, 1, 2])
            .where('userID', isEqualTo: userID)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 75,
                    ),
                    Text('There are no Order')
                  ]),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return ItemOrder(
                  data: snapshot.data?.docs[index],
                  uid: snapshot.data!.docs[index].id,
                  outline: () {
                    FirebaseFirestore.instance
                        .collection('Orders')
                        .doc(snapshot.data!.docs[index].id)
                        .set({
                      'status': 5,
                    }, SetOptions(merge: true));
                  },
                  ontap: () {
                    pushTo(context,
                        TackOrderView(uid: snapshot.data!.docs[index].id));
                  },
                  buttontext: 'Track Order',
                  outlinetext: 'Cancel',
                );
              });
        });
  }
}
