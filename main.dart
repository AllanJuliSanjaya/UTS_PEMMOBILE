import 'package:flutter/material.dart';
import 'quiz.dart'; // Mengimpor file halaman_quiz.dart

void main() {
  runApp(
    QuizMaba(),
  );
}

class QuizMaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HalamanQuiz(), // Menggunakan HalamanQuiz dari file terpisah
          ),
        ),
      ),
    );
  }
}
