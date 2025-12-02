import 'package:flutter/cupertino.dart';
import 'package:m2i_cours_flutter/data/models/channel.dart';
import 'package:m2i_cours_flutter/data/models/server.dart';
import 'package:m2i_cours_flutter/data/repositories/channels_repo.dart';

class ServersProvider with ChangeNotifier {
  List<Server> servers = [];
  List<Channel> channels = [];
  Server? selectedServer;

  void updateServers(List<Server> newServers) {
    servers = newServers;
    // TODO : remove this sort
    servers.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void updateSelectedServers(Server server) {
    selectedServer = server;
    notifyListeners();
    ChannelsRepo.getChannels(serverID: selectedServer!.id).then((channelsList) {
      channels = channelsList;
      notifyListeners();
    });
  }
}
