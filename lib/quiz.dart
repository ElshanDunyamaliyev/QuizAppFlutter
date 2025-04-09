import 'package:first_app/models/quiz_question.dart';
import 'package:first_app/models/quiz_result.dart';
import 'package:first_app/question_screen.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';
import 'package:first_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answers = [];
  var correctAnswers = 0;
  List<QuizResult> quizResults = [];
  var activeScreen = 'start-screen';

  void checkIfCorrect(List<String> guessedAnswers) {
    questions.asMap().forEach((i, q) {
      if (q.answers[0] == guessedAnswers[i]) {
        correctAnswers++;
      }
      quizResults.add(
        QuizResult(questions[i].text, guessedAnswers[i], q.answers[0]),
      );
    });
  }

  void answerQuestion(String answer) {
    answers.add(answer);

    if (answers.length == questions.length) {
      setState(() {
        checkIfCorrect(answers);
        answers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void goBackResultScreen() {
    setState(() {
      answers = [];
      correctAnswers = 0;
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen == 'start-screen'
                  ? StartScreen(changeScreen)
                  : activeScreen != 'result-screen'
                  ? QuestionScreen(answerQuestion)
                  : ResultScreen(
                    "You answered $correctAnswers out of ${questions.length} correctly!",
                    quizResults,
                    goBackResultScreen,
                  ),
        ),
      ),
    );
  }
}
