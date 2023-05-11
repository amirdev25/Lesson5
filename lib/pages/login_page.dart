import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson5/data/constants.dart';
import 'package:lesson5/pages/home_page.dart';
import 'package:lesson5/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String mLogin = "amirdev";
  String mPassword = "aka25";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            child: CustomTextField(
              controller: loginController,
              label: "Login",
              icon: const Icon(Icons.lock),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: CustomTextField(
              controller: passwordController,
              label: "Password",
              icon: const Icon(Icons.key),
            ),
          ),
          GestureDetector(
            onTap: () {
              saveToLocalStorage(
                login: loginController.text,
                password: passwordController.text,
                context: context,
              );
            },
            child: Container(
              height: 56.0,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              child: const Text(
                "Kirish",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //SOLID, DRY, clean architecture
  // Don't Repeat Yourself

  void saveToLocalStorage({
    required login,
    required password,
    required BuildContext context,
  }) async {
    if (login == mLogin && password == mPassword) {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool(Constants.IS_LOGIN, true).then((value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      });
    } else {
      loginController.text = "";
      passwordController.text = "";
    }
  }
}
