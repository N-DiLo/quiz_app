import 'package:flutter/material.dart';

class QuizList with ChangeNotifier {
  final String question;
  final String category;
  final int correctAnswer;
  final String? catImage;
  final List<String> options;

  QuizList(
      {required this.question,
      required this.category,
      required this.correctAnswer,
      required this.options,
      this.catImage});
}

class QuizCategory with ChangeNotifier {
  final String catName;
  final String catImages;

  QuizCategory({required this.catName, required this.catImages});
}
