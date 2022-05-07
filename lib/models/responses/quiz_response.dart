// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

List<QuizResponse> quizFromJson(String str) => List<QuizResponse>.from(
    json.decode(str).map((x) => QuizResponse.fromJson(x)));

String quizToJson(List<QuizResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizResponse {
  QuizResponse({
    required this.questions,
  });

  final List<Question> questions;

  factory QuizResponse.fromJson(List<dynamic> json) {
    return QuizResponse(
        questions: List<Question>.from(json.map((x) => Question.fromJson(x))));
  }

  List<dynamic> toJson() =>
      List<dynamic>.from(questions.map((x) => x.toJson()));
}

class Question {
  Question({
    required this.uid,
    required this.title,
    required this.correctAnswer,
    required this.answers,
  });

  final int uid;
  final String title;
  final Answer correctAnswer;
  final List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        uid: json["uid"],
        title: json["title"],
        correctAnswer: Answer.fromJson(json["correctAnswer"]),
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "correctAnswer": correctAnswer.toJson(),
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.uid,
    required this.stringValue,
  });

  final int uid;
  final String stringValue;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        uid: json["uid"],
        stringValue: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "value": stringValue,
      };

  @override
  String toString() => stringValue;
}
