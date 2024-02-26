import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_cubit.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is RestPasswordSuccessState) {
        Navigator.pop(context);
        showCusomteDialog(context, sendrestotp(context, _emailController.text));
      } else if (state is RestPasswordErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else {
        showLoadingDialog(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBGdark,
        body: SafeArea(

          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.28,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage('assets/splassch.png'),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xfffcfcfe),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff898a8d),
                                          offset: Offset(0, 1),
                                          blurRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: SizedBox(
                                        child: Image.asset('assets/back.png'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text('Forgot Password',
                                style: getbodyStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white)),
                            const Gap(10),
                            Text('Please sign in to your existing account',
                                style: getbodyStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white)),
                          ]),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.72,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 30, 20, 21),
                        child: Column(
                          children: [
                            TextInput(
                                hinttext: 'example@gmail.com',
                                labeltext: 'Email',
                                ismandatory: true,
                                controller: _emailController,
                                isemail: true),
                            const Gap(10),
                            Buton(
                                text: 'Send Code',
                                ontap: () async {
                                  if (formKey.currentState!.validate()) {
                                    await context
                                        .read<AuthCubit>()
                                        .restpassword(
                                          _emailController.text,
                                        );
                                  }
                                }),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget sendrestotp(BuildContext context, String email) {
  return Dialog(
      child: Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25))),
    height: 350,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/sentotp.json', height: 175),
        Center(
          child: Text("A verification email \n     has been sent",
              style: getbodyStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff31343d))),
        ),
        const Gap(5),
        Text(email,
            style: getbodyStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff31343d))),
        const Gap(15),
        InkWell(
          onTap: () {},
          child: Container(
            width: 150,
            height: 62,
            decoration: BoxDecoration(
              color: AppColors.colorprimer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text('Go to Login',
                  textAlign: TextAlign.center,
                  style: getbodyStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white)),
            ),
          ),
        )
      ],
    ),
  ));
}

bool emailValidate(String email) {
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}
