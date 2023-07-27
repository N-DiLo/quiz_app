import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/utils/navigator_utils.dart';
import 'package:quiz_app/view_models/quiz_questions_model.dart';
import 'package:quiz_app/view_models/quiz_view_model.dart';
import 'package:quiz_app/components/app_btn.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});
  static const routeName = '/quizView';

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  var qVModel = QuizViewModel();

  @override
  Widget build(BuildContext context) {
    var quizData = ModalRoute.of(context)!.settings.arguments;
    final selectedQuiz = Provider.of<QuizQuestions>(context)
        .quizQuestion
        .firstWhere((element) => element.category == quizData);

    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcPrimaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: selectedQuiz.category,
              fontSize: 18,
              color: whiteColor,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              text: qVModel.userWel,
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: whiteColor,
            )
          ],
        ),
      ),
      backgroundColor: kcPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mHeight * 0.05),
            QuizText(
              textAlign: TextAlign.center,
              text: selectedQuiz.question,
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: mHeight * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: mWidth * 0.4,
                  child: AppBtn(
                    onTap: () {
                      quitQuiz(context);
                    },
                    color: whiteColor,
                    child: AppText(
                      text: qVModel.appBtnQut,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: kcPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: mWidth * 0.4,
                  child: AppBtn(
                    color: kcSplashColor,
                    child: AppText(
                      text: qVModel.appBtnNxt,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
