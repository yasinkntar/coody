import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_cubit.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_state.dart';
import 'package:coody/features/auth/presentation/screens/forgotpassword.dart';
import 'package:coody/features/auth/presentation/screens/signup_view.dart';
import 'package:coody/features/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is LoginSuccessState) {
        pushAndRemoveUntil(context, const DrawerScreen());
      } else if (state is LoginErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else if (state is LoginLoadingState) {
        showLoadingDialog(context);
      } else if (state is LoginGoogleSuccessState) {
        pushAndRemoveUntil(context, const DrawerScreen());
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBGdark,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.26,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage('assets/splassch.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Log In',
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
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.74,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 25, 20, 15),
                        child: Column(
                          children: [
                            TextInput(
                                controller: _emailController,
                                hinttext: 'example@gmail.com',
                                labeltext: 'Email',
                                ismandatory: true,
                                isemail: true),
                            TextInput(
                              controller: _passwordController,
                              hinttext: '**********',
                              labeltext: 'Password',
                              isPassword: true,
                              ismandatory: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    pushTo(context, const ForgotPasswordView(),
                                        axis: AxisDirection.up);
                                  },
                                  child: Text('Forgot Password',
                                      style: getTitleStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                )
                              ],
                            ),
                            const Gap(10),
                            Buton(
                                text: 'Log In',
                                ontap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await context.read<AuthCubit>().login(
                                        _emailController.text,
                                        _passwordController.text);
                                  }
                                }),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don’t have an account?',
                                    style: getbodyStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textnorlma)),
                                const Gap(5),
                                TextButton(
                                  onPressed: () {
                                    pushTo(context, const SignupView());
                                  },
                                  child: Text('SIGN UP',
                                      style: getbodyStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colorprimer)),
                                )
                              ],
                            ),
                            const Gap(10),
                            Text('Or',
                                style: getsmallStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textnorlma)),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await context
                                        .read<AuthCubit>()
                                        .signInWithGoogle();
                                  },
                                  child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                        'assets/google.png',

                                        // size: 80,
                                      ))),
                                ),
                                const Gap(20),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                        'assets/facebook.png',

                                        // size: 80,
                                      ))),
                                )
                              ],
                            )
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
