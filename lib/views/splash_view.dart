import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_images.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/utils/navigator_utils.dart';
import 'package:quiz_app/view_models/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    startApp(context);
  }

  var splashValues = SplashModel();
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kcSplashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: mHeight * 0.35,
            ),
            Image.asset(appLogo),
            SizedBox(height: mHeight * 0.35),
            const CircularProgressIndicator(
              color: kcPrimaryColor,
              strokeWidth: 1,
            ),
            SizedBox(
              height: mHeight * 0.01,
            ),
            AppText(
              text: splashValues.loadingTxt,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: kcPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
