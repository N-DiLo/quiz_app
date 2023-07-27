// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/view_models/new_quiz_view_model.dart';

class NewQuizView extends StatelessWidget {
  NewQuizView({super.key});

  var newQuiz = NewQuizViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      body: Center(
        child: QuizText(
          text: newQuiz.newQuizAdd,
          fontSize: 14,
          color: whiteColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
