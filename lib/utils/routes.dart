import 'package:flutter/material.dart';
import 'package:students/view/classroom/classroom.dart';
import 'package:students/view/classroom/individual_classroom.dart';
import 'package:students/view/homeScreen/screens/homeview.dart';
import 'package:students/view/students/screens/individual_students.dart';
import 'package:students/view/students/screens/students_screen.dart';
import 'package:students/view/subjectScreen/screens/individual_subjects.dart';
import 'package:students/view/subjectScreen/screens/subject_screen.dart';

Map<String, WidgetBuilder> appRoutes() => {
      HomeView.route: (_) => const HomeView(),
      StudentScreen.route: (_) => const StudentScreen(),
      SubjectScreen.route: (_) => const SubjectScreen(),
      ClassroomScreen.route: (_) => const ClassroomScreen(),
    };

RouteFactory onAppGenerateRoute() => (settings) {
      if (settings.name == IndividualStudenst.route) {
        final arg = settings.arguments! as IndividualStudenst;
        return MaterialPageRoute(builder: (context) {
          return IndividualStudenst(
            index: arg.index,
          );
        });
      }

      if (settings.name == IndividualSubject.route) {
        final arg = settings.arguments! as IndividualSubject;
        return MaterialPageRoute(builder: (context) {
          return IndividualSubject(
            index: arg.index,
          );
        });
      }
      if (settings.name == IndividualClassroom.route) {
        final arg = settings.arguments! as IndividualClassroom;
        return MaterialPageRoute(builder: (context) {
          return IndividualClassroom(
            studentsProvider: arg.studentsProvider,
            subjectProvider: arg.subjectProvider,
            index: arg.index,
          );
        });
      }
    };

//       if (settings.name == ProfileView.route) {
//         final arg = settings.arguments! as ProfileView;
//         return MaterialPageRoute(builder: (context) {
//           return ProfileView(
//             em: arg.em,
//             pass: arg.pass,
//             mob: arg.mob,
//             dob: arg.mob,
//           );
//         });
//       }
//     };
