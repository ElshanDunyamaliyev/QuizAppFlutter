import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset("assets/images/quiz-logo.png", width: 250),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Learn The Flutter fun way",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: changeScreen,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.arrow_right_alt),
                label: Text("Start quiz"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
