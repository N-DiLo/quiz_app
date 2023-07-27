import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/models/quiz_categories.dart';
import 'package:quiz_app/views/quiz_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var quizCategory = Provider.of<QuizCat>(context);
    final quizCatData = quizCategory.qCategories;

    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: mWidth * 0.25,
        leading: CircleAvatar(
          backgroundColor: kcSplashColor,
          radius: mHeight * 0.1,
          child: const FaIcon(
            FontAwesomeIcons.userTie,
            size: 30,
            color: kcPrimaryColor,
          ),
        ),
        titleSpacing: mWidth * 0.001,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Welcome',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
            AppText(
              text: 'How are you today?',
              fontSize: 11,
              fontWeight: FontWeight.w300,
              color: whiteColor,
            )
          ],
        ),
        backgroundColor: kcPrimaryColor,
      ),
      backgroundColor: kcPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mHeight * 0.03),
            Container(
              width: mWidth * 1,
              height: mHeight * 0.21,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kcSplashColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: '?',
                    fontSize: 120,
                    fontWeight: FontWeight.w700,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: 'Play &\nWin',
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: kcPrimaryColor,
                      ),
                      SizedBox(height: mHeight * 0.015),
                      const AppText(
                        softWrap: true,
                        text:
                            'Hosting a quiz is a fun way\nto engage and energize you.',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: kcPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mHeight * 0.026,
            ),
            const AppText(
              text: 'Quiz Categories',
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: mHeight * 0.020,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: quizCatData.length,
                  itemBuilder: (context, index) {
                    final quizCats = quizCatData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, QuizView.routeName,
                            arguments: quizCats.catName);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        elevation: 3,
                        color: whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  quizCats.cate_Image,
                                  height: mHeight * 0.08,
                                ),
                                SizedBox(
                                  height: mHeight * 0.01,
                                ),
                                QuizText(
                                  textAlign: TextAlign.center,
                                  text: quizCats.catName,
                                  fontSize: 15,
                                  softWrap: true,
                                  fontWeight: FontWeight.w500,
                                  color: kcPrimaryColor,
                                )
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
