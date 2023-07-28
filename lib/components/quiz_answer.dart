import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';

class QuizAnswers extends StatelessWidget {
  final int? selectedAnswer;
  final int currentIndex;
  final String answer;
  final bool isPicked;
  final int? correctAnswer;

  const QuizAnswers({
    super.key,
    required this.answer,
    required this.isPicked,
    required this.currentIndex,
    required this.correctAnswer,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    bool isCorrect = currentIndex == correctAnswer;
    bool isWrongAnswer = !isCorrect && isPicked;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: mHeight * 0.020,
      ),
      child: selectedAnswer != null
          ? Container(
              height: mHeight * 0.07,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isCorrect
                      ? kcGreenColor
                      : isWrongAnswer
                          ? kcRedColor
                          : whiteColor,
                ),
              ),
              child: ListTile(
                title: QuizText(
                  text: answer,
                  softWrap: true,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
                trailing: isCorrect
                    ? buildCorrectAnswer()
                    : isWrongAnswer
                        ? buildWrongAnswer()
                        : const SizedBox.shrink(),
              ),
            )
          : Container(
              height: mHeight * 0.07,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: whiteColor,
                ),
              ),
              child: ListTile(
                title: QuizText(
                  text: answer,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
                trailing: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: whiteColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

Widget buildCorrectAnswer() => const FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      color: kcGreenColor,
      size: 25,
    );

Widget buildWrongAnswer() => const FaIcon(
      FontAwesomeIcons.solidCircleXmark,
      color: kcRedColor,
      size: 25,
    );
