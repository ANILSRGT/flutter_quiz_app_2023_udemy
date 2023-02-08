import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", 'score': 3},
        {"text": "White", 'score': 1}
      ],
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", 'score': 5},
        {"text": "Lion", 'score': 9}
      ],
    },
    {
      "question": "Who's your favorite instructor?",
      "answers": [
        {"text": "Max", "score": 1},
        {"text": "John", "score": 1},
        {"text": "Mick", 'score': 1},
        {"text": "Son", 'score': 1}
      ],
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
