// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';

class IndividualSubject extends StatelessWidget {
  static const String route = "/individualSubject";
  int? index;
  IndividualSubject({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectProvider subjectProvider = Provider.of<SubjectProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('subjects details'),
          ),
        ),
        body: subjectProvider.isLoading == true
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
                          "creadits = ${subjectProvider.subjectModel!.iData[index!].credits.toString()}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "id = ${subjectProvider.subjectModel!.iData[index!].id.toString()}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "name = ${subjectProvider.subjectModel!.iData[index!].name}"),
                    ),
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "teacher = ${subjectProvider.subjectModel!.iData[index!].teacher.toString()}"),
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
