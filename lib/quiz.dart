import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final void Function(int) answerQuestion;
  final int questionIndex;
  const Quiz({
    super.key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Question(questions[questionIndex]["question"] as String),
        ),
        Spacer(),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>).map(
          (answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Answer(
                answer["text"] as String,
                () => answerQuestion(answer['score'] as int),
              ),
            );
          },
        ).toList(),
        Spacer(flex: 2),
      ],
    );
  }
}
