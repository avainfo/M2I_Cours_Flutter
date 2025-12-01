class Server {
  final String id;
  final String ownerId;
  final String name;
  final String imageUrl;

  Server(this.id, this.ownerId, this.name, this.imageUrl);

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    json["id"],
    json["ownerId"],
    json["name"],
    json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ownerId": ownerId,
    "name": name,
    "imageUrl": imageUrl,
  };

  @override
  String toString() {
    return "Server(id: $id, ownerId: $ownerId, name: $name, imageUrl: $imageUrl)";
  }
}
