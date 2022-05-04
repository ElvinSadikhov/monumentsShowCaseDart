import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/quiz_response.dart';
import 'package:monuments_app/services/quiz_service.dart';

class SecondScreen extends StatefulWidget {
  final int index;

  const SecondScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState(uid: index);
}

class _SecondScreenState extends State<SecondScreen> {
  QuizService quizService = QuizService();
  QuizResponse quizResponse = QuizResponse(questions: []);
  final int uid;

  _SecondScreenState({required this.uid});

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
        ),
        body: ListView.builder(
            itemCount: quizResponse.questions.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text("uid = ${quizResponse.questions[index].uid}"),
                  Text(quizResponse.questions[index].title),
                  // Text(quizResponse.questions[index].correctAnswer.toString()),
                  Text(
                      "Answers: ${quizResponse.questions[index].answers.join(",")}")
                ],
              );
            }));
  }
}













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