import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';

// ignore: must_be_immutable
class IndividualStudenst extends StatelessWidget {
  static const String route = "/individualStudents";
  int? index;
  IndividualStudenst({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentsProvider studentsProvider = Provider.of<StudentsProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('students details'),
          ),
        ),
        body: studentsProvider.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "id = ${studentsProvider.studentModel!.iData[index!].id.toString()}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "name = ${studentsProvider.studentModel!.iData[index!].name}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "email = ${studentsProvider.studentModel!.iData[index!].email}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "age = ${studentsProvider.studentModel!.iData[index!].age.toString()}"),
                    )
                  ],
                ),
              )));
  }
}

SizedBox height(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox width(double width) {
  return SizedBox(
    width: width,
  );
}
