// To parse this JSON data, do
//
//     final deviceDataModel = deviceDataModelFromMap(jsonString);

import 'dart:convert';

class DeviceDataModel {
  DeviceDataModel({
    this.imei,
    this.device,
    this.token,
  });

  final String? imei;
  final String? device;
  final String? token;

  factory DeviceDataModel.fromJson(String str) => DeviceDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeviceDataModel.fromMap(Map<String, dynamic> json) => DeviceDataModel(
    imei: json["session-id"],
    device: json["device"],
    token: json["token"],
  );

  Map<String, String> toMap() => {
    "session-id": imei??"",
    "device": device??"",
    "token": token??"",
  };
}