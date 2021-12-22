import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/utils/routes.dart';
import 'package:students/view/homeScreen/provider/classroom_provider.dart';
import 'package:students/view/homeScreen/provider/students_provider.dart';
import 'package:students/view/homeScreen/provider/subject_provider.dart';
import 'package:students/view/homeScreen/screens/homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => StudentsProvider()),
          ChangeNotifierProvider(create: (_) => SubjectProvider()),
          ChangeNotifierProvider(create: (_) => ClassroomProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeView(),
          routes: appRoutes(),
          onGenerateRoute: onAppGenerateRoute(),
        ));
  }
}
