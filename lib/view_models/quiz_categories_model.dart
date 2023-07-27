import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_images.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizCat with ChangeNotifier {
  final List<QuizCategory> quizCat = [
    QuizCategory(catName: 'General Knowledge', catImages: genCategory),
    QuizCategory(catName: 'Geography Quiz', catImages: geoCategory),
    QuizCategory(catName: 'Movie Quiz', catImages: movieCategory),
    QuizCategory(catName: 'Food & Drinks Quiz', catImages: foodCategory),
    QuizCategory(catName: 'Sports Quiz', catImages: sportsCategory),
    QuizCategory(catName: 'Bible Quiz', catImages: bibleCategory),
  ];

  List<QuizCategory> get qCategories {
    return [...quizCat];
  }
}
