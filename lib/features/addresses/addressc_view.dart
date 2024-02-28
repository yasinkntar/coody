import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/users_addrees.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/addresses/add_addresc/addaddress_view.dart';
import 'package:coody/features/addresses/widget/addrees_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

class AddresscView extends StatefulWidget {
  const AddresscView({super.key});

  @override
  State<AddresscView> createState() => _AddresscViewState();
}

class _AddresscViewState extends State<AddresscView> {
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
    return Builder(builder: (context) {
      return Scaffold(
        appBar: appBars(
          context: context,
          isback: true,
          titte: Center(
              child: Text(
            'My Addressc',
            style: getappbartextStyle(),
          )),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: Buton(
            text: 'Add new address',
            ontap: () {
              pushTo(context, const AddAddresscView());
            },
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Addressc')
                .where('uuid', isEqualTo: user?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data?.size == 0) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/maps.png',
                        width: 100,
                        height: 100,
                      ),
                      const Gap(15),
                      Text(
                        'There are no addresses saved',
                        style: getbodyStyle(),
                      )
                    ],
                  ),
                );
              }
              List<UserAddressc> list = [];
              for (var element in snapshot.data!.docs) {
                list.add(UserAddressc.fromJson(element));
              }

              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: AnimatedListView(
                        // scrollDirection: Axis.horizontal,
                        duration: 250,
                        extendedSpaceBetween: 30,
                        spaceBetween: 10,
                        children: List.generate(
                            list.length,
                            (index) => GridAnimatorWidget(
                                  child: AddreesContainer(user: list[index]),
                                )),
                      ),
                    )
                  ],
                ),
              ));
            }),
      );
    });
  }
}
