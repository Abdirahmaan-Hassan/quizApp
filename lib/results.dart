import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.answer, required this.falses});

  final int answer;
  final int falses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "the correct answers are: $answer",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "the incorrect answers are: $falses",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
