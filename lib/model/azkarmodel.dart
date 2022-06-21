class Azkarmodel {
  int? id;
  String? name;
  Azkarmodel(this.id, this.name);

  Azkarmodel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
