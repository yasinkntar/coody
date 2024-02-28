import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/auth/presentation/screens/login_view.dart';
import 'package:coody/features/drawer/model/menu_item.dart';
import 'package:coody/features/profile/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:coody/core/utils/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen(
      {Key? key, required this.onSelectedItem, required this.currentItem})
      : super(key: key);
  final ValueChanged<MenuItem> onSelectedItem;
  final MenuItem currentItem;
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  User? user;

  String? userID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    userID = user?.uid;
  }

  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
          return Scaffold(
              backgroundColor: AppColors.scaffoldBGdark,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      InkWell(
                        onTap: () {
                          pushTo(context, const ProfileView());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.white,
                              child: CircleAvatar(
                                backgroundColor: AppColors.white,
                                radius: 40,
                                backgroundImage: (userData?['image'] != null)
                                    ? NetworkImage(userData?['image'])
                                    : (_imagePath != null)
                                        ? FileImage(File(_imagePath!))
                                            as ImageProvider
                                        : const AssetImage('assets/user.png'),
                              ),
                            ),
                            const Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(userData?['name'],
                                    style: getbodyStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white)),
                                Text(userData?['email'],
                                    style: getbodyStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white)),
                                const Gap(10),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  pushTo(context, const ProfileView());
                                },
                                icon: Icon(
                                  Icons.notifications,
                                  color: AppColors.white,
                                ))
                          ],
                        ),
                      ),
                      const Gap(100),
                      ...MenuItems.all.map(buildMenuItem).toList(),
                      const Spacer(),
                      OutlinedButton.icon(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            // ignore: use_build_context_synchronously
                            pushToWithReplacement(context, const LoginView());
                          },
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Log Out',
                            style:
                                getbodyStyle(fontSize: 13, color: Colors.red),
                          ))
                    ],
                  ),
                ),
              ));
        });
  }

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: widget.currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(
            item.icon,
            color: Colors.white,
          ),
          title: Text(item.title,
              style: getbodyStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white)
              // style: styles(18, FontWeight.bold, Colors.white),
              ),
          onTap: () {
            widget.onSelectedItem.call(item);
          },
        ),
      );
}
