import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/views/quiz_result_view.dart';
import 'package:quiz_app/views/quiz_view.dart';

import '../components/app_bottom_nav.dart';
import '../components/app_text.dart';

//Open Home View after Splash
void startApp(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (_) => const AppBottomNav(),
    ),
  );
}

//Open Quiz View
void openQuizView(BuildContext context, Object? arguments) async {
  Navigator.pushReplacementNamed(context, QuizView.routeName,
      arguments: arguments);
}

//Quit Quiz View
void quitQuiz(BuildContext context) async {
  showCupertinoDialog(
    context: context,
    builder: (ctx) => CupertinoAlertDialog(
      title: const AppText(
        text: 'Quit Quiz?',
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: kcPrimaryColor,
      ),
      content: const AppText(
        text: 'Are you sure you want to quit quiz?',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: kcPrimaryColor,
      ),
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const AppBottomNav(),
                  ),
                );
              },
              child: const AppText(
                text: 'Yes',
                fontSize: 13,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const AppText(
                text: 'No',
                fontSize: 13,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

void finishQuiz(BuildContext context, int quizScore) async {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (_) => QuizResultView(score: quizScore),
    ),
  );
}

void takeNewQuiz(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (_) => const AppBottomNav(),
    ),
  );
}
