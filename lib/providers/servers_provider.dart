import 'package:flutter/cupertino.dart';
import 'package:m2i_cours_flutter/data/models/Server.dart';

class ServersProvider with ChangeNotifier {
  List<Server> servers = [];
  Server? selectedServer;

  void updateServers(List<Server> newServers) {
    servers = newServers;
    notifyListeners();
  }

  void updateSelectedServers(Server server) {
    selectedServer = server;
    notifyListeners();
  }
}