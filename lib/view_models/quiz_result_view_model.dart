import 'package:confetti/confetti.dart';

class QuizResultViewModel {
  final controller = ConfettiController();

  String qRCongrats = 'CONGRATULATIONS!';
  String qRAwesome = 'You were awesome';
  String qRScore = 'YOUR SCORE';
  String qScore = '3 / 3';

  String takeQuiz = 'Take New Quiz';
}
