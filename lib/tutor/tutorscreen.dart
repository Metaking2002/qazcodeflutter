import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qazaccode/shared/shared-pref.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/course/studentslist.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:qazaccode/src/pages/index.dart';
import 'package:qazaccode/src/pages/call.dart';

class TutorScreen extends StatefulWidget {
  TutorScreen({this.auth});

  final BaseAuth auth;
  @override
  _TutorScreenState createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  var fuckingreff = Firestore.instance.document('');
  var workofteacher;
  @override
  void initState() {
    super.initState();
    print('$curentUser  fsdmfksdmflksd');
//    SharedPreferencesHelper.getLanguageCode();
    var user = auth.currentUser;
    if(user!= null){
      curentUser = user;
      getCurrentUserSchool();
    }
  }

  Future getCurrentUserSchool() async {
    var mal;
    try {
      Firestore.instance
          .collection('tutors')
          .document(curentUser.email)
          .get()
          .then((documents) {
        setState(() {
          workofteacher = documents.get('work');
          fuckingreff = FirebaseFirestore.instance
              .collection('tutors')
              .doc(curentUser.email);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String fio = 'ads';
    bool spinner = false;
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
      stream: fuckingreff.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ModalProgressHUD(inAsyncCall: true, child: Column());
        } else if (fuckingreff != 'mal') {
          var userDocument = snapshot.data;
          fio = userDocument['name'];

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(75, 82, 112, 1),
              title: Text(
                qaz ? 'Menin akkaýntym' : 'Мой кабинет',
                style: TextStyle(
                  fontSize: width / 20,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
              leading: GestureDetector(
                  onTap: () {
                    auth.signOut();
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
                  },
                  child: Icon(Icons.exit_to_app)),
            ),

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
                                      userDocument['name'][0],
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
                                    userDocument['name'],
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
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      workofteacher,
                                      style: TextStyle(
                                          color: Colors.black12,
                                          fontFamily: 'Montserrat',
                                          fontSize: width / 28),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Flexible(
                            child: SizedBox(
                              width: width / 5,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text('4.9',style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Montserrat',
                                    fontSize: width/20
                                  ),),
                                ),
                                Icon(MdiIcons.star,color: Colors.amber,),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: height / 7,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius:
                                10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0,

                            // has the effect of extending the shadow
                            offset: Offset(
                              0.0, // horizontal, move right 10
                              10.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          userDocument['desc'],
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Montserrat',
                              fontSize: width / 20),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, StudentList.id);
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
                                      'Мои ученики',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width / 15,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, bottom: 16),
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
//                              Navigator.pushNamed(context, IndexPage.id);
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
                                         'Видеозвонок',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width / 15,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
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
