import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_images.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizCat with ChangeNotifier {
  final List<QuizCategory> quizCat = [
    QuizCategory(catName: 'Food Quiz', cate_Image: foodCategory),
    QuizCategory(catName: 'Movie Quiz', cate_Image: movieCategory),
    QuizCategory(catName: 'General Knowledge', cate_Image: genCategory),
    QuizCategory(catName: 'Bible Quiz', cate_Image: bibleCategory),
    QuizCategory(catName: 'Sports Quiz', cate_Image: sportsCategory),
    QuizCategory(catName: 'Geography Quiz', cate_Image: geoCategory),
  ];

  List<QuizCategory> get qCategories {
    return [...quizCat];
  }
}
