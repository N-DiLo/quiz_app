import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view_models/quiz_categories_model.dart';
import 'package:quiz_app/view_models/quiz_questions_model.dart';
import 'package:quiz_app/views/quiz_view.dart';
import '../views/splash_view.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizQuestions(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizCat(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        //
        routes: {
          QuizView.routeName: (ctx) => const QuizView(),
        },
      ),
    );
  }
}
