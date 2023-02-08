import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback onSelect;
  const Answer(this.answerText, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
      ),
      onPressed: onSelect,
      child: Text(answerText),
    );
  }
}
