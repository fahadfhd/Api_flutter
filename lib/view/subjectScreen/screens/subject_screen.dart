import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';
import 'package:students/view/subjectScreen/screens/individual_subjects.dart';

class SubjectScreen extends StatefulWidget {
  static const String route = '/subject';
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    SubjectProvider subjectProvider = Provider.of<SubjectProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Subjects'),
          ),
        ),
        body: subjectProvider.isLoading == true
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
                    itemCount: subjectProvider.subjectModel!.iData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () async {
                            // await subjectProvider.loadStudent();
                            Navigator.pushNamed(
                                context, IndividualSubject.route,
                                arguments: IndividualSubject(
                                  index: index,
                                ));
                          },
                          child: Card(
                              child: SizedBox(
                                  height: 40,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(subjectProvider
                                          .subjectModel!.iData[index].name)))));
                    }),
              )));
  }
}
