import 'package:flutter/material.dart';
import 'package:quiz_app/model/plan_provider.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/view/plan_creator_screen.dart';
import 'package:quiz_app/view/plan_screen.dart';

void main() => runApp(MyApp());

const questions = [
  {
    "questionText": "Dart хэлийг анх хэзээ олон нийтэд танилцуулсан вэ?",
    "answer": [
      {"text": "2010", "score": 0},
      {"text": "2011", "score": 1},
      {"text": "2012", "score": 0},
      {"text": "2013", "score": 0},
      {"text": "2014", "score": 0}
    ]
  },
  {
    "questionText": "Flutter-н 1.0 хувилбар хэзээ гарсан вэ?",
    "answer": [
      {"text": "2015 оны 10 сар", "score": 0},
      {"text": "2016 оны 03 сар", "score": 0},
      {"text": "2018 оны 12 сар", "score": 1}
    ],
  }
];

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;
  int totalScore = 0;
  void questionAnswer(int score) {
    totalScore += score;
    setState(() {
      // if (questionIndex < questions.length - 1) {
      questionIndex += 1;
      // }
      // else {questionIndex = 0;}
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PlanProvider(child: PlanCreatorScreen(),),
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Quiz App"),
    //   ),
    //   body: questionIndex < questions.length
    //       ? Quiz(questionIndex, questions, questionAnswer)
    //       : Result(totalScore, resetQuiz),
    // )
    );
  }
}
