import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';

class NewQuizView extends StatelessWidget {
  const NewQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kcPrimaryColor,
      body: Center(
        child: QuizText(
          text: 'Coming Soon',
          fontSize: 14,
          color: whiteColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
