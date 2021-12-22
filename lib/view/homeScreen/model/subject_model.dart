// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

import 'package:students/view/homeScreen/model/i_students.dart';

SubjectModel subjectModelFromJson(String str) =>
    SubjectModel.fromJson(json.decode(str) as Map<String, dynamic>);

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel implements iSubjectsModel {
  SubjectModel({
    required this.subjects,
  });

  List<Subject> subjects;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
      };

  @override
  List<Subject> get iData => subjects;
}

class Subject {
  Subject({
    required this.credits,
    required this.id,
    required this.name,
    required this.teacher,
  });

  int credits;
  int id;
  String name;
  String teacher;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
      };
}
