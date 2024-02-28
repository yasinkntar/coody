import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_cubit.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_state.dart';
import 'package:coody/features/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is RegisterSuccessState) {
        Navigator.pop(context);
        showCusomteDialog(
            context, sendmesssageotp(context, _emailController.text));
      } else if (state is RegisterErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else {
        showLoadingDialog(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBGdark,
        appBar: appBars(context: context,isback: true),
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
                
                            Text('Sign Up',
                                style: getbodyStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white)),
                            const Gap(10),
                            Text('Please sign up to get started',
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
                                hinttext: 'John doe',
                                labeltext: 'Name',
                                controller: _nameController),
                            TextInput(
                              hinttext: 'example@gmail.com',
                              labeltext: 'Email',
                              controller: _emailController,
                            ),
                            TextInput(
                              hinttext: '**********',
                              labeltext: 'Password',
                              isPassword: true,
                              controller: _passwordController,
                            ),
                            TextInput(
                              hinttext: '**********',
                              labeltext: 'Re-Type Password',
                              isPassword: true,
                              controller: _passwordreController,
                            ),
                            const Gap(10),
                            Buton(
                                text: 'Sign Up',
                                ontap: () async {
                                  if (formKey.currentState!.validate()) {
                                    await context.read<AuthCubit>().register(
                                        _nameController.text,
                                        _emailController.text,
                                        _passwordController.text);
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

Widget sendmesssageotp(BuildContext context, String email) {
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
          child: Text(
            "A verification email \n     has been sent",
            style: GoogleFonts.sen().copyWith(
                fontSize: 15,
                color: const Color(0xff31343d),
                fontWeight: FontWeight.w400),
          ),
        ),
        const Gap(5),
        Text(
          email,
          style: GoogleFonts.sen().copyWith(
              fontSize: 14,
              color: const Color(0xff31343d),
              fontWeight: FontWeight.w400),
        ),
        const Gap(15),
        InkWell(
          onTap: () {
            pushAndRemoveUntil(context, const DrawerScreen());
          },
          child: Container(
            width: 150,
            height: 62,
            decoration: BoxDecoration(
              color: const Color(0xffff7622),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Go to Home',
                textAlign: TextAlign.center,
                style: GoogleFonts.sen().copyWith(
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    ),
  ));
}
