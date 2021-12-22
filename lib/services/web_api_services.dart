import 'package:dio/dio.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:students/view/homeScreen/model/classroom_model.dart';

import 'package:students/view/homeScreen/model/students_model.dart';
import 'package:students/utils/urls.dart' as urls;
import 'package:students/view/homeScreen/model/subject_model.dart';

import '_mixin_api.dart';

class WebAPIServices with WebAPIMixin {
  static final WebAPIServices _instance = WebAPIServices._initialise();

  WebAPIServices._initialise()
      : _dio = Dio(BaseOptions(
          headers: {"accept": "application/json"},
        ))
          ..interceptors.add(LogInterceptor(
              responseHeader: true,
              responseBody: true,
              requestBody: true,
              requestHeader: true));

  factory WebAPIServices() => _instance;
  final Dio _dio;
  Dio get dio => _dio;

  Future<StudentModel> loadStudents() => dio
      .get(urls.studentsURL)
      .then(super.validateResStatusData)
      .then((value) => getDataPartFromRes(value))
      .then((value) => StudentModel.fromJson(value));

  Future<SubjectModel> loadSubject() => dio
      .get(urls.subjectURL)
      .then(super.validateResStatusData)
      .then((value) => getDataPartFromRes(value))
      .then((value) => SubjectModel.fromJson(value));

  Future<ClassroomModel> loadClassroom() => dio
      .get(urls.classroomURL)
      .then(super.validateResStatusData)
      .then((value) => getDataPartFromRes(value))
      .then((value) => ClassroomModel.fromJson(value));
}
