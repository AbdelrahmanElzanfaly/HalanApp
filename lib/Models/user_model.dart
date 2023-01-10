// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel? userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.token,
    this.user,
  });

  final String? token;
  final User? user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.photo,
    this.email,
    this.phone,
    this.enabled,
    this.language,
    this.address,
    this.payment,
    this.completedProfile,
    this.otpCode,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? photo;
  final String? email;
  final String? phone;
  final bool? enabled;
  final String? language;
  final List<Address?>? address;
  final bool? payment;
  final bool? completedProfile;
  final String? otpCode;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    photo: json["photo"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    enabled: json["enabled"],
    language: json["language"],
    address: json["address"] == null? []: List<Address?>.from(json["address"]!.map((x) => Address.fromJson(x))),
    payment: json["payment"],
    completedProfile: json["CompletedProfile"],
    otpCode: json["otpCode"],
    role: json["role"],
    createdAt: json["createdAt"] != null ?DateTime.parse(json["createdAt"]):null,
    updatedAt: json["updatedAt"] != null ?DateTime.parse(json["updatedAt"]):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
    "name": name,
    "email": email,
    "phone": phone,
    "enabled": enabled,
    "language": language,
    "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x!.toJson())),
    "payment": payment,
    "CompletedProfile": completedProfile,
    "otpCode": otpCode,
    "role": role,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Address {
  Address({
    this.id,
    this.name,
    this.street,
    this.city,
    this.postal,
    this.floarNo,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? street;
  final String? city;
  final String? postal;
  final String? floarNo;
  final Location? location;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    street: json["street"],
    city: json["city"],
    postal: json["postal"],
    floarNo: json["floarNo"],
    location: Location.fromJson(json["location"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "street": street,
    "city": city,
    "postal": postal,
    "floarNo": floarNo,
    "location": location!.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Location {
  Location({
    this.cordinates,
    this.fullName,
  });

  final List<String?>? cordinates;
  final String? fullName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    cordinates: json["cordinates"] == null ? [] : List<String?>.from(json["cordinates"]!.map((x) => x)),
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "cordinates": cordinates == null ? [] : List<dynamic>.from(cordinates!.map((x) => x)),
    "fullName": fullName,
  };
}
