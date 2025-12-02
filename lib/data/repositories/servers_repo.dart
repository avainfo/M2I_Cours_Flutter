import 'package:m2i_cours_flutter/data/global_data.dart';
import 'package:m2i_cours_flutter/data/models/server.dart';
import 'package:m2i_cours_flutter/data/services/servers_services.dart';

class ServersRepo {
  static Future<List<Server>> getServers({String userId = GlobalData.USER_ID}) async {
    return await ServersServices().getServers(userId);
  }
}
