import 'package:flutter/material.dart';

import 'package:quizapp/results.dart';
import 'package:quizapp/questions.dart';

class quizapp extends StatefulWidget {
  const quizapp({super.key});

  @override
  State<quizapp> createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  // List<String> questions = [
  //   'Somalia waxay ku taalaa geeska africa',
  //   'jamhuuriya waxa ay bixisaa kuliya sharea&law',
  //   'ca202 waa fasalka ugu fican fasalada'
  // ];
  // List<bool> answers = [true, false, true];
  List<Questions> questions = [
    Questions(q: 'Somalia waxay ku taalaa geeska africa', a: true),
    Questions(q: 'jamhuuriya waxa ay bixisaa kuliya sharea&law', a: false),
    Questions(q: '2+2=4', a: true)
  ];

  int questionIndex = 0;
  int correctAnswers = 0;
  int falseAnswers = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz App'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questions[questionIndex].questionName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2.0,
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 22, right: 22),
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      final isCorrect = questions[questionIndex].questionAnswer;

                      if (isCorrect == true) {
                        print("waa sax");
                        setState(() {
                          correctAnswers += 1;
                        });
                      } else {
                        print("waa qalad");
                        setState(() {
                          falseAnswers += 1;
                        });
                      }
                      setState(() {
                        if (questionIndex < questions.length - 1)
                          questionIndex++;
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(
                                  answer: correctAnswers, falses: falseAnswers),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      "True",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 22, right: 22, bottom: 25),
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      final isFalse = questions[questionIndex].questionAnswer;

                      if (isFalse == false) {
                        print("waa sax");
                        setState(
                          () {
                            correctAnswers += 1;
                          },
                        );
                      } else {
                        print("waa qalad");
                        setState(
                          () {
                            falseAnswers += 1;
                          },
                        );
                      }
                      setState(() {
                        if (questionIndex < questions.length - 1)
                          questionIndex++;
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Result(
                                    answer: correctAnswers,
                                    falses: falseAnswers);
                              },
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      "False",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
