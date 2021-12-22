import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';
import 'package:students/view/students/screens/individual_students.dart';

class StudentScreen extends StatefulWidget {
  static const String route = '/students';
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    StudentsProvider studentsProvider = Provider.of<StudentsProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Students'),
          ),
        ),
        body: studentsProvider.isLoading == true
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
                    itemCount: studentsProvider.studentModel!.iData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () async {
                            //   await studentsProvider.loadStudent();
                            Navigator.pushNamed(
                                context, IndividualStudenst.route,
                                arguments: IndividualStudenst(
                                  index: index,
                                ));
                          },
                          child: Card(
                              child: SizedBox(
                                  height: 40,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(studentsProvider
                                          .studentModel!.iData[index].name)))));
                    }),
              )));
  }
}
