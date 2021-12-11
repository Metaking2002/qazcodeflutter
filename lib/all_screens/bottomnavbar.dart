import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qazaccode/course/course_page.dart';
import 'package:qazaccode/all_screens/downloads.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qazaccode/login/root_page.dart';
import 'package:qazaccode/shared/shared-pref.dart';
import 'package:qazaccode/chat_screen/chat_screen.dart';
var refLink = firesore.doc('');
var docSchool;
final auth = FirebaseAuth.instance;
var studentsCollection = firesore.collection('students');
String name = 'b';
String surName;
Map progress;
String appBarName;
int sumArray;
var someVar;
int inProgressCount = 0;
List arrayPr = [];
double percent = 0.5;
List arrayName;
List<String> progressCount;
String studentSchoolString = 'l';
double doubNum;
double doubCalc;
Map<String, double> AllPgogressMeanings = {};
String aseetRoadforCorcs;
List availableCorsces = [];

class HomePage extends StatefulWidget {
  static String id = 'dicepage';
  HomePage({this.auth});

  final BaseAuth auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<bool> thisStreamWillEmitEvents = StreamController();

  @override
  void initState() {
    SharedPreferencesHelper.getLanguageCode();
     var user = auth.currentUser;
      curentUser = user;
      try {
        Firestore.instance
            .collection('schools')
            .doc(curentUser.uid)
            .get()
            .then((documents) {

          setState(() {
            if (documents.data != null) {
              studentSchoolString = documents.get('schoolName');
              print(studentSchoolString);
            } else {
            }
          });
          var docRef = firesore.collection('students');
          var blabla = docRef.doc(studentSchoolString);
          var progressColection = blabla.collection('students');
          var studentProgDoc = progressColection.document(curentUser.uid);
          try {
            blabla.get().then((dics) {

              setState(() {
                availableCorsces = dics.get('available');
                studentProgDoc.get().then((docis) {
                  setState(() {
                    progress = docis.get("progress");
                    for (var i = 0; i < availableCorsces.length; i++) {
                      countProgrss(availableCorsces[i]);
                    }
                  });
                });
              });
            });
          } catch (e) {
            return Scaffold(
                body: ModalProgressHUD(inAsyncCall: true, child: null)
            );
          }
        });
      } catch (e) {

        print(e);
      }
    super.initState();
  }

  countProgrss(String inesx) {
    for (var i in progress.keys) {
      if (i == inesx) {
        setState(() {
          someVar = i;
        });
        progressCount = progress[someVar].split(", ");
        for (var i = 0; i < progressCount.length; i++) {
          var progres = int.parse(progressCount[i]);
          setState(() {
            arrayPr.add(progres);
          });
        }

        setState(() {
          sumArray = arrayPr.reduce((var a, var b) => a + b);
          doubNum = sumArray.toDouble();
          doubCalc = doubNum / arrayPr.length;
        });
      }
    }
    setState(() {
      sumArray = 0;
      doubNum = 0;
      arrayPr.clear();
      AllPgogressMeanings.addAll({inesx: doubCalc});
      if (doubCalc > 0 && doubCalc < 1) {
        setState(() {
          inProgressCount++;
        });
      }
    });

    return doubCalc;
  }

  PageController _pageController;

  int _selectedIndex = 0;

  bool userPageDragging = false;


  final colorsw = [
    Color.fromRGBO(60, 72, 165, 1),
    Color(0xFF3D3868),
    Color.fromRGBO(7, 28, 85, 1),
  ];

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      My_Account(
        auth: Auth(),

      ),
      Coirses_Page(),
      Downloads_Page(),
      ChatScreen(),

    ];
    void changePage(int mal) {}
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: theme ? Colors.white : Colors.black26,
        bottomNavigationBar: Container(

          child: ClipRRect(

            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            child: BubbleBottomBar(
              backgroundColor:  theme ? Colors.white : Colors.black,
              opacity: 1,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  thisStreamWillEmitEvents.add(false);
                  _selectedIndex = index;
                });
              },
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              elevation: 8,

              hasNotch: true, //new
              hasInk: false, //new, gives a cute ink effect
              inkColor: Colors.black12, //optional, uses theme color if not specified
              items: <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                    backgroundColor: Color.fromRGBO(75, 82, 112, 1),
                    icon: Icon(
                      Icons.account_circle,
                      color: theme ? Colors.black : Colors.white,
                    ),
                    activeIcon: Icon(
                      MdiIcons.accountDetails,
                      color: theme ? Colors.white : Colors.black,
                    ),
                    title: Text(
                      qaz ? "Akkaýnt" : 'Аккаунт',
                      style: TextStyle(
                        color: theme ? Colors.white : Colors.black, ),
                    )),
                BubbleBottomBarItem(
                    backgroundColor: Color.fromRGBO(75, 82, 112, 1),
                    icon: Icon(
                      MdiIcons.bookMultipleVariant,
                      color:  theme ? Colors.black : Colors.white,
                    ),
                    activeIcon: Icon(
                      MdiIcons.bookOpenPageVariant,
                      color: theme ? Colors.white : Colors.black,
                    ),
                    title: Text(qaz ? "Kýrstar" : 'Курсы',
                        style: TextStyle(color: theme ? Colors.white : Colors.black,))),
                BubbleBottomBarItem(
                  backgroundColor: Color.fromRGBO(75, 82, 112, 1),
                  icon: Icon(
                    MdiIcons.progressCheck,
                    color:  theme ? Colors.black : Colors.white,
                  ),
                  activeIcon: Icon(
                    MdiIcons.medal,
                    color: theme ? Colors.white : Colors.black,
                  ),
                  title: Text(qaz ? "Faıldar" : "Статистика",
                      style: TextStyle(color: Colors.white)),
                ),
                BubbleBottomBarItem(
                  backgroundColor: Color.fromRGBO(75, 82, 112, 1),
                  icon: Icon(
                    MdiIcons.message,
                    color:  theme ? Colors.black : Colors.white,
                  ),
                  activeIcon: Icon(
                    MdiIcons.messageOutline,
                    color: theme ? Colors.white : Colors.black,
                  ),
                  title: Text(qaz ? "Общий чат" : "Общий чат",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: theme ? Colors.white : Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 40.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  20.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
          ),
        ),
        body: _pageOptions[_selectedIndex]);
  }
}
