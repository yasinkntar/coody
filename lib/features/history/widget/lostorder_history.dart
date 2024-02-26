import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/features/history/widget/item_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOrderHistory extends StatefulWidget {
  const ListOrderHistory({super.key});

  @override
  State<ListOrderHistory> createState() => _ListOrderHistoryState();
}

class _ListOrderHistoryState extends State<ListOrderHistory> {
  User? user;

  String? UserID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;

    UserID = user?.uid;
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
            .where('status', whereIn: [3, 4, 5])
            .where('UserID', isEqualTo: UserID)
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
                  ontap: () {
                    reorder(snapshot.data!.docs[index].data());
                  },
                  outline: () {},
                  buttontext: 'Re-Order',
                  outlinetext: 'Rate',
                );
              });
        });
  }

  void reorder(Map<String, dynamic> order) {
    order.update('DateOrderd', (value) => DateTime.now());
    order.update('status', (value) => 0);
    FirebaseFirestore.instance.collection('Orders').add(order);
  }
}
