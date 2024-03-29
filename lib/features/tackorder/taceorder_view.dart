import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/features/tackorder/widget/deliverinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TackOrderView extends StatefulWidget {
  const TackOrderView({super.key, required this.uid});
  final String uid;
  @override
  State<TackOrderView> createState() => _TackOrderViewState();
}

class _TackOrderViewState extends State<TackOrderView> {
  int activeIndex = 3;
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

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Acceptance", textStyle: getbodyStyle()),
      subtitle: StepperText("Waiting for acceptance Order"),
    ),
    StepperData(
      title: StepperText("In preparation", textStyle: getbodyStyle()),
      subtitle: StepperText("We are working on processing your order"),
    ),
    StepperData(
      title: StepperText("Delivery", textStyle: getbodyStyle()),
      subtitle: StepperText("On his way to you"),
    ),
    StepperData(
      title: StepperText("Receiving the order", textStyle: getbodyStyle()),
      subtitle: StepperText("Receiving the order"),
    )
  ];
  String getimage(int active) {
    if (active == 0) {
      return 'assets/waiting.json';
    } else if (active == 1) {
      return 'assets/prepare.json';
    } else if (active == 2) {
      return 'assets/prepare.json';
    }
    return 'assets/waiting.json';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .doc(widget.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          DocumentReference? or = snapshot.data!["DeliveryID"];

          return Scaffold(
            backgroundColor: const Color(0xffD0D9E1),
            appBar: appBars(
              context: context,
              isback: true,
              color: const Color(0xffD0D9E1),
              titte: Text(
                'Track Order',
                style:
                    getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ),
            bottomSheet: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  children: [
                    AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth: 40,
                      iconHeight: 40,
                      inverted: false,
                      verticalGap: 15,
                      activeIndex:
                          int.tryParse(snapshot.data!["status"].toString()) ??
                              0,
                      barThickness: 8,
                    ),
                    const Spacer(),
                    int.tryParse(snapshot.data!["status"].toString()) == 2
                        ? Deliverinfo(
                            docm: or!,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                      child: Lottie.asset(
                          getimage(
                              int.parse(snapshot.data!["status"].toString())),
                          width: 300,
                          height: 300))
                ],
              ),
            )),
          );
        });
  }
}
