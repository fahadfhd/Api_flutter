// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/classroom/classroom.dart';
import 'package:students/view/homeScreen/provider/classroom_provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';

import 'package:students/view/students/screens/students_screen.dart';
import 'package:students/view/subjectScreen/screens/subject_screen.dart';

class HomeView extends StatefulWidget {
  static const String route = '/HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<String> data = ["students", "subjects"];
    StudentsProvider studentsProvider = Provider.of<StudentsProvider>(context);
    SubjectProvider subjectProvider = Provider.of<SubjectProvider>(context);
    ClassroomProvider classroomProvider =
        Provider.of<ClassroomProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Home'),
          ),
        ),
        body: studentsProvider.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            // ignore: avoid_unnecessary_containers
            : Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await studentsProvider.loadStudent();
                        Navigator.pushNamed(context, StudentScreen.route);
                      },
                      child: const Card(
                        child: SizedBox(
                          height: 30,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Students"),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await subjectProvider.loadSubject();
                        Navigator.pushNamed(context, SubjectScreen.route);
                      },
                      child: const Card(
                        child: SizedBox(
                          height: 30,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Subjects"),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await classroomProvider.loadClassroom();
                        Navigator.pushNamed(context, ClassroomScreen.route);
                      },
                      child: const Card(
                        child: SizedBox(
                          height: 30,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Classrooms"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
