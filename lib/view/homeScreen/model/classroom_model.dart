// To parse this JSON data, do
//
//     final classroomModel = classroomModelFromJson(jsonString);

import 'dart:convert';

import 'package:students/view/homeScreen/model/i_students.dart';

ClassroomModel classroomModelFromJson(String str) =>
    ClassroomModel.fromJson(json.decode(str) as Map<String, dynamic>);

String classroomModelToJson(ClassroomModel data) => json.encode(data.toJson());

class ClassroomModel implements iClassroomModel {
  ClassroomModel({
    required this.classrooms,
  });

  List<Classroom> classrooms;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        classrooms: List<Classroom>.from(
            json["classrooms"].map((x) => Classroom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
      };

  @override
  List<Classroom> get iData => classrooms;
}

class Classroom {
  Classroom({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  int id;
  String layout;
  String name;
  int size;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
      };
}
