import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';

import 'package:qazaccode/course/couse_preview.dart';

class All_tabs extends StatefulWidget {
  static String id = 'smkldlaksd';
  @override
  _All_tabsState createState() => _All_tabsState();
}

class _All_tabsState extends State<All_tabs> {
//
  @override
  void initState() {
    super.initState();
  }

  countProgrss(String inesx) {
    for (var i in progress.keys) {
      if (i == inesx) {
        setState(() {
          someVar = i;
          print(someVar);
        });
        progressCount = progress[someVar].split(", ");
        for (var i = 0; i < progressCount.length; i++) {
          var prog = int.parse(progressCount[i]);
          setState(() {
            arrayPr.add(prog);
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
    });
    print(doubCalc);
    return doubCalc;
  }

  _createCourseCard(
      LinearGradient bgColor,
      Color lineColor,
      String courseName,
      double height,
      double fontSize,
      int index,
      double courseNameSize,
      double betweenSpace,
      double widthIndicator) {
    final List<Gradient> colorGradients = [
      LinearGradient(colors: [Color(0xff3dd1f2), Color(0xff3d8bf2)]),
      LinearGradient(colors: [Color(0xfff2c12e), Color(0xfff28241)]),
      LinearGradient(colors: [Color(0xffec8eff), Color(0xff9f69ff)]),
      LinearGradient(colors: [Color(0xff8dc26f), Color(0xff76b852)]),
    ];
    final List<Color> colorsProgramming = [
      Color(0xff3dd1f2),
      Color(0xfff2c12e),
      Color(0xffec8eff),
      Color(0xaa8dc26f),
    ];
    final List<Color> progresColor = [
      Color(0xff85edee),
      Color(0xfffcd783),
      Color(0xff9f69ff),
      Color(0xaa8dc26f),
    ];
    return new Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: GestureDetector(
        onTap: () {
          print('assets/${availableCorsces[index]}_1.png');
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new CoursePreview(
                    courseTitle: availableCorsces[index],
                    gradientCourse: colorGradients[index],
                    imgRoute:
                        'assets/${availableCorsces[index].toLowerCase()}_1.png',
                  )));
        },
        child: Container(
          height: height,
          decoration: BoxDecoration(
              gradient: colorGradients[index],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: progresColor[index],
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: colorsProgramming[index]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Text(
                            qaz ? 'Bagdarlamalau' : 'Программирование',
                            style: TextStyle(
                                fontSize: fontSize,
                                color: Colors.white,
                                fontFamily: 'MR'),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, top: 16),
                            child: Image.asset(
                              'assets/${availableCorsces[index].toLowerCase()}_1.png',
                              height: height / 3.4,
                            ),
                          )),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      availableCorsces[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: courseNameSize,
                      ),
                    ),
//
                  ],
                ),
              ),
              SizedBox(
                height: height / 15,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: widthIndicator / 12, left: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: widthIndicator,
                      animation: true,
                      lineHeight: 5.0,
                      animationDuration: 3000,
                      backgroundColor: Colors.white,
                      percent: countProgrss(availableCorsces[index]),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: progresColor[index],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var containerCard = <Widget>[];
    for (var i = 0; i < availableCorsces.length; i++) {
      var huina = _createCourseCard(
          LinearGradient(colors: [Colors.blue, Colors.red]),
          Colors.red,
          'sadasda',
          height / 3.5,
          width / 25,
          i,
          width / 10,
          height / 30,
          width / 1.3);
      containerCard.add(huina);
    }

    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 8),
          child: ListView(children: containerCard),
        ));
  }
}
