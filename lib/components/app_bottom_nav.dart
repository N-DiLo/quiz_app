import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/app_colors.dart';
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
  int appIndex = 0;
  final appScreens = [const HomeView(), const NewQuizView()];

  DateTime backButtonPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final timePressed = DateTime.now().difference(backButtonPressed);
        final exitWarning = timePressed >= const Duration(seconds: 2);
        backButtonPressed = DateTime.now();

        if (exitWarning) {
          const exitMessage = 'Click again to exit';

          Fluttertoast.showToast(
              msg: exitMessage,
              fontSize: 15,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: kcLightColor);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        body: appScreens[appIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kcPrimaryColor,
          unselectedLabelStyle: GoogleFonts.quicksand(),
          selectedLabelStyle: GoogleFonts.quicksand(),
          unselectedFontSize: 13,
          unselectedItemColor: kcLightColor,
          selectedFontSize: 13,
          selectedItemColor: kcSplashColor,
          currentIndex: appIndex,
          onTap: (index) => setState(() => appIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.edit), label: 'Add New Quiz'),
          ],
        ),
      ),
    );
  }
}
