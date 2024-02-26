import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/payment_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/checkout/models/paymentid.dart';
import 'package:coody/features/payment/add_payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardSelect extends StatefulWidget {
  const CardSelect({super.key, required this.onSelectedItem});
  final ValueChanged<PaymentID> onSelectedItem;
  @override
  State<CardSelect> createState() => _CardSelectState();
}

class _CardSelectState extends State<CardSelect> {
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

  PaymentID? paymentModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Payment')
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
                    text: 'Credit Card ',
                    ontap: () => pushTo(context, const AddPayment())));
          }
          List<PaymentID> list = [];
          snapshot.data!.docs.forEach((element) {
            list.add(PaymentID.fromJson(element, element.id));
          });
          paymentModel = list[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Credit Card',
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
                                      'My Card ',
                                      style: getbodyStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(15),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                          onTap: () {
                                            widget.onSelectedItem
                                                .call(list[index]);
                                            Navigator.pop(context);
                                          },
                                          child:
                                              CardPayment(list: list[index]));
                                    }),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  height: 82,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 15),
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
                              paymentModel!.cardHolderName,
                              style: getbodyStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Gap(3),
                            Row(
                              children: [
                                Image.asset('assets/payment.png'),
                                const Gap(5),
                                Text(
                                  paymentModel!.cardNumber,
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

class CardPayment extends StatelessWidget {
  const CardPayment({
    super.key,
    required this.list,
  });

  final PaymentModel list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 2, top: 15, right: 20, left: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: const Color(0xffF4F5F7),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              list.cardHolderName,
              style: getbodyStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Gap(3),
            Row(
              children: [
                Image.asset('assets/payment.png'),
                const Gap(5),
                Text(
                  list.cardNumber,
                  style:
                      getbodyStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            )
          ]),
          const Icon(Icons.expand_more)
        ],
      ),
    );
  }
}
