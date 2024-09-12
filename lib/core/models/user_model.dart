class UserModel {
  String id;
  String name;
  String phone;
  String email;

  UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "phone": phone};
  }
}
