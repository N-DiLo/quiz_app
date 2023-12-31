import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/app_colors.dart';
import 'package:quiz_app/components/app_text.dart';
import 'package:quiz_app/view_models/bottom_nav_model.dart';
import 'package:quiz_app/views/home_view.dart';
import 'package:quiz_app/views/new_quiz_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({Key? key}) : super(key: key);

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  final appScreens = [HomeView(), NewQuizView()];

  DateTime backButtonPressed = DateTime.now();

  final bottomNav = BottomNavModel();

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final timePressed = DateTime.now().difference(backButtonPressed);
        final exitWarning = timePressed >= const Duration(seconds: 2);
        backButtonPressed = DateTime.now();

        final String exitMessage;

        if (exitWarning) {
          exitMessage = bottomNav.exit;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                  horizontal: mWidth * 0.2, vertical: mWidth * 0.02),
              elevation: 3,
              dismissDirection: DismissDirection.up,
              duration: const Duration(seconds: 2),
              backgroundColor: kcLightColor,
              content: Align(
                  alignment: Alignment.center,
                  child: AppText(text: exitMessage, fontSize: 14)),
            ),
          );

          // Fluttertoast.showToast(
          //     msg: exitMessage,
          //     fontSize: 15,
          //     gravity: ToastGravity.SNACKBAR,
          //     backgroundColor: kcLightColor);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        body: appScreens[bottomNav.appIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          backgroundColor: kcSplashColor,
          unselectedLabelStyle: GoogleFonts.quicksand(),
          selectedLabelStyle: GoogleFonts.quicksand(),
          unselectedFontSize: 11,
          unselectedItemColor: kcLightColor,
          selectedFontSize: 13,
          selectedItemColor: kcPrimaryColor,
          currentIndex: bottomNav.appIndex,
          onTap: (index) => setState(() => bottomNav.appIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  size: 20,
                ),
                label: bottomNav.home),
            BottomNavigationBarItem(
                icon: const FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: 20,
                ),
                label: bottomNav.addQuiz),
          ],
        ),
      ),
    );
  }
}
