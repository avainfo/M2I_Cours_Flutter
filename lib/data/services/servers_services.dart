import 'package:m2i_cours_flutter/data/models/server.dart';
import 'package:m2i_cours_flutter/utils/http_extension_helper.dart';
import 'package:m2i_cours_flutter/utils/response_extension.dart';

class ServersServices with HttpExtensionHelper {
  Future<List<Server>> getServers(String userId) async {
    final List<Server> servers = [];
    final response = await getJsonApi(
      endpoints: "/servers",
      queryParameters: {"userId": userId},
    );
    if (!response.succeed || response.jsonBody['servers'] == null) return [];
    for (final server in response.jsonBody['servers']) {
      servers.add(Server.fromJson(server));
    }
    return servers;
  }
}
