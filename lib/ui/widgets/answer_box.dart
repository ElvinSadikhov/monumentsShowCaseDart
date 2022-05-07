// ignore_for_file: unnecessary_this, unnecessary_string_interpolations, no_logic_in_create_state

import 'package:flutter/material.dart';

class AnswerBox extends StatelessWidget {
  final String answer;
  final BorderRadius borderRadius;
  final bool isCorrect;

  final Color backgroundColor;

  const AnswerBox(
      {Key? key,
      required this.answer,
      required this.borderRadius,
      required this.isCorrect,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: 50,
        color: this.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Center(
            child: Text(
              "${this.answer}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
