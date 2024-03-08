import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/services/local_storage.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/auth/presentation/screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        pushToWithReplacement(context, const LoginView());
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.scaffoldBG,
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff646982),
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: AppColors.colorprimer,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () async {
        AppLocal.cacheData(AppLocal.onBoardingSkipped, true);
        pushToWithReplacement(context, const LoginView());
      },
      controllerColor: AppColors.colorprimer,
      totalPage: 3,
      headerBackgroundColor: AppColors.scaffoldBG,
      pageBackgroundColor: AppColors.scaffoldBG,
      background: [
        Center(
          child: Image.asset(
            'assets/onbording1.png',
            height: 400,
            width: 400,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/onbording2.png',
            height: 400,
            width: 400,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/onbording3.png',
            height: 400,
            width: 400,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('On your way...',
                  textAlign: TextAlign.center,
                  style:
                      getbodyStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text('to find the perfect looking Onboarding for your app?',
                  textAlign: TextAlign.center,
                  style: getsmallStyle(
                      fontSize: 18, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('You’ve reached your destination.',
                  textAlign: TextAlign.center,
                  style:
                      getbodyStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text('Sliding with animation',
                  textAlign: TextAlign.center,
                  style: getsmallStyle(
                      fontSize: 18, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('Start now!',
                  textAlign: TextAlign.center,
                  style:
                      getbodyStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Where everything is possible and customize your onboarding.',
                  textAlign: TextAlign.center,
                  style: getsmallStyle(
                      fontSize: 18, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ],
    );
  }
}
