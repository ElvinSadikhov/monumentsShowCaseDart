import 'package:monuments_app/constants/api_consts.dart';
import 'package:monuments_app/models/enums/api_level.dart';
import 'package:monuments_app/models/enums/api_schema.dart';
import 'package:monuments_app/utils/extentions/api_level_definer.dart';
import 'package:monuments_app/utils/extentions/api_schema_definer.dart';

class EndpointBuilder {
  String _apiScheme = "";
  String _domain = "";
  String _endpointBase = "";
  List<String> _args = [];
  List<String> _savedArgs = [];

  EndpointBuilder() {
    _setDefaultBase();
  }

  void _setDefaultBase() {
    _apiScheme = ApiSchema.HTTPS.stringValue;
    _domain = ApiLevel.DEVELOPMENT.getBaseUrl;
    _updateEndpointBase();
  }

  EndpointBuilder setScheme({ApiSchema? scheme}) {
    _apiScheme = scheme!.stringValue;
    _updateEndpointBase();
    return this;
  }

  EndpointBuilder setDomain({String? domain}) {
    _domain = domain ?? ApiLevel.DEVELOPMENT.getBaseUrl;
    _updateEndpointBase();
    return this;
  }

  void _updateEndpointBase() {
    _endpointBase = "$_apiScheme://$_domain/${ApiConsts.apiIdentifier}";
  }

  EndpointBuilder add(String value) {
    _args.add(value);
    return this;
  }

  String build() {
    String toReturn = _getFullLink();
    reset();
    return toReturn;
  }

  // here is the problem
  String _getFullLink() {
    return _args.isEmpty
        ? _endpointBase
        : _endpointBase + "/" + _args.join("/");
  }

  EndpointBuilder reset() {
    _args
      ..clear()
      ..addAll(_savedArgs);

    return this;
  }

  EndpointBuilder resetAll() {
    _setDefaultBase();
    _args.clear();
    _savedArgs.clear();
    return this;
  }

  EndpointBuilder save() {
    _savedArgs
      ..clear()
      ..addAll(_args);
    return this;
  }
}
