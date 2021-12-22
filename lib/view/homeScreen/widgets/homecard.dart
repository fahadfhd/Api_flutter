import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  int? index;
  HomeCard({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> data = ["students", "subjects"];
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
                        children: [
                      Text(data.toString())
                      // Text(studentsProvider.studentModel!.iData[index!].name),
                    ])))));
  }
}
