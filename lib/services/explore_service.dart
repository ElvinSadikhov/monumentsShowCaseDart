import 'package:monuments_app/models/responses/monument_response.dart';
import 'package:monuments_app/services/base_service.dart';

class ExploreService extends BaseService {
  ExploreService() : super("explore");

  Future<MonumentResponse> getMonuments() async {
    late MonumentResponse _response;

    try {
      var _dioResponse = await dio.get(
        serviceBuilder.add("monuments").build(),
        options: options,
      );

      print(_dioResponse);

      _response = MonumentResponse.fromJson(_dioResponse.data);
    } catch (e) {
      // error handling

      _response = MonumentResponse(monuments: []);
      throw Exception(e.toString());
    }

    return _response;
  }
}

// void main() {
//   ExploreService obj = ExploreService();
//   obj.getMonuments();
// }
