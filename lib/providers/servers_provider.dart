import 'package:flutter/cupertino.dart';
import 'package:m2i_cours_flutter/data/models/Server.dart';

class ServersProvider with ChangeNotifier {
  List<Server> servers = [];

  void updateServers(List<Server> newServers) {
    servers = newServers;
    notifyListeners();
  }
}