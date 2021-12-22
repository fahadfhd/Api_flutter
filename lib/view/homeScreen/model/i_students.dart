// ignore_for_file: camel_case_types

import 'package:students/view/homeScreen/model/classroom_model.dart';
import 'package:students/view/homeScreen/model/students_model.dart';
import 'package:students/view/homeScreen/model/subject_model.dart';

abstract class iStudentsModel {
  List<Student> get iData;
}

abstract class iSubjectsModel {
  List<Subject> get iData;
}

abstract class iClassroomModel {
  List<Classroom> get iData;
}
