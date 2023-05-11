import 'package:flutter/material.dart';
import 'package:lesson5/data/constants.dart';
import 'package:lesson5/pages/home_page.dart';
import 'package:lesson5/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToNextPage(context);

    return const Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }

  void navigateToNextPage(BuildContext context) async {
    final sharedPref = await SharedPreferences.getInstance();
    bool? isLogin = sharedPref.getBool(Constants.IS_LOGIN);
    Future.delayed(const Duration(seconds: 3), () {
      if (isLogin == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      }
    });
  }
}
