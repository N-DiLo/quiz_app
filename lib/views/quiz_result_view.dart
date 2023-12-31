import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/components/app_btn.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_images.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/utils/navigator_utils.dart';
import 'package:quiz_app/view_models/quiz_questions_model.dart';
import 'package:quiz_app/view_models/quiz_result_view_model.dart';

class QuizResultView extends StatefulWidget {
  const QuizResultView({required this.score, super.key});
  final int score;

  @override
  State<QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends State<QuizResultView> {
  var qRVM = QuizResultViewModel();

  @override
  void initState() {
    super.initState();
    qRVM.controller.play();
  }

  @override
  void dispose() {
    qRVM.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newQuiz = Provider.of<QuizQuestions>(context);
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              takeNewQuiz(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: whiteColor,
            )),
        elevation: 0,
        backgroundColor: kcPrimaryColor,
      ),
      backgroundColor: kcPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mWidth * 0.07),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mHeight * 0.03),
              widget.score < 2
                  ? Image.asset(
                      sadFace,
                      width: mWidth * 0.45,
                    )
                  : ConfettiWidget(
                      confettiController: qRVM.controller,
                      shouldLoop: true,
                      blastDirectionality: BlastDirectionality.explosive,
                      emissionFrequency: 0.06,
                      gravity: 0.3,
                      numberOfParticles: 10,
                      minBlastForce: 5,
                      maxBlastForce: 10,
                      createParticlePath: (size) {
                        final path = Path();

                        path.addRect(
                            Rect.fromCircle(center: Offset.zero, radius: 4));
                        return path;
                      },
                      child: Image.asset(
                        congrats,
                        width: mWidth * 0.45,
                      ),
                    ),
              SizedBox(height: mHeight * 0.04),
              widget.score < 2
                  ? AppText(
                      text: qRVM.betterLuck,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                    )
                  : AppText(
                      text: qRVM.qRCongrats,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                    ),
              SizedBox(height: mHeight * 0.001),
              widget.score < 2
                  ? AppText(
                      text: qRVM.tryAgain,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    )
                  : AppText(
                      text: qRVM.qRAwesome,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
              SizedBox(height: mHeight * 0.15),
              AppText(
                text: qRVM.qRScore,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
              SizedBox(height: mHeight * 0.01),
              AppText(
                text: '${widget.score} / 3',
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
              SizedBox(height: mHeight * 0.08),
              SizedBox(
                width: mWidth * 0.7,
                child: AppBtn(
                  onTap: () => newQuiz.startQuiz(context),
                  color: kcSplashColor,
                  child: AppText(
                    text: qRVM.takeQuiz,
                    fontSize: 18,
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
