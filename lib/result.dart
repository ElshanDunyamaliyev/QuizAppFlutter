import 'package:first_app/models/quiz_result.dart';
import 'package:first_app/quiz_result_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.correctResultCount, this.quizResult, {super.key});

  final String correctResultCount;
  final List<QuizResult> quizResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              correctResultCount,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            ...quizResult.map((result) {
              return QuizResultCard(result);
            }),
          ],
        ),
      ),
    );
  }
}
