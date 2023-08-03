import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/components/app_images.dart';
import '../components/app_bottom_nav.dart';
import '../models/quiz_model.dart';
import '../components/app_colors.dart';
import '../components/app_text.dart';

class QuizQuestions with ChangeNotifier {
  final List<QuizList> questions = [
    QuizList(
      question: 'Which is the only body part that is fully grown from birth?',
      category: 'General Knowledge',
      catImage: genCategory,
      options: [
        'Legs',
        'Eyes',
        'Head',
        'Teeth',
      ],
      correctAnswer: 1,
    ),
    QuizList(
      question: 'How many hearts does an octopus have?',
      category: 'General Knowledge',
      correctAnswer: 3,
      catImage: genCategory,
      options: [
        '1',
        '4',
        '5',
        '3',
      ],
    ),
    QuizList(
      question: 'What planet is closest to the sun?',
      category: 'General Knowledge',
      correctAnswer: 0,
      catImage: genCategory,
      options: [
        'Mercury',
        'Uranus',
        'Jupiter',
        'Pluto',
      ],
    ),
    QuizList(
      question: 'How many books does the bible have?',
      category: 'Bible Quiz',
      correctAnswer: 2,
      catImage: bibleCategory,
      options: [
        '60',
        '33',
        '66',
        '30',
      ],
    ),
    QuizList(
      question: 'Who is the father of Joseph?',
      category: 'Bible Quiz',
      correctAnswer: 1,
      catImage: bibleCategory,
      options: [
        'Abraham',
        'Jacob',
        'David',
        'Solomon',
      ],
    ),
    QuizList(
      question: 'Jesus rose on the __________ day',
      category: 'Bible Quiz',
      correctAnswer: 1,
      catImage: bibleCategory,
      options: [
        'first',
        'third',
        'second',
        'last',
      ],
    ),
    QuizList(
      question: 'What does FIFA stand for in English?',
      category: 'Sports Quiz',
      catImage: sportsCategory,
      correctAnswer: 2,
      options: [
        'Federation of International Football Association',
        'Federation International Football Association',
        'International Federation of Association Football',
        'No correct answer',
      ],
    ),
    QuizList(
      question: 'What was the first name of Argentinian soccer star Maradona?',
      category: 'Sports Quiz',
      correctAnswer: 0,
      catImage: sportsCategory,
      options: [
        'Diego',
        'Maradona',
        'Die-go',
        'Deergo',
      ],
    ),
    QuizList(
      question: 'Who is the world’s highest-paid athlete in 2021?',
      category: 'Sports Quiz',
      correctAnswer: 2,
      catImage: sportsCategory,
      options: [
        'MayWeather Jnr.',
        'Anthony Joshua',
        'Conor McGregor',
        'Israel Adesanya',
      ],
    ),
    QuizList(
      question: 'Who was the first Disney princess?',
      category: 'Movie Quiz',
      correctAnswer: 0,
      catImage: movieCategory,
      options: [
        'Snow White',
        'Cinderella',
        'Jasmine',
        'Mulan',
      ],
    ),
    QuizList(
      question: 'Where is Disney\'s European theme park located?',
      category: 'Movie Quiz',
      correctAnswer: 1,
      catImage: movieCategory,
      options: [
        'London, England',
        'Paris, France',
        'Los Angeles, USA',
        'Chicago, USA',
      ],
    ),
    QuizList(
      question: '''I'll Make a Man Out of You' is a song from which movie?''',
      category: 'Movie Quiz',
      correctAnswer: 0,
      catImage: movieCategory,
      options: [
        'Mulan',
        'Aladin',
        'Snow White',
        'Toy Story',
      ],
    ),
    QuizList(
      question: 'What is the world’s best-selling stout beer?',
      category: 'Food & Drinks Quiz',
      catImage: foodCategory,
      options: [
        'Guinness',
        'Murphy\'s Irish Stout.',
        'Budweiser',
        'Deschutes\' Obsidian',
      ],
      correctAnswer: 0,
    ),
    QuizList(
      question: 'Where did sushi originate?',
      category: 'Food & Drinks Quiz',
      catImage: foodCategory,
      options: [
        'Japan',
        'France',
        'Rome',
        'China',
      ],
      correctAnswer: 3,
    ),
    QuizList(
      question: 'Which of the following sauces is NOT traditionally vegan?',
      category: 'Food & Drinks Quiz',
      catImage: foodCategory,
      correctAnswer: 2,
      options: [
        'Hoisin',
        'Mustard',
        'Worcestershire',
        'Wasabi',
      ],
    ),
    QuizList(
      question: 'On what continent would you find the world’s largest desert?',
      category: 'Geography Quiz',
      catImage: geoCategory,
      options: [
        'Antarctica',
        'North America',
        'Asia',
        'Africa',
      ],
      correctAnswer: 0,
    ),
    QuizList(
      question: 'How many stars are on the Chinese flag?',
      category: 'Geography Quiz',
      catImage: geoCategory,
      options: [
        '6',
        '3',
        '4',
        '5',
      ],
      correctAnswer: 3,
    ),
    QuizList(
      question: 'How many colors are used in the South African flag?',
      category: 'Geography Quiz',
      catImage: geoCategory,
      correctAnswer: 2,
      options: [
        '5',
        '3',
        '6',
        '4',
      ],
    ),
  ];

  List<QuizList> get quizQuestion {
    return [...questions];
  }

  int? selectedAnswer;
  bool isAnswerCorrect = false;
  int questionIndex = 0;
  int questionNumber = 1;
  int score = 0;

  void pickAnswer(int value, List<QuizList> mQuestionList) {
    selectedAnswer = value;
    isAnswerCorrect = value == mQuestionList[questionIndex].correctAnswer;
    if (isAnswerCorrect) {
      score++;
    }
    notifyListeners();
  }

  List<QuizList> getCurrentQuestion(String category) {
    var currentQuestion =
        questions.where((element) => element.category == category).toList();
    return currentQuestion;
  }

  void goToNextQuestion(allQs) {
    if (questionIndex != allQs) {
      questionIndex++;
      questionNumber++;
      selectedAnswer = null;
    }
    notifyListeners();
  }

  void startQuiz(context) {
    selectedAnswer = null;
    score = 0;
    questionIndex = 0;
    questionNumber = 1;
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (_) => const AppBottomNav(),
      ),
    );

    notifyListeners();
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const AppBottomNav(),
                    ),
                  );

                  selectedAnswer = null;
                  score = 0;
                  questionIndex = 0;
                  questionNumber = 1;

                  notifyListeners();
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
}
