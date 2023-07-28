import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/view_models/quiz_questions_model.dart';

class QuizViewModel extends ChangeNotifier {
  String userWel = 'Play to win, and standout!';
  String appBtnQut = 'Quit Quiz';
  String qstText = 'Question: ';
  String appBtnNxt = 'Next';
  String appLstQuz = 'Finish';
  int score = 0;

  // List<QuizList> get quizQuestion {
  //   return [QuizQuestions];
  // }
}
