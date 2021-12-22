import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/classroom/individual_classroom.dart';
import 'package:students/view/homeScreen/provider/classroom_provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';

class ClassroomScreen extends StatelessWidget {
  static const String route = "/classroom";
  const ClassroomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassroomProvider classroomProvider =
        Provider.of<ClassroomProvider>(context);
    SubjectProvider subjectProvider = Provider.of<SubjectProvider>(context);
    StudentsProvider studentsProvider = Provider.of<StudentsProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Classroom'),
          ),
        ),
        body: classroomProvider.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: classroomProvider.classroomModel!.iData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () async {
                            await subjectProvider.loadSubject();
                            await studentsProvider.loadStudent();

                            Navigator.pushNamed(
                                context, IndividualClassroom.route,
                                arguments: IndividualClassroom(
                                  studentsProvider: studentsProvider,
                                  subjectProvider: subjectProvider,
                                  index: index,
                                ));
                          },
                          child: Card(
                              child: SizedBox(
                                  height: 40,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(classroomProvider
                                          .classroomModel!
                                          .iData[index]
                                          .name)))));
                    }),
              )));
  }
}
