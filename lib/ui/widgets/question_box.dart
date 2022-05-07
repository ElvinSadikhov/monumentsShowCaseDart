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
  State<QuestionBox> createState() => _QuestionBoxState(
        questionAnswers: this.questionAnswers,
        correctAnswer: this.correctAnswer,
        questionLabel: this.questionLabel,
        questionNumber: this.questionNumber,
      );
}

class _QuestionBoxState extends State<QuestionBox> {
  final int questionNumber;
  final String questionLabel;
  final List<Answer> questionAnswers;
  final Answer correctAnswer;

  bool isChosen = false;

  List<Color> backgroundColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  _QuestionBoxState({
    required this.questionNumber,
    required this.questionLabel,
    required this.questionAnswers,
    required this.correctAnswer,
  });

  @override
  void initState() {
    super.initState();
    this.questionAnswers.shuffle();
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
                      "Question${this.questionNumber}:  ${this.questionLabel}",
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
                            if (this.isCorrectAnswer(
                                this.questionAnswers[index].stringValue)) {
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
                          answer: this.questionAnswers[index].stringValue,
                          borderRadius: BorderRadius.circular(20),
                          isCorrect: this.isCorrectAnswer(
                              this.questionAnswers[index].stringValue),
                          backgroundColor: this.backgroundColors[index],
                        ),
                      ),
                    ))
                .toList(),
      ),
    );
  }

  bool isCorrectAnswer(String answer) {
    return answer == this.correctAnswer.stringValue ? true : false;
  }
}

/////////////////////////////////////////////

// class QuestionBox1 extends StatelessWidget {
//   final int questionNumber;
//   final String questionLabel;
//   final List<String> questionAnswers;
//   final String correctAnswer;

//   bool isVariantChosen = false;
//   Color backhroundColor = Colors.white;

//   QuestionBox1(
//       {Key? key,
//       required this.questionNumber,
//       required this.questionLabel,
//       required this.questionAnswers,
//       required this.correctAnswer})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "Question${this.questionNumber}:  ${this.questionLabel}",
//           style: const TextStyle(fontSize: 22),
//         ),
//         GestureDetector(
//           onTap: () {
//             if (!this.isVariantChosen) {
//               this.backhroundColor =
//                   this.isCorrectAnswer(this.questionAnswers[0])
//                       ? Colors.green
//                       : Colors.red;
//               this.isVariantChosen = true;
//             }
//           },
//           child: AnswerBox1(
//               answer: this.questionAnswers[0],
//               borderRadius: BorderRadius.circular(20),
//               answerNumber: 1,
//               backgroundColor: this.backhroundColor),
//         ),
//         GestureDetector(
//           onTap: () {
//             if (!this.isVariantChosen) {
//               this.backhroundColor =
//                   this.isCorrectAnswer(this.questionAnswers[1])
//                       ? Colors.green
//                       : Colors.red;
//               this.isVariantChosen = true;
//             }
//           },
//           child: AnswerBox1(
//               answer: this.questionAnswers[1],
//               borderRadius: BorderRadius.circular(20),
//               answerNumber: 1,
//               backgroundColor: this.backhroundColor),
//         ),
//         GestureDetector(
//           onTap: () {
//             if (!this.isVariantChosen) {
//               this.backhroundColor =
//                   this.isCorrectAnswer(this.questionAnswers[2])
//                       ? Colors.green
//                       : Colors.red;
//               this.isVariantChosen = true;
//             }
//           },
//           child: AnswerBox1(
//               answer: this.questionAnswers[2],
//               borderRadius: BorderRadius.circular(20),
//               answerNumber: 1,
//               backgroundColor: this.backhroundColor),
//         ),
//         GestureDetector(
//           onTap: () {
//             if (!this.isVariantChosen) {
//               this.backhroundColor =
//                   this.isCorrectAnswer(this.questionAnswers[3])
//                       ? Colors.green
//                       : Colors.red;
//               this.isVariantChosen = true;
//             }
//           },
//           child: AnswerBox1(
//               answer: this.questionAnswers[3],
//               borderRadius: BorderRadius.circular(20),
//               answerNumber: 1,
//               backgroundColor: this.backhroundColor),
//         ),
//       ],
//     );
//   }

//   bool isCorrectAnswer(String answer) {
//     return answer == this.correctAnswer ? true : false;
//   }
// }
