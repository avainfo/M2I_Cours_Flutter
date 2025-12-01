import 'package:flutter_test/flutter_test.dart';
import 'package:m2i_cours_flutter/data/models/Server.dart';
import 'package:m2i_cours_flutter/data/repositories/servers_repo.dart';

void main() {
  test("Test de l'API servers", () async {
    final List<Server> servers = await ServersRepo.getServers();
    expect(servers, []);
    final List<Server> serversById = await ServersRepo.getServers(
      userId: "user123",
    );
    expect(serversById, isNot([]));
    print(serversById);
  });
}
