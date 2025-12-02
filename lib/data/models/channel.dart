class Channel {
  final String id;
  final String serverId;
  final String name;
  final String type;

  Channel(this.id, this.serverId, this.name, this.type);

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    json["id"],
    json["serverId"],
    json["name"],
    json["type"],
  );

  @override
  String toString() {
    return "Channel(id: $id, serverId: $serverId, name: $name, type: $type)";
  }
}
