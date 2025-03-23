class Character {
  late int charId;
  late String name;
  late String image;
  late String status;
  Character.fromJson(Map<String, dynamic> json) {
    charId = json["id"];
    name = json["name"];
    image = json["image"];
    status = json["status"];
  }
}