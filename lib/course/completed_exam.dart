import 'package:flutter/material.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qazaccode/login/auth.dart';

class Completed_exam extends StatefulWidget {
  final int fullscore;
  final String courseTitle;
  final int yourScore;
  Completed_exam({this.courseTitle, this.yourScore, this.fullscore});
  @override
  _Completed_examState createState() => _Completed_examState();
}

class _Completed_examState extends State<Completed_exam> {
  _updateData() async {
    await Firestore.instance
        .collection('students')
        .document(studentSchoolString)
        .collection('students')
        .document(curentUser.uid)
        .updateData({'exam': examScore});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (var i in examScore.keys) {
        if (widget.courseTitle == i) {
          setState(() {
            var prg = i;
            prg = widget.yourScore;
            examScore[i] = prg;
          });
        }
      }
      _updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 42, 48, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: height / 2,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff45bf1f), Color(0xff67bf5a)]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  qaz ? 'Құттықтаймыз!' : 'Поздравляем!',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: width / 20,
                      color: Colors.white),
                ),
                Text(
                  qaz ? 'Сіз тесті аяқтадыңыз' : 'Вы полностью закончили курс!',
                  style: TextStyle(
                      fontFamily: 'MR',
                      fontSize: width / 35,
                      color: Colors.white),
                ),
                Flexible(
                  flex: 3,
                  child: Image(
                    image: AssetImage('assets/testwon.png'),
                    height: height / 4,
                  ),
                ),
                Text(
                  qaz ? 'Нәтижеңіз сақталды' : 'Результаты сохранены',
                  style: TextStyle(
                      fontFamily: 'MR',
                      fontSize: width / 25,
                      color: Colors.white),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Icon(
                  Icons.check,
                  color: Colors.white70,
                  size: 15,
                ),
                SizedBox(
                  height: height / 40,
                ),
              ],
            ),
          ),
//          SizedBox(
//            height: height / 8,
//          ),
          Center(
            child: Text(
              '${widget.yourScore}/${widget.fullscore}',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(32.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.id, (Route<dynamic> route) => false);
              },
              child: Container(
                width: width,
                height: height / 14,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  qaz ? "Басты бет" : 'Главный экран',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'MR',
                      fontSize: width / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
