// ignore_for_file: unnecessary_this, unnecessary_string_interpolations, no_logic_in_create_state

import 'package:flutter/material.dart';

class AnswerBox2 extends StatefulWidget {
  final String answer;
  final BorderRadius borderRadius;
  final bool isCorrect;
  final Color backgroundColor;

  const AnswerBox2({
    Key? key,
    required this.answer,
    required this.borderRadius,
    required this.isCorrect,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<AnswerBox2> createState() => _AnswerBox2State(
      answer: this.answer,
      borderRadius: this.borderRadius,
      isCorrect: this.isCorrect,
      backgroundColor: this.backgroundColor);
}

class _AnswerBox2State extends State<AnswerBox2> {
  final String answer;
  final BorderRadius borderRadius;
  final bool isCorrect;

  final Color backgroundColor;
  late bool isChosen;

  _AnswerBox2State({
    Key? key,
    required this.answer,
    required this.borderRadius,
    required this.isCorrect,
    required this.backgroundColor,
  });

  @override
  void initState() {
    super.initState();

    this.isChosen = false;
  }

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

///////////////////////////////////////////////////////////////

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
