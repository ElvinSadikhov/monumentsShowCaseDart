// ignore_for_file: unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/quiz_response.dart';
import 'package:monuments_app/ui/widgets/answer_box.dart';
import 'package:monuments_app/utils/helper/widget_method.dart';

class QuestionBox extends StatefulWidget {
  final int questionNumber;
  final String questionLabel;
  final List<Answer> questionAnswers;
  final Answer correctAnswer;

  const QuestionBox(
      {Key? key,
      required this.questionNumber,
      required this.questionLabel,
      required this.questionAnswers,
      required this.correctAnswer})
      : super(key: key);

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  bool isChosen = false;

  List<Color> backgroundColors =
      List<Color>.filled(4, Colors.white, growable: false);

  _QuestionBoxState();

  @override
  void initState() {
    super.initState();
    this.widget.questionAnswers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      "Question${this.widget.questionNumber}:  ${this.widget.questionLabel}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    WidgetMethods.verticalSpace(10)
                  ],
                ),
              )
            ] +
            [0, 1, 2, 3]
                .map((index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          if (!this.isChosen) {
                            if (this.isCorrectAnswer(this
                                .widget
                                .questionAnswers[index]
                                .stringValue)) {
                              this.backgroundColors[index] = Colors.green;
                            } else {
                              this.backgroundColors[index] = Colors.red;
                            }
                            setState(() {
                              this.isChosen = true;
                            });
                          }
                        },
                        child: AnswerBox(
                          answer:
                              this.widget.questionAnswers[index].stringValue,
                          borderRadius: BorderRadius.circular(20),
                          isCorrect: this.isCorrectAnswer(
                              this.widget.questionAnswers[index].stringValue),
                          backgroundColor: this.backgroundColors[index],
                        ),
                      ),
                    ))
                .toList(),
      ),
    );
  }

  bool isCorrectAnswer(String answer) {
    return answer == this.widget.correctAnswer.stringValue ? true : false;
  }
}
