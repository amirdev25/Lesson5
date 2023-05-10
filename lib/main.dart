import 'package:flutter/material.dart';
import 'package:lesson5/pages/home_page.dart';

void main() {
  runApp(const Lesson5());
}

class Lesson5 extends StatelessWidget {
  const Lesson5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
