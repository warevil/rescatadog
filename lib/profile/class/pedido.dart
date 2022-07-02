import 'dart:convert';

DataProfile profileFromJson(String str) =>
    DataProfile.fromJson(json.decode(str));

String profileToJson(DataProfile data) => json.encode(data.toJson());

class DataProfile {
  DataProfile({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.image,
  });

  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  int phone;
  String address;
  String about;
  String image;

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        about: json["about"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "phone": phone,
        "address": address,
        "about": about,
        "image": image,
      };
}
