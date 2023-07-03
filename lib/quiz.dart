import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List questions;
  final Function questionAnswer;

  const Quiz(this.questionIndex, this.questions, this.questionAnswer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15, top: 15),
          width: double.infinity,
          child: Text(
            "Асуулт ${questionIndex + 1}/${questions.length}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          color: Colors.lightBlueAccent,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            questions[questionIndex]["questionText"].toString(),
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        // Answer(questionAnswer, "answerText")
        for (Map answer in questions[questionIndex]["answer"] as List)
          Answer(()=>questionAnswer(answer["score"]), answer["text"]),
      ],
    );
  }
}
