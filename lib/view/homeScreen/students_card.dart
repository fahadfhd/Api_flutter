// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';

class StudentsCard extends StatelessWidget {
  int? index;
  StudentsCard({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    StudentsProvider studentsProvider = Provider.of<StudentsProvider>(context);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                      // ignore: prefer_const_constructors
                      Text("data")
                      // Text(studentsProvider.studentModel!.iData[index!].name),
                    ])))));
  }
}
