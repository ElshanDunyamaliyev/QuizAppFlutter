import 'package:first_app/answer_button.dart';
import 'package:first_app/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.answerQuestion, {super.key});

  final void Function(String answer) answerQuestion;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;
  QuizQuestion get currentQuestion => questions[currentIndex];

  void getNextQuestion(String answer) {
    widget.answerQuestion(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ...currentQuestion.getShuffledList().map((answer) {
            return AnswerButton(answer, () {
              getNextQuestion(answer);
            });
          }),
        ],
      ),
    );
  }
}
