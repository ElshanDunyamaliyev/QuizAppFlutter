import 'package:first_app/models/quiz_result.dart';
import 'package:flutter/material.dart';

class QuizResultCard extends StatelessWidget {
  const QuizResultCard(this.quizResult, {super.key});

  final QuizResult quizResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(
            "Question: ${quizResult.question}",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "Your Answer: ${quizResult.yourAnswer}",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "Actual Answer: ${quizResult.actualAnswer}",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
