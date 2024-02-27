import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/features/addresses/addressc_view.dart';
import 'package:coody/features/auth/presentation/screens/login_view.dart';
import 'package:coody/features/cart/cart_screen.dart';
import 'package:coody/features/edit_profile/editprofile_view.dart';
import 'package:coody/features/favorite/favorite_view.dart';
import 'package:coody/features/home/screens/home_view.dart';
import 'package:coody/features/payment/payment_view.dart';
import 'package:coody/features/profile/model/profileitem.dart';
import 'package:coody/features/profile/widget/list_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user;

  String? UserID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;

    UserID = user?.uid;
  }

  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars(
        context: context,
        isback: true,
        titte: Text(
          'Profile',
          style: getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var userData = snapshot.data;
                return Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 60,
                          backgroundImage: (userData?['image'] != null)
                              ? NetworkImage(userData?['image'])
                              : (_imagePath != null)
                                  ? FileImage(File(_imagePath!))
                                      as ImageProvider
                                  : const AssetImage('assets/user.png'),
                        ),
                      ),
                      const Gap(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Gap(10),
                          Text(userData?["name"],
                              style: getbodyStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(userData?["bio"],
                              style: getbodyStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xffA0A5BA))),
                          const Gap(10),
                        ],
                      ),
                    ],
                  ),
                  const Gap(15),
                  ListProfile(
                    onSelectedItem: (item) async {
                      if (item == Profilegroupe.logOut) {
                        await FirebaseAuth.instance.signOut();
                        // ignore: use_build_context_synchronously
                        pushToWithReplacement(context, const LoginView());
                      } else {
                        pushTo(context, getscreen(item));
                      }
                    },
                  )
                ]);
              }),
        ),
      )),
    );
  }

  Widget getscreen(ProfileItem item) {
    switch (item) {
      case Profilegroupe.personal:
        return const EditProfileView();
      case Profilegroupe.addresses:
        return const AddresscView();
      case Profilegroupe.cart:
        return const CartScreen();
      case Profilegroupe.favourite:
        return const FavoriteView();
      case Profilegroupe.notifications:
        return const Center();
      case Profilegroupe.paymentMethod:
        return const PaymentView();
      case Profilegroupe.faqs:
        return const Center();
      case Profilegroupe.reviews:
        return const Center();
      case Profilegroupe.settings:
        return const Center();
      case Profilegroupe.logOut:
        return const Center();

      default:
        return const HomeView();
    }
  }
}
