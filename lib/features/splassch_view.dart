import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/services/local_storage.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/features/auth/presentation/screens/login_view.dart';
import 'package:coody/features/drawer/drawer_screen.dart';
import 'package:coody/features/onbording_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplasschScreeen extends StatefulWidget {
  const SplasschScreeen({super.key});

  @override
  State<SplasschScreeen> createState() => _SplasschScreeenState();
}

class _SplasschScreeenState extends State<SplasschScreeen> {
  @override
  void initState() {
    AppLocal.getData(AppLocal.onBoardingSkipped).then((value) {
      bool result = value ?? false;
      if (result) {
        if (FirebaseAuth.instance.currentUser != null) {
          Future.delayed(
            const Duration(seconds: 3),
            () {
              pushToWithReplacement(context, const DrawerScreen());
            },
          );
        } else {
          Future.delayed(
            const Duration(seconds: 3),
            () {
              pushToWithReplacement(context, const LoginView());
            },
          );
        }
      } else {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            pushToWithReplacement(context, const OnBoardingView());
          },
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splassa.png'), fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
