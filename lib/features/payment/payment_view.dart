import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/payment_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/payment/add_payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
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
            titte: Text(
              'Payment Method',
              style: getappbartextStyle(),
            )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: Buton(
            text: 'Add new Credit Card',
            ontap: () {
              pushTo(context, const AddPayment());
            },
          ),
        ),
        body: StreamBuilder(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/credit.png',
                        width: 150,
                        height: 150,
                      ),
                      const Gap(15),
                      Text(
                        'You have not added\n a payment method',
                        style: getbodyStyle(),
                      )
                    ],
                  ),
                );
              }
              List<PaymentModel> list = [];
              for (var element in snapshot.data!.docs) {
                list.add(PaymentModel.fromJson(element));
              }
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Gap(25),
                    Expanded(
                      child: AnimatedListView(
                        // scrollDirection: Axis.horizontal,
                        duration: 250,
                        extendedSpaceBetween: 30,
                        spaceBetween: 10,
                        children: List.generate(
                            list.length,
                            (index) => GridAnimatorWidget(
                                  child: CreditCardUi(
                                    cardHolderFullName:
                                        list[index].cardHolderName,
                                    cardNumber: list[index].cardNumber,
                                    validFrom: list[index].expiryDate,
                                    validThru: '',
                                    showValidThru: false,
                                    creditCardType: CreditCardType.visa,
                                    topLeftColor: Colors.blue,
                                    doesSupportNfc: true,
                                    placeNfcIconAtTheEnd: true,
                                    cardType: CardType.prepaid,
                                  ),
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
