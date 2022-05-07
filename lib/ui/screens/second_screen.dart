// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/quiz_response.dart';
import 'package:monuments_app/services/quiz_service.dart';
import 'package:monuments_app/ui/widgets/question_box.dart';
import 'package:monuments_app/utils/helper/widget_method.dart';

class SecondScreen extends StatefulWidget {
  final int uid;

  final String monumentName;

  const SecondScreen({Key? key, required this.uid, required this.monumentName})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  QuizService quizService = QuizService();
  late Future<QuizResponse> quizResponse;

  _SecondScreenState();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    quizResponse = quizService.getQuestions(this.widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: FutureBuilder<QuizResponse>(
            future: quizResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Text(
                        "Questions related to ${this.widget.monumentName}",
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
                      children: [0, 1, 2, 3, 4]
                          .map((index) => QuestionBox(
                              questionNumber: index + 1,
                              questionLabel:
                                  snapshot.data!.questions[index].title,
                              questionAnswers:
                                  (snapshot.data!.questions[index].answers +
                                      [
                                        snapshot.data!.questions[index]
                                            .correctAnswer
                                      ]),
                              correctAnswer: snapshot
                                  .data!.questions[index].correctAnswer))
                          .toList(),
                    ))),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("Some error occured!");
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
