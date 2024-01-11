// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.address,
    required this.universityName,
    required this.classes,
    required this.id,
  });

  final String address;
  final String universityName;
  final String classes;
  final String id;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        address: json["Address"],
        universityName: json["University_name"],
        classes: json["classes"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "University_name": universityName,
        "classes": classes,
        "id": id,
      };
}
