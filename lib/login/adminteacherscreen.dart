import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'dart:async';
import 'login_page.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:qazaccode/shared/shared-pref.dart';

class AdminOrTeacherScreen extends StatelessWidget {
  _launchurl() async {
    const url = 'https://go.2gis.com/v4g9f';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch site';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: () {
                auth.signOut();
                SharedPreferencesHelper.setSign('n');
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  LoginPage(auth: Auth(),)), (Route<dynamic> route) => false);
              }),
        ],
        title: Image.asset(
          'assets/qazcode.png',
          width: width/5,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Stack(

          children: <Widget>[
            Image.asset(
              'assets/n.png',

            ),
            Column(

              children: <Widget>[
                SizedBox(
                  height: height/3,
                ),
                Text('Вы не по адресу.',style: TextStyle(color: Colors.black,fontSize: width/15,fontFamily: 'Montserrat'),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Приложение разработано только для учеников. Учителя и админы должны работать через сайт',textAlign:TextAlign.center,style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Montserrat',
                    fontSize: width/25,
                  ),),
                ),
                SizedBox(
                  height: height/20,
                )
                ,
                GestureDetector(
                  onTap: (){

                    _launchurl();

                  },
                  child: Container(
                    height: height / 10,
                    width: width / 1.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffb3d979), Color(0xff67bf5a)]),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Перейти на сайт',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width / 15,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
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
  }
}
