import 'package:monuments_app/models/responses/quiz_response.dart';
import 'package:monuments_app/services/base_service.dart';

class QuizService extends BaseService {
  QuizService() : super("quiz");

  Future<QuizResponse> getQuestions(int index) async {
    late QuizResponse _response;

    try {
      var _dioResonse = await dio.post(serviceBuilder.add("question").build(),
          options: options, data: {"monumentUid": index});

      // print(_dioResonse);

      _response = QuizResponse.fromJson(_dioResonse.data);
    } catch (e) {
      // error handling
      // print("bruh");
      throw Exception(e.toString());
    }

    return _response;
  }
}

// void main() {
//   QuizService obj = QuizService();
//   obj.getQuestions(1);
// }
