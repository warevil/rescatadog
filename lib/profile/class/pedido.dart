// import 'dart:convert';

// DataProfile profileFromJson(String str) =>
//     DataProfile.fromJson(json.decode(str));

// String profileToJson(DataProfile data) => json.encode(data.toJson());

// class DataProfile {
//   DataProfile({
//     required this.id,
//     required this.firstname,
//     required this.lastname,
//     required this.username,
//     required this.email,
//     required this.phone,
//     required this.address,
//     required this.about,
//     required this.image,
//   });

//   int id;
//   String firstname;
//   String lastname;
//   String username;
//   String email;
//   int phone;
//   String address;
//   String about;
//   String image;

//   factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
//         id: json["id"],
//         firstname: json["firstname"],
//         lastname: json["lastname"],
//         username: json["username"],
//         email: json["email"],
//         phone: json["phone"],
//         address: json["address"],
//         about: json["about"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstname": firstname,
//         "lastname": lastname,
//         "username": username,
//         "email": email,
//         "phone": phone,
//         "address": address,
//         "about": about,
//         "image": image,
//       };
// }
import 'dart:convert';

DataProfile profileFromJson(String str) =>
    DataProfile.fromJson(json.decode(str));

profileToJson(DataProfile data) => json.encode(data.toJson());

class DataProfile {
  DataProfile({
    required this.id,
    required this.user,
    required this.phone,
    required this.address,
    required this.about,
    required this.image,
    required this.creation,
  });

  int id;
  User user;
  int phone;
  String address;
  String about;
  String image;
  DateTime creation;

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json["id"],
        user: User.fromJson(json["user"]),
        phone: json["phone"],
        address: json["address"],
        about: json["about"],
        image: json["image"],
        creation: DateTime.parse(json["creation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "phone": phone,
        "address": address,
        "about": about,
        "image": image,
        "creation": creation.toIso8601String(),
      };
}

class User {
  User({
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.email,
  });

  String first_name;
  String last_name;
  String username;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        first_name: json["first_name"],
        last_name: json["last_name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "last_name": last_name,
        "username": username,
        "email": email,
      };
}
