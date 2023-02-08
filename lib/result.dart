import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback onReset;
  const Result(this.resultScore, this.onReset, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 6),
        Text(
          'Your Score: $resultScore',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 6),
        TextButton(
          onPressed: onReset,
          style: TextButton.styleFrom(
            foregroundColor: Colors.redAccent,
          ),
          child: Text(
            'Restart Quiz!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
