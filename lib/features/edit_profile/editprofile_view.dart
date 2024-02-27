import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';

import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/profile/bloc/profile_cubit.dart';
import 'package:coody/features/profile/bloc/profile_statue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'dart:io';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    var form = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
      if (state is ProfileLodingState) {
        showLoadingDialog(context);
      } else if (state is ProfileUpdateImage) {
        _imagePath = state.pathimage;
        Navigator.pop(context);
      }
      if (state is ProfileSuccessState) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: appBars(
            context: context,
            isback: true,
            titte: Text(
              'Edite Profile',
              style: getappbartextStyle(),
            )),
        body: SafeArea(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .doc(context.read<ProfileCubit>().UserID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var userData = snapshot.data;
                  nameController.text = userData?["name"] ?? '';

                  emailController.text = userData?["email"] ?? '';
                  phoneController.text = userData?["phone"] ?? '';

                  bioController.text = userData?["bio"] ?? '';

                  return Form(
                    key: form,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                      
                            const Gap(20),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    backgroundImage:
                                        (userData?['image'] != null)
                                            ? NetworkImage(userData?['image'])
                                            : (_imagePath != null)
                                                ? FileImage(File(_imagePath!))
                                                    as ImageProvider
                                                : const AssetImage(
                                                    'assets/user.png'),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await context
                                        .read<ProfileCubit>()
                                        .pickImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.colorprimer,
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(15),
                            TextInput(
                                hinttext: 'John doe',
                                labeltext: 'Name',
                                type: TextInputType.name,
                                controller: nameController),
                            TextInput(
                                hinttext: 'example@gmail.com',
                                labeltext: 'Email',
                                type: TextInputType.emailAddress,
                                controller: emailController),
                            TextInput(
                              hinttext: '408-841-0926',
                              labeltext: 'Phone Number',
                              type: TextInputType.phone,
                              controller: phoneController,
                            ),
                            TextInput(
                                hinttext: 'I love fast food',
                                labeltext: 'Bio',
                                type: TextInputType.text,
                                maxline: 3,
                                controller: bioController),
                            Buton(
                                text: 'Save',
                                ontap: () async {
                                  if (form.currentState!.validate()) {
                                    context.read<ProfileCubit>().updateData(
                                        nameController.text,
                                        emailController.text,
                                        phoneController.text,
                                        bioController.text);
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
      );
    });
  }
}
