import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'completed_exam.dart';

class QuizExam extends StatefulWidget {
  final List<String> questions;
  final List<List<String>> answers;
  final List<bool> haveImage;
  final List<String> ImageLink;
  final List<int> rightAnswers;
  final String courseTitle;
  QuizExam(
      {this.courseTitle,
      this.questions,
      this.rightAnswers,
      this.answers,
      this.haveImage,
      this.ImageLink});
  @override
  _QuizExamState createState() => _QuizExamState();
}

class _QuizExamState extends State<QuizExam> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var currentAnswer = 0;
  var currentQuestion = 0;
  var yourscore = 0;
  var b1 = false;
  var b2 = false;
  var b3 = false;
  var b4 = false;

  _createAnswers(List<String> ans, double width) {
    return Container(
      width: width / 1.2,
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromRGBO(37, 44, 74, 1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: Color.fromRGBO(33, 73, 107, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'A это тупоdй ответ',
          style: TextStyle(color: Colors.white, fontSize: width / 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var containerAnswer = <Widget>[];
    for (var i = 0; i < 4; i++) {
      var huina = _createAnswers(
        ['njfds'],
        width,
      );
      containerAnswer.add(huina);
    }
    void showAchievementView(BuildContext context) {
      AchievementView(context,
          title: "Урааааа!",
          subTitle: "Вы ответили правильно!",
          icon: Icon(
            Icons.school,
            color: Colors.white,
          ),
          color: Colors.blue,
          duration: Duration(seconds: 1),
          isCircle: true, listener: (status) {
        print(status);
      })
        ..show();
    }

    void showLoserView(BuildContext context) {
      AchievementView(context,
          title: "Будьте внимательны",
          subTitle: "Вы допустили ошибку",
          //onTab: _onTabAchievement,
          icon: Icon(
            MdiIcons.emoticonSad,
            color: Colors.white,
          ),
          //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
          //borderRadius: 5.0,
          color: Colors.redAccent,
          //textStyleTitle: TextStyle(),
          //textStyleSubTitle: TextStyle(),
          //alignment: Alignment.topCenter,
          duration: Duration(seconds: 1),
          isCircle: true,
          listener: (status) {})
        ..show();
    }

    return Scaffold(
      backgroundColor: Color(0xff1e1e2c),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: Text(
              qaz
                  ? 'Сұрақ $currentQuestion/${widget.questions.length}'
                  : 'Вопрос $currentQuestion/${widget.questions.length} ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: width / 15,
                  fontFamily: "Montserrat"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff3dd1f2), Color(0xff3d88f2)])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: height / 4,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.questions[currentQuestion],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    widget.haveImage[currentQuestion]
                        ? FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.ImageLink[currentQuestion],
                            height: height / 2.5,
                            width: width / 1,
                          )
                        : SizedBox(
                            height: 1,
                          )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  b1 = true;
                  b2 = false;
                  b3 = false;
                  b4 = false;
                  currentAnswer = 1;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 44, 74, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 3, color: Color.fromRGBO(33, 73, 107, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width / 1.325,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.answers[currentQuestion][0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: width / 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        b1 ? Icons.check_circle : Icons.panorama_fish_eye,
                        color: Color.fromRGBO(31, 126, 235, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  b1 = false;
                  b2 = true;
                  b3 = false;
                  b4 = false;
                  currentAnswer = 2;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 44, 74, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 3, color: Color.fromRGBO(33, 73, 107, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width / 1.325,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.answers[currentQuestion][1],
                                style: TextStyle(
                                    color: Colors.white, fontSize: width / 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        b2 ? Icons.check_circle : Icons.panorama_fish_eye,
                        color: Color.fromRGBO(31, 126, 235, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  b1 = false;
                  b2 = false;
                  b3 = true;
                  b4 = false;
                  currentAnswer = 3;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 44, 74, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 3, color: Color.fromRGBO(33, 73, 107, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width / 1.325,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.answers[currentQuestion][2],
                                style: TextStyle(
                                    color: Colors.white, fontSize: width / 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        b3 ? Icons.check_circle : Icons.panorama_fish_eye,
                        color: Color.fromRGBO(31, 126, 235, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentAnswer = 4;
                  b1 = false;
                  b2 = false;
                  b3 = false;
                  b4 = true;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 44, 74, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 3, color: Color.fromRGBO(33, 73, 107, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width / 1.325,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: width / 1.325,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.answers[currentQuestion][3],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width / 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        b4 ? Icons.check_circle : Icons.panorama_fish_eye,
                        color: Color.fromRGBO(31, 126, 235, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 160,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (currentAnswer == 0) {
                        null;
                      } else {
                        setState(() {
                          b1 = false;
                          b2 = false;
                          b3 = false;
                          b4 = false;
                          currentQuestion++;
                          if (currentAnswer ==
                              widget.rightAnswers[currentQuestion - 1]) {
                            showAchievementView(context);
                            setState(() {
                              yourscore++;
                              currentAnswer = 0;
                            });
                          } else {
                            showLoserView(context);
                            currentAnswer = 0;
                          }
                        });
                        if (currentQuestion > widget.questions.length - 1) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Completed_exam(
                                        fullscore: widget.questions.length,
                                        courseTitle: widget.courseTitle,
                                        yourScore: yourscore,
                                      )),
                              (Route<dynamic> route) => false);
                        }
                      }
                    },
                    child: Container(
                      height: height / 15,
                      width: width / 4,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff3dd1f2), Color(0xff3d88f2)],
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: width / 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
