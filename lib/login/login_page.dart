import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'auth.dart';
import 'package:qazaccode/tutor/tutorscreen.dart';
import 'adminteacherscreen.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/shared/shared-pref.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
bool obscure = true;
bool qaz = false;
String resetEmail;
Future<void> resetPassword(String email) async {
  await auth.sendPasswordResetEmail(email: email);
}
class LoginPage extends StatefulWidget {
  static String id = 'onboardifsdfsdfsdfng';
  LoginPage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignIn;
  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  bool spinner = false;
  String _email;
  String _password;
  String _authHint = '';
  void validateAndSubmit(double width, double height) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      curentUser = user.user;
      setState(() {
        spinner = false;
      });
      Firestore.instance
          .collection('admin')
          .doc(curentUser.uid)
          .get()
          .then((docs) {
        if (docs.exists) {

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AdminOrTeacherScreen()),
              (Route<dynamic> route) => false);
          setState(() {
            SharedPreferencesHelper.setSign('a');
          });

        } else {
          Firestore.instance
              .collection('teacher')
              .document(curentUser.uid)
              .get()
              .then((docs) {
            if (docs.exists) {
              setState(() {
                SharedPreferencesHelper.setSign('a');
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminOrTeacherScreen()),
                  (Route<dynamic> route) => false);
            } else { Firestore.instance.collection('tutors').document(curentUser.email).get().then((docs){
              if(docs.exists){
                setState(() {
                  SharedPreferencesHelper.setSign('t');
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutorScreen(auth: Auth(),)),
                        (Route<dynamic> route) => false);
              }else{
                setState(() {
                  SharedPreferencesHelper.setSign('s');
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                          auth: Auth(),
                        )),
                        (Route<dynamic> route) => false);
              }
            });

            }
          });
        }
      });
    } catch (e) {
      setState(() {
        spinner = false;
      });
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
            color: Color(0xff023059),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'),
      );
      Alert(
        image: Image.asset(
          'assets/404.png',
          width: width / 1.25,
        ),
        style: alertStyle,
        context: context,
        title: "Ошибка!",
        desc: "Вы ввели неправильный логин или пароль! Попытайтесь еще раз",
        buttons: [
          DialogButton(
            child: Text(
              "OK!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                spinner = false;
              });
            },
            width: width / 2.5,
            color: Color(0xff023059),
          ),
        ],
      ).show();
//        setState(() {
//          _authHint = 'Sign In Error\n\n${e.toString()}';
//        });
      print(e);
    }
  }

  List<Widget> usernameAndPassword(double height, double width) {
    var resetStyle = AlertStyle(
        backgroundColor: Color(0xFFffffff),
        animationType: AnimationType.fromTop,
        isCloseButton: true,
        isOverlayTapDismiss: true,
        titleStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xff023059),
            letterSpacing: 1),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),

        ));

    return [
      padded(
          child: Material(
        color: Colors.white,
        elevation: 30.0,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        shadowColor: Colors.black,
        child: new TextField(
          obscureText: false,
          style: TextStyle(color: Colors.black, fontFamily: 'MR'),
          cursorColor: Colors.black,
          autofocus: false,
          key: new Key('email'),
          decoration: new InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
            ),
            fillColor: Colors.black87,
            hintText: 'Введите email',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'MR',
            ),
          ),
          autocorrect: false,
//        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
          onChanged: (val) => _email = val,
        ),
      )),
      SizedBox(
        height: height / 35,
      ),
      padded(
          child: Material(
        color: Colors.white,
        elevation: 30.0,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        shadowColor: Colors.black,
        child: new TextField(
          obscureText: obscure ? true : false,
          key: new Key('password'),
          decoration: new InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
            ),
            fillColor: Colors.black87,
            hintText: 'Введите пароль',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  if (obscure == false) {
                    obscure = true;
                  } else {
                    obscure = false;
                  }
                });
              },
              child: Icon(
                Icons.remove_red_eye,
                color: Colors.black87,
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'MR',
            ),
          ),
          autocorrect: false,
          onChanged: (val) => _password = val,
        ),
      )),
      SizedBox(
        height: height / 40,
      ),
      Align(
        alignment: Alignment.center,
        child: GestureDetector(
          key: new Key('login'),
          onTap: () {
            validateAndSubmit(width, height);
            setState(() {
              spinner = true;
            });
          },
          child: Container(
              height: height / 14,
              width: width / 1.3,
              child: LiquidLinearProgressIndicator(
                value: 0.3, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Color(
                    0xff023059)), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.white,
                borderWidth: 0.0,
                borderRadius: 16.0,
                direction: Axis.vertical,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Войти',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff023059),
                          fontFamily: 'Montserrat',
                          fontSize: width / 20),
                    ),
                  ],
                ),
              )),
        ),
      ),
      SizedBox(
        height: height / 40,
      ),
      Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Alert(
                style: resetStyle,
                context: context,
                title: "Поменять пароль",
                content: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: Color(0xff023059),
                        ),
                        labelText: 'email',
                        fillColor: Color(0xFFea2340),
                        hoverColor: Color(0xFFea2340),
                        focusColor: Color(0xFFea2340),
                      ),
                      onChanged: (value) {
                        setState(() {
                          resetEmail = value;
                        });
                      },
                    ),
                  ],
                ),
                buttons: [
                  DialogButton(
                    onPressed: () async {
                      resetPassword(resetEmail);
                    },
                    child: Text(
                      'Отправить письмо',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 28,
                          fontFamily: 'Montserrat'),
                    ),
                    color: Color(0xff023059),
                  )
                ]).show();
          },
          child: Text(
            'Забыли пароль?',
            textAlign: TextAlign.center,
            style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                fontSize: width / 30,
                color: Color(0xff023059)),
          ),
        ),
      ),
    ];
  }

  Widget hintText() {
    return new Container(
        //height: 80.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(_authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String phonenumber;
    String name;
    String desc;
    var close = false;
    String work;
    var anketka = AlertStyle(
        backgroundColor: Color(0xFFffffff),
        animationType: AnimationType.fromTop,
        isCloseButton: true,
        isOverlayTapDismiss: true,
        titleStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xff023059),
            letterSpacing: 1),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),

        ));
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: height / 1.3,
                width: width,
                child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff023059), Color(0xff012340)]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(16, 10),
                            bottomRight: Radius.circular(10))),
                    height: height / 2.5,
                    width: width,
                  ),
                  Positioned(
                    top: 48,
                    child: Container(
                      width: width / 2.5,
                      height: width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: AssetImage(
                          'assets/langpalace.jpg',
                        ),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                          width: width / 1.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  1.0, // horizontal, move right 10
                                  1.0, // vertical, move down 10
                                ),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: new Column(children: [
                            new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Container(
                                      padding: const EdgeInsets.all(16.0),
                                      child: new Form(
                                          child: new Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: usernameAndPassword(
                                                  height, width)))),
                                ]),
                          ])),
                    )),
                  ),
                ]),
              ),
              Flexible(
                child: SizedBox(
                  height: height/2,
                ),
              ),
//              GestureDetector(
//                onTap: (){
//                  Alert(
//                      style: anketka ,
//                      context: context,
//                      title: "Заполните заявку",
//                      content: Column(
//                        children: <Widget>[
//                          TextField(
//                            decoration: InputDecoration(
//                              icon: Icon(
//                                Icons.account_circle,
//                                color: Color(0xff023059),
//                              ),
//                              labelText: 'Ф.И.О',
//                              fillColor: Color(0xFFea2340),
//                              hoverColor: Color(0xFFea2340),
//                              focusColor: Color(0xFFea2340),
//                            ),
//                            onChanged: (value) {
//                              setState(() {
//                                name = value;
//                              });
//                            },
//                          ),
//                          TextField(
//                            decoration: InputDecoration(
//                              icon: Icon(
//                                Icons.email,
//                                color: Color(0xff023059),
//                              ),
//                              labelText: 'Email',
//                              fillColor: Color(0xFFea2340),
//                              hoverColor: Color(0xFFea2340),
//                              focusColor: Color(0xFFea2340),
//                            ),
//                            onChanged: (value) {
//                              setState(() {
//                                resetEmail = value;
//                              });
//                            },
//                          ),
//                          TextField(
//                            decoration: InputDecoration(
//                              icon: Icon(
//                                Icons.work,
//                                color: Color(0xff023059),
//                              ),
//                              labelText: 'Специализация',
//                              fillColor: Color(0xFFea2340),
//                              hoverColor: Color(0xFFea2340),
//                              focusColor: Color(0xFFea2340),
//                            ),
//                            onChanged: (value) {
//                              setState(() {
//                                 work = value;
//                              });
//                            },
//                          ),
//                          TextField(
//
//                            decoration: InputDecoration(
//
//                              icon: Icon(
//                                Icons.call,
//                                color: Color(0xff023059),
//                              ),
//                              labelText: 'Номер телефона',
//                              fillColor: Color(0xFFea2340),
//                              hoverColor: Color(0xFFea2340),
//                              focusColor: Color(0xFFea2340),
//                            ),
//                            onChanged: (value) {
//                              setState(() {
//                                phonenumber = value;
//                              });
//                            },
//                            keyboardType: TextInputType.numberWithOptions(),
//                          ),
//                          TextField(
//
//                            decoration: InputDecoration(
//                              icon: Icon(
//                                Icons.all_inclusive,
//                                color: Color(0xff023059),
//                              ),
//                              labelText: 'Кратко о себе',
//                              fillColor: Color(0xFFea2340),
//                              hoverColor: Color(0xFFea2340),
//                              focusColor: Color(0xFFea2340),
//                            ),
//                            onChanged: (value) {
//                              setState(() {
//                                desc = value;
//                              });
//                            },
//                          ),
//                        ],
//                      ),
//                      buttons: [
//                        DialogButton(
//                          onPressed: () async {
////
//
//                              await Firestore.instance
//                                  .collection('tutors')
//                                  .document(resetEmail)
//                                  .setData({'name':name,'work':work,'phone':phonenumber,'email': resetEmail,'desc':desc});
//
//                          },
//                          child: Text(  'Отправить письмо',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: width / 28,
//                                fontFamily: 'Montserrat'),
//                          ),
//                          color:  Color(0xff023059),
//                        )
//                      ]).show();
//                },
//                child: Align(alignment: Alignment.bottomCenter,child: Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: Text('Заявка репетитора', style: TextStyle(color: Color(0xff023059),fontSize: width/25,fontFamily: 'Montserrat'),),
//                )),
//              )
            ],
          ),
        ));
  }
  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
