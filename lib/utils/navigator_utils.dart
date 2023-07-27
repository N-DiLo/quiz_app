import 'package:flutter/cupertino.dart';
import 'package:quiz_app/views/quiz_result_view.dart';
import 'package:quiz_app/views/quiz_view.dart';

import '../components/app_bottom_nav.dart';

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
  Navigator.pushNamed(context, QuizView.routeName, arguments: arguments);
}

//Quit Quiz View
void quitQuiz(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (_) => const QuizResultView(),
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
