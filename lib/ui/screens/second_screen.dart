// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/quiz_response.dart';
import 'package:monuments_app/services/quiz_service.dart';
import 'package:monuments_app/ui/widgets/question_box.dart';
import 'package:monuments_app/utils/helper/widget_method.dart';

class SecondScreen extends StatefulWidget {
  final int index;

  final String monumentName;

  const SecondScreen(
      {Key? key, required this.index, required this.monumentName})
      : super(key: key);

  @override
  State<SecondScreen> createState() =>
      // ignore: no_logic_in_create_state
      _SecondScreenState(uid: index, monumentName: monumentName);
}

class _SecondScreenState extends State<SecondScreen> {
  QuizService quizService = QuizService();
  QuizResponse quizResponse = QuizResponse(questions: []);
  final int uid;

  final String monumentName;

  _SecondScreenState({required this.uid, required this.monumentName});

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    quizResponse = await quizService.getQuestions(uid);
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    // NEED TO USE FUTUREBUILDER AS IT IS NOT SHOWING ANY REPONSE WITHOUT HOT RELOAD
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                "Questions related to ${this.monumentName}",
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const Divider(
              color: Colors.black87,
              thickness: 2,
              indent: 12,
              endIndent: 12,
            ),
            WidgetMethods.verticalSpace(15),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                quizResponse.questions.isEmpty
                    ? Container()
                    : QuestionBox(
                        questionNumber: 1,
                        questionLabel: quizResponse.questions[0].title,
                        questionAnswers: (quizResponse.questions[0].answers +
                            [quizResponse.questions[0].correctAnswer]),
                        correctAnswer: quizResponse.questions[0].correctAnswer),
                quizResponse.questions.isEmpty
                    ? Container()
                    : QuestionBox(
                        questionNumber: 2,
                        questionLabel: quizResponse.questions[1].title,
                        questionAnswers: (quizResponse.questions[1].answers +
                            [quizResponse.questions[1].correctAnswer]),
                        correctAnswer: quizResponse.questions[1].correctAnswer),
              ],
            ))),
          ],
        ));
  }
}

















// return Column(
//                 children: [
//                   Text("uid = ${quizResponse.questions[index].uid}"),
//                   Text(quizResponse.questions[index].title),
//                   // Text(quizResponse.questions[index].correctAnswer.toString()),
//                   Text(
//                       "Answers: ${quizResponse.questions[index].answers.join(",")}")
//                 ],
//               );

// class SecondScreen extends StatelessWidget {
//   final String desciption;

//   const SecondScreen({Key? key, required this.desciption}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Quiz section"),
//       ),
//       body: Center(
//         child: GestureDetector(
//             // need to get rid of later
//             onDoubleTap: () {
//               Navigator.pop(context);
//             },
//             child: Column(
//               children: [
//                 Text(this.desciption),
//               ],
//             )),
//       ),
//     );
//   }
// }
