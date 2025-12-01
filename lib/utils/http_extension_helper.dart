import 'package:m2i_cours_flutter/data/global_data.dart';

import 'package:http/http.dart' as http;

mixin HttpExtensionHelper {
  Future<http.Response> getJsonApi({
    required String endpoints,
    Map<String, String> queryParameters = const {},
  }) async {
    final response = await http.get(
      Uri.https(GlobalData.BASE_URL, endpoints, queryParameters),
    );
    return response;
  }
}
