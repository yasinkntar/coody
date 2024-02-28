import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/features/checkout/models/addresscid.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/addresses/add_addresc/addaddress_view.dart';
import 'package:coody/features/addresses/widget/addrees_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddresscCard extends StatefulWidget {
  const AddresscCard({super.key, required this.onSelectedItem});

  final ValueChanged<Addressca> onSelectedItem;
  @override
  State<AddresscCard> createState() => _AddresscCardState();
}

class _AddresscCardState extends State<AddresscCard> {
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

  Addressca? selectitem;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                child: Buton(
                    text: 'Add Addressc',
                    ontap: () => pushTo(context, const AddAddresscView())));
          }
          List<Addressca> list = [];
          for (var element in snapshot.data!.docs) {
            list.add(Addressca.fromJson(element, element.id));
          }

          // selectitem = list[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Addressc ',
                  style: getbodyStyle(fontWeight: FontWeight.bold)),
              const Gap(15),
              InkWell(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'My Addressc ',
                                      style: getbodyStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(15),
                              Expanded(
                                child: ListView.separated(
                                    itemCount: list.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Gap(10),
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectitem = list[index];
                                                    widget.onSelectedItem
                                                        .call(list[index]);
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: AddreesContainer(
                                                    user: list[index]))),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  height: 82,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      bottom: 2, top: 15, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xffF4F5F7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectitem?.labelas == 0
                                  ? 'Home'
                                  : selectitem?.labelas == 1
                                      ? 'Work'
                                      : 'Other',
                              style: getbodyStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Gap(3),
                            Row(
                              children: [
                                Image.asset('assets/maps.png'),
                                const Gap(5),
                                Text(
                                  selectitem?.address == null
                                      ? ''
                                      : selectitem!.address,
                                  style: getbodyStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )
                          ]),
                      const Icon(Icons.expand_more)
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
