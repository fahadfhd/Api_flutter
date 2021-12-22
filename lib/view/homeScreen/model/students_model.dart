// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

import 'package:students/view/homeScreen/model/i_students.dart';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str) as Map<String, dynamic>);

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel implements iStudentsModel {
  StudentModel({
    required this.students,
  });

  List<Student> students;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };

  @override
  List<Student> get iData => students;
}

class Student {
  Student({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
  });

  int age;
  String email;
  int id;
  String name;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
      };
}
