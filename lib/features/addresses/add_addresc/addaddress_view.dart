import 'package:coody/core/models/users_addrees.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbar_custome.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/addresses/widget/typeaddress.dart';
import 'package:coody/features/profile/bloc/profile_cubit.dart';
import 'package:coody/features/profile/bloc/profile_statue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddAddresscView extends StatefulWidget {
  const AddAddresscView({super.key});

  @override
  State<AddAddresscView> createState() => _AddAddresscViewState();
}

class _AddAddresscViewState extends State<AddAddresscView> {
  int indextype = 0;
  var formKey = GlobalKey<FormState>();
  final TextEditingController addresscController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController appartmentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
      if (state is ProfileLodingState) {
        showLoadingDialog(context);
      } else if (state is ProfileErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      }
      if (state is ProfileSuccessState) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.4,
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xffD0D9E1),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: AppBarCustome(
                        isback: true,
                      )),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextInput(
                          hinttext: '3235 Royal Ln. mesa, new jersy 34567',
                          labeltext: 'Address',
                          ismandatory: true,
                          controller: addresscController),
                      Row(
                        children: [
                          Expanded(
                            child: TextInput(
                                hinttext: 'hason nagar',
                                labeltext: 'street',
                                ismandatory: true,
                                controller: streetController),
                          ),
                          const Gap(15),
                          Expanded(
                            child: TextInput(
                                hinttext: '34567',
                                labeltext: 'Post code',
                                ismandatory: true,
                                controller: postController),
                          )
                        ],
                      ),
                      TextInput(
                          hinttext: '345',
                          labeltext: 'Appartment',
                          ismandatory: true,
                          controller: appartmentController),
                      Row(
                        children: [
                          Text(
                            'Label as',
                            style: getbodyStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff31343d)),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () => setState(() {
                                    indextype = 0;
                                  }),
                              child: TypeAddress(
                                  isSelect: indextype == 0, name: 'Home')),
                          GestureDetector(
                              onTap: () => setState(() {
                                    indextype = 1;
                                  }),
                              child: TypeAddress(
                                  isSelect: indextype == 1, name: 'Work')),
                          GestureDetector(
                              onTap: () => setState(() {
                                    indextype = 2;
                                  }),
                              child: TypeAddress(
                                  isSelect: indextype == 2, name: 'Other')),
                        ],
                      ),
                      const Gap(15),
                      Buton(
                        text: 'Save location',
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<ProfileCubit>().addaddress(
                                UserAddressc(
                                    address: addresscController.text,
                                    appartment: appartmentController.text,
                                    labelas: indextype,
                                    uuid: '',
                                    postcode: postController.text,
                                    street: streetController.text));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
