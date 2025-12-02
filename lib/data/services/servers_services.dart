import 'dart:convert';

import 'package:m2i_cours_flutter/data/models/server.dart';
import 'package:m2i_cours_flutter/utils/http_extension_helper.dart';

class ServersServices with HttpExtensionHelper {
  Future<List<Server>> getServers(String userId) async {
    final List<Server> servers = [];
    final response = await getJsonApi(
      endpoints: "/api/servers",
      queryParameters: {"userId": userId},
    );
    if (response.statusCode != 200) return [];
    final data = jsonDecode(response.body);
    if (data['servers'] == null) return [];
    for (final server in data['servers']) {
      servers.add(Server.fromJson(server));
    }
    return servers;
  }
}
