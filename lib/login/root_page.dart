import 'package:flutter/material.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart' as prefix0;
import 'package:qazaccode/login/auth.dart';
import 'login_page.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';
import 'package:qazaccode/tutor/tutorscreen.dart';

final firesore = Firestore.instance;
String signedIn;

class RootPage extends StatefulWidget {
  static String id = 'onboardifsdfsdfsddsffdsfng';
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;
  @override
  _RootPageState createState() => new _RootPageState();
}
class _RootPageState extends State<RootPage> {
  Future checkUserSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    signedIn = (prefs.getString('sign') ?? 'n');
    if (signedIn!='n' ) {
      print(curentUser);
      if(signedIn == 't'){
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => new TutorScreen(auth: widget.auth)));
    }else if(signedIn == 's'){
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (context) => new HomePage(auth: widget.auth)));
      }
    }
      else {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => new LoginPage(auth: widget.auth)));
    }
  }
  @override
  void initState() {

    super.initState();
    new Timer(new Duration(milliseconds: 100), () {
      checkUserSignedIn();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ModalProgressHUD(inAsyncCall: true, child: Column()));
  }
}
