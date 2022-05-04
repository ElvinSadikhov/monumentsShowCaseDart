import 'package:monuments_app/models/enums/api_schema.dart';

extension ApiSchemaDefiner on ApiSchema {
  String get stringValue {
    switch (this) {
      case ApiSchema.HTTP:
        return "http";
      case ApiSchema.HTTPS:
        return "https";
      default:
        return "https";
    }
  }
}
