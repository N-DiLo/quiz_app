import 'package:flutter/cupertino.dart';
import 'package:quiz_app/views/quiz_view.dart';

import '../components/app_bottom_nav.dart';

void startApp(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (_) => const AppBottomNav(),
    ),
  );
}

void openQuizView(BuildContext context, Object? arguments) async {
  Navigator.pushNamed(context, QuizView.routeName, arguments: arguments);
}
