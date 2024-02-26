import 'package:coody/core/models/payment_model.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbar_custome.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/profile/bloc/profile_cubit.dart';
import 'package:coody/features/profile/bloc/profile_statue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController hoderController = TextEditingController();
  final TextEditingController cardnumberController = TextEditingController();
  final TextEditingController expiController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
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
      return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: Buton(
            text: 'Add Payment',
            ontap: () {
              context.read<ProfileCubit>().addPayment(PaymentModel(
                  cardHolderName: hoderController.text,
                  cardNumber: cardnumberController.text,
                  cvv: cvvController.text,
                  expiryDate: expiController.text));
            },
          ),
        ),
        body: Form(
          key: formKey,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppBarCustome(
                    isback: true,
                    titte: Center(
                        child: Text(
                      'Add Addressc',
                      style: getappbartextStyle(),
                    )),
                  ),
                  const Gap(20),
                  TextInput(
                      hinttext: 'CARD HOLDER NAME',
                      labeltext: 'CARD HOLDER NAME',
                      type: TextInputType.name,
                      controller: hoderController),
                  TextInput(
                      hinttext: '**** **** **** ****',
                      labeltext: 'Card Number',
                      maskTextInputFormatter: MaskTextInputFormatter(
                          mask: '#### #### #### ####',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy),
                      type: TextInputType.number,
                      controller: cardnumberController),
                  Row(
                    children: [
                      Expanded(
                        child: TextInput(
                          hinttext: '01/01',
                          labeltext: 'Expire Date',
                          maskTextInputFormatter: MaskTextInputFormatter(
                              mask: '##/##',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy),
                          type: TextInputType.number,
                          controller: expiController,
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: TextInput(
                          hinttext: '****',
                          labeltext: 'CVV',
                          maskTextInputFormatter: MaskTextInputFormatter(
                              mask: '####',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy),
                          type: TextInputType.number,
                          controller: cvvController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
