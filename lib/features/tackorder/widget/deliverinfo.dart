import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class Deliverinfo extends StatefulWidget {
  const Deliverinfo({super.key, required this.docm});
  final DocumentReference docm;
  @override
  State<Deliverinfo> createState() => _DeliverinfoState();
}

class _DeliverinfoState extends State<Deliverinfo> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.docm.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            width: double.infinity,
            height: 90,
            // color: Colors.amber,
            child: Row(children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(snapshot.data?["image"]))),
              ),
              const Gap(10),
              Center(
                  child: Text(
                snapshot.data?["FullName"],
                style: getbodyStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              const Spacer(),
              InkWell(
                onTap: () => _makePhoneCall( snapshot.data?["phone"]),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.colorprimer),
                  child: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(10),
            ]),
          );
        });
  }
}
