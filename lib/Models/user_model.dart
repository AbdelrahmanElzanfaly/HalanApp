
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.token,
    this.user,
    this.role,
  });

  final String? token;
  final User? user;
  final String? role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
    "role": role,
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
    this.nationality,
    this.onApp,
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
  final String? nationality;
  final bool? onApp;
  final String? otpCode;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    email: json["email"],
    phone: json["phone"],
    enabled: json["enabled"],
    language: json["language"],
    nationality: json["nationality"],
    onApp: json["onApp"],
    otpCode: json["otpCode"],
    role: json["role"],
    createdAt:  json["createdAt"] == null? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "email": email,
    "phone": phone,
    "enabled": enabled,
    "language": language,
    "nationality": nationality,
    "onApp": onApp,
    "otpCode": otpCode,
    "role": role,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
