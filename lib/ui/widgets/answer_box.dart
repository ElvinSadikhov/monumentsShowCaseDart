// ignore_for_file: unnecessary_this, unnecessary_string_interpolations, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:monuments_app/utils/helper/widget_method.dart';

class AnswerBox2 extends StatefulWidget {
  final int answerNumber;
  final String answer;
  final BorderRadius borderRadius;
  final bool isCorrect;

  const AnswerBox2(
      {Key? key,
      required this.answer,
      required this.borderRadius,
      required this.answerNumber,
      required this.isCorrect})
      : super(key: key);

  @override
  State<AnswerBox2> createState() => _AnswerBox2State(
      answer: this.answer,
      answerNumber: this.answerNumber,
      borderRadius: this.borderRadius,
      isCorrect: this.isCorrect);
}

class _AnswerBox2State extends State<AnswerBox2> {
  final int answerNumber;
  final String answer;
  final BorderRadius borderRadius;
  final bool isCorrect;

  late Color backgroundColor;
  late bool isChosen;

  _AnswerBox2State(
      {Key? key,
      required this.answer,
      required this.borderRadius,
      required this.answerNumber,
      required this.isCorrect});

  @override
  void initState() {
    super.initState();

    this.backgroundColor = Colors.white;
    this.isChosen = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.isChosen) {
          setState(() {
            this.backgroundColor = this.isCorrect ? Colors.green : Colors.red;
            this.isChosen = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            color: this.backgroundColor,
            child: Row(
              children: [
                Text(
                  "${this.answerNumber})",
                  style: const TextStyle(fontSize: 14),
                ),
                WidgetMethods.horizontalSpace(10),
                Text(
                  "${this.answer}",
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////

class AnswerBox extends StatelessWidget {
  final int answerNumber;
  final String answer;
  final BorderRadius borderRadius;

  final Color backgroundColor;

  const AnswerBox(
      {Key? key,
      required this.answer,
      required this.borderRadius,
      required this.answerNumber,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ClipRRect(
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
      ),
    );
  }
}
