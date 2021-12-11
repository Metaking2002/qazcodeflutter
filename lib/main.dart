import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/course/course_page.dart';
import 'login/root_page.dart';
import 'login/auth.dart';
import 'package:qazaccode/course/Video_page.dart';
import 'package:flutter/services.dart';
import 'onboarding/splash.dart';
import 'login/login_page.dart';
import 'package:qazaccode/course/studentslist.dart';
import 'all_screens/bottomnavbar.dart';
import 'tutor/tutorlist.dart';
import 'tabprogress/All.dart';
import 'package:qazaccode/src/pages/index.dart';
import 'onboarding/onboarding.dart';
import 'shared/comingSoon.dart';
import 'course/couse_preview.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
}


class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Error();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return new MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: new ThemeData(
                  primaryColor: Color(0xFF3D3868),
                  primarySwatch: Colors.deepPurple
              ),
              home: Splash(),
              routes: {
                StudentList.id: (context) => StudentList(),
                TutorList.id: (context) => TutorList(),
//        IndexPage.id: (context) => IndexPage(),
                HomePage.id: (context) => HomePage(),
//        OnBoard.id: (context) => OnBoard(),
                LoginPage.id: (context) => LoginPage(),
                RootPage.id: (context) => RootPage(auth: new Auth(),),
                Coming_Soon_Overall.id: (context) => Coming_Soon_Overall(),
                CoursePreview.id: (context) => CoursePreview(),
                Video_Page.id: (context) => Video_Page(),
                All_tabs.id: (context) => All_tabs(),
                Coirses_Page.id: (context) => Coirses_Page(),
              },
            );
          }
          return Loading();
        }
    );
  }
}
class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Ошибка'),),
    );
  }
}
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new
          ModalProgressHUD(inAsyncCall: true, child: Column())
      ),
    );
  }
}
