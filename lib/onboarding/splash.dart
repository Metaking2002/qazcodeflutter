
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/onboarding/onboarding.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:qazaccode/login/root_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qazaccode/shared/shared-pref.dart';
class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}
class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new RootPage(auth: new Auth())));
  }
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 50), () {
      checkFirstSeen();
    });
  }

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