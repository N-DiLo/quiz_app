import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/views/home_view.dart';

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
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (_) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kcSplashColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(''),
              SizedBox(
                height: mHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
