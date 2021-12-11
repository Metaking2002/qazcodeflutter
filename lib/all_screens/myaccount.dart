import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qazaccode/course/course_page.dart';
import 'package:qazaccode/tutor/tutorlist.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/shared/comingSoon.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/src/pages/index.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';
import 'package:qazaccode/login/root_page.dart';
import 'package:qazaccode/shared/shared-pref.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:qazaccode/main.dart';
bool theme = true;
String nameMyAccount = 'Azamat';
String surnameMyAccount = 'Something';
Map testMap = {};
Map examScore = {};
Map testScore = {};
Map map = {};
var progresc;
 String fiooo;
class My_Account extends StatefulWidget {
  My_Account({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  static String id = 'my_accont';
  @override
  _My_AccountState createState() => _My_AccountState();
}

class _My_AccountState extends State<My_Account> {
  bool spinner = false;
  List fio = ['a', 'a'];


  int comlet = 0;
  int prgrs = 0;
  @override
  void initState() {
    setState(() {
      theme = true;
      fiooo = fio[0] + fio[1];
//      print(fiooo);
    });
    super.initState();
//    SharedPreferencesHelper.getLanguageCode();
    var user = auth.currentUser;
    if(user!= null){
      curentUser = user;
      getCurrentUserSchool();
    }
  }

  Future getCurrentUserSchool() async {
    try {
      Firestore.instance
          .collection('schools')
          .document(curentUser.uid)
          .get()
          .then((documents) {
        setState(() {
          studentSchoolString = documents.get('schoolName');
          refLink = firesore
              .collection('students')
              .document(studentSchoolString)
              .collection('students')
              .document(curentUser.uid);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Gradient> colorGradients = [
      LinearGradient(colors: [Color(0xff3dd1f2), Color(0xff3d8bf2)]),
      LinearGradient(colors: [Color(0xfff2c12e), Color(0xfff28241)]),
      LinearGradient(colors: [Color(0xffec8eff), Color(0xff9f69ff)]),
      LinearGradient(colors: [Color(0xff8dc26f), Color(0xff76b852)]),
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var alertStyle = AlertStyle(
      backgroundColor: Colors.white,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.black54,
        fontSize: width / 26,
      ),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      titleStyle: TextStyle(
          color: Color(0xff6c1460),
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'),
    );
    return StreamBuilder(
      stream: refLink.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ModalProgressHUD(inAsyncCall: true, child: Column());
        } else if (studentSchoolString != 'mal') {
          var userDocument = snapshot.data;
          fio = userDocument['name'];
          testMap = userDocument['test'];
          testScore = userDocument['myscore'];
          nameMyAccount = fio[0];
          examScore = userDocument['exam'];
          surnameMyAccount = fio[1];
          map = userDocument['progress'];
          for (var i in map.keys) {
            progresc = map[i].split(", ");
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
//              leading: GestureDetector(child: Icon(MdiIcons.school),onTap: (){
//              Navigator.pushNamed(context, TutorList.id);
//              },),
              backgroundColor: Color.fromRGBO(75, 82, 112, 1),
              title: Text(
                qaz ? 'Menin akkaýntym' : 'Мой аккаунт',
                style: TextStyle(
                  fontSize: width / 20,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ),
//            floatingActionButton: FloatingActionButton(
//              backgroundColor: Colors.pink,
//              child: Icon(Icons.videocam),
//              onPressed: (){
////                Navigator.pushNamed(context, IndexPage.id);
//              },
//            ),
            body: ModalProgressHUD(
              inAsyncCall: spinner,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Material(
                              child: Container(
                                width: width / 5,
                                decoration: BoxDecoration(
                                  gradient: colorGradients[2],
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      nameMyAccount[0],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: width / 10),
                                    )),
                              ),
                              shape: CircleBorder(),
                              elevation: 20,
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 16,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    nameMyAccount,
                                    style: TextStyle(
                                        fontSize: width / 20,
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    surnameMyAccount,
                                    style: TextStyle(
                                        fontSize: width / 20,
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  studentSchoolString,
                                  style: TextStyle(
                                      color: Colors.black12,
                                      fontFamily: 'Montserrat',
                                      fontSize: width / 28),
                                ),
                              )
                            ],
                          ),
                          Flexible(
                            child: SizedBox(
                              width: width / 5,
                            ),
                          ),
//
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 45, left: 8, right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new statisticsContainer(
                          colorGradients: colorGradients,
                          width: width,
                          text: qaz ? 'Barlyǵy' : 'Unity Games',
                          numberText: '2020',
                        ),
                        statisticsContainer(
                          colorGradients: colorGradients,
                          width: width,
                          text: qaz ? 'Oku' : 'React Native',
                          numberText: '2020',
                        ),
                        statisticsContainer(
                          colorGradients: colorGradients,
                          width: width,
                          text: qaz ? 'aıaqtadym' : 'Data Science',
                          numberText: '2020',
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: height / 20,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Coirses_Page.id);
                            },
                            child: Container(
                              height: height / 5,
                              decoration: BoxDecoration(
                                gradient: colorGradients[0],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        top: height / 25,
                                        bottom: height / 40),
                                    child: Text(
                                      theme ? 'Мои курсы' : 'Дневной режим',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width / 15,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, bottom: 16),
                                    child: Text(
                                      availableCorsces.length.toString(),
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat',
                                        fontSize: width / 32,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Coming_Soon_Overall.id);
                            },
                            child: Hero(
                              tag: 'overall',
                              child: Container(
                                height: height / 5,
                                decoration: BoxDecoration(
                                  gradient: colorGradients[2],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          top: height / 25,
                                          bottom: 16),
                                      child: Text(
                                        qaz ? 'Jýyrda!' : 'Cкоро',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width / 15,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 16,
                                        left: 16,
                                      ),
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'Montserrat',
                                          fontSize: width / 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {
                              resetPassword(curentUser.email);
                              Alert(
                                image: Image.asset(
                                  'assets/404.png',
                                  width: width / 1.25,
                                ),
                                style: alertStyle,
                                context: context,
                                title: qaz ? 'Жіберілді' : "Отправлено",
                                desc: qaz
                                    ? 'Хат поштанызға жіберілді'
                                    : "Письмо отправлено на вашу почтиу",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "OK!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Monserrat",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        spinner = false;
                                      });
                                    },
                                    width: width / 2.5,
                                    color: Color(0xff6c1460),
                                  ),
                                ],
                              ).show();
                            },
                            child: Container(
                              height: height / 5,
                              decoration: BoxDecoration(
                                gradient: colorGradients[3],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: height / 25,
                                        bottom: height / 40),
                                    child: Text(
                                      qaz ? 'Parol ózgertý' : 'Поменять пароль',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width / 16,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, bottom: 16),
                                    child: Text(
                                      qaz ? 'Email arqyly' : 'Через email',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat',
                                        fontSize: width / 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                auth.signOut();
                                SharedPreferencesHelper.setSign('n');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage(
                                              auth: Auth(),
                                            )),
                                    (Route<dynamic> route) => false);
                              });

                              Navigator.pushNamed(context, LoginPage.id);

//                        Navigator.pop(context);
                            },
                            child: Container(
                              height: height / 5,
                              decoration: BoxDecoration(
                                gradient: colorGradients[1],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: height / 25,
                                        bottom: height / 50),
                                    child: Text(
                                      qaz ? 'Shyǵý' : 'Выйти',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width / 15,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 16, bottom: 16, right: 16),
                                    child: Text(
                                      qaz
                                          ? 'Qosymshadan shyǵý'
                                          : 'Выйти с аккаунта',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat',
                                        fontSize: width / 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text("Loadfklnsdmlkdsmfkldsmfing"));
        }
      },
    );
  }
}

class statisticsContainer extends StatelessWidget {
  const statisticsContainer({
    Key key,
    this.text,
    this.numberText,
    @required this.colorGradients,
    @required this.width,
  }) : super(key: key);

  final List<Gradient> colorGradients;
  final double width;
  final String text;
  final String numberText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: colorGradients[2],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Material(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: width / 30,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      numberText,
                      style: TextStyle(
                          color: Colors.black38,
                          fontFamily: "Montserrat",
                          fontSize: width / 25),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
