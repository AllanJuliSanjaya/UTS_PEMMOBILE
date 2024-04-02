import 'package:flutter/material.dart';
import 'halaman_quiz.dart';

class QuizMaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HalamanQuiz(),
          ),
        ),
      ),
    );
  }
}
