import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:students/view/homeScreen/provider/classroom_provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';

// ignore: must_be_immutable
class IndividualClassroom extends StatefulWidget {
  static const String route = "/IndividualClassroom";
  SubjectProvider? subjectProvider;
  StudentsProvider? studentsProvider;
  int? index;
  IndividualClassroom(
      {Key? key, this.index, this.subjectProvider, this.studentsProvider})
      : super(key: key);

  @override
  State<IndividualClassroom> createState() => _IndividualClassroomState();
}

class _IndividualClassroomState extends State<IndividualClassroom> {
  String? _mySelection;
  String? _mySubject;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String? result = "hi";
    ClassroomProvider classroomProvider =
        Provider.of<ClassroomProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('subjects details'),
          ),
        ),
        body: classroomProvider.isLoading == true
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
                            "id = ${classroomProvider.classroomModel!.iData[widget.index!].id.toString()}"),
                      ),
                      height(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "layout = ${classroomProvider.classroomModel!.iData[widget.index!].layout}"),
                      ),
                      height(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "name = ${classroomProvider.classroomModel!.iData[widget.index!].name}"),
                      ),
                      height(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Size = ${classroomProvider.classroomModel!.iData[widget.index!].size.toString()}"),
                      ),
                      // SelectDropDownButton(
                      //   index: index,
                      // )
                      Row(
                        children: [
                          const Text("Assign Subject ="),
                          width(10),
                          DropdownButton(
                            items: widget.subjectProvider!.subjectModel!.iData
                                .map((item) {
                              return DropdownMenuItem(
                                child: Text(item.name),
                                value: item.name,
                              );
                            }).toList(),
                            onChanged: ((String? value) {
                              setState(() {
                                _mySelection = value!;
                              });
                            }),
                            value: _mySelection,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Assign Students ="),
                          width(10),
                          DropdownButton(
                            items: widget.studentsProvider!.studentModel!.iData
                                .map((item) {
                              return DropdownMenuItem(
                                child: Text(item.name),
                                value: item.name,
                              );
                            }).toList(),
                            onChanged: ((String? value) {
                              setState(() {
                                _mySubject = value!;
                              });
                            }),
                            value: _mySubject,
                          ),
                          // InkWell(
                          //   onTap: () {

                          //     setState(() {
                          //       _mySubject = "selact";
                          //     });
                          //   },
                          //   child: Icon(Icons.clear),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
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
