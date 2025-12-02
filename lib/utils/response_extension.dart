import 'dart:convert';

import 'package:http/http.dart' as http;

extension ResponseExtension on http.Response {
  dynamic get jsonBody => jsonDecode(body);
  bool get succeed => statusCode == 200;
}
