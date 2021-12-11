import 'package:flutter/material.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qazaccode/login/auth.dart';
class Completed_course extends StatefulWidget {

  final int currentSction;

  final int fullscore;
  final String courseTitle;
  final int yourScore;
  final List<String> didTestScore;
  final bool qaz;

  Completed_course(this.courseTitle,
      {this.didTestScore,this.currentSction, this.qaz, this.fullscore, this.yourScore});
  @override
  _Completed_CourseState createState() => _Completed_CourseState();
}
class _Completed_CourseState extends State<Completed_course> {
  Map<String, String> updatableMap;
  _updateData() async {
    await Firestore.instance
        .collection('students')
        .document(studentSchoolString)
        .collection('students').document(curentUser.uid)
        .updateData({'myscore':testScore});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.didTestScore[widget.currentSction] = widget.yourScore.toString();
      var needStringTest =  widget.didTestScore.join(", ");

      updatableMap = {widget.courseTitle : needStringTest};

      testScore[widget.courseTitle] = needStringTest;
      _updateData();
    });
    print(widget.courseTitle);


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
                Text(qaz ? 'Құттықтаймыз!': 'Поздравляем!',style: TextStyle(fontFamily: 'Montserrat',fontSize: width/20,color: Colors.white),),
                Text(qaz ? 'Сіз тесті аяқтадыңыз':'Вы полностью закончили тест!',style: TextStyle(fontFamily: 'MR',fontSize: width/35,color: Colors.white),),
                Flexible(flex: 3,child:Image(image: AssetImage('assets/testwon.png'),height: height/4,),),
                Text(qaz ? 'Нәтижеңіз сақталды': 'Результаты сохранены',style: TextStyle(fontFamily: 'MR',fontSize: width/25,color: Colors.white),),
                SizedBox(height: height/40,),
                Icon(Icons.check,color: Colors.white70,size: 15,),
                SizedBox(height: height/40,),

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
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil(HomePage.id, (Route<dynamic> route) => false);
              },
              child: Container(
                width: width,
                height: height/14,
                decoration: BoxDecoration(

                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Center(child: Text(qaz ? "Басты бет": 'Главный экран', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'MR',fontSize: width/20,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
