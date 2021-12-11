import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:qazaccode/login/login_page.dart';
import 'package:qazaccode/shared/shared-pref.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:qazaccode/course/quiz.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
class Video_Page extends StatefulWidget {
  final String url;
  var progires;
  int currentL;
  List<bool> haveImage;
  List<String> ImageLink;
  final bool looping;
  final int currentLesson;
  final int finalLesson;
  final int currentSection;
  final List<String> questions;
  final List<List<String>> answers;
  final List<int> rightAnswers;
  static String id = 'kjnfdsdssldsankl';
  Video_Page(
      {this.url,
      this.rightAnswers,
      this.answers,
      this.questions,
      this.didTest,
      this.currentSection,
      this.didTestScore,
      this.finalLesson,
      this.currentLesson,
      this.looping,
      this.video,
      this.haveHomeWork,
      this.ImageLink,
      this.haveImage,
      this.homeWork,
      this.LessonName,
      this.SectionName,
      this.CourseTitle});
  VideoPlayerController video;
  final String SectionName;
  final String CourseTitle;
  final String LessonName;
  final List<String> didTest;
  final List<String> didTestScore;
  final bool haveHomeWork;
  Map<String, String> updatableMap;
  final List<String> homeWork;
  @override
  _Video_PageState createState() => _Video_PageState();
}
class _Video_PageState extends State<Video_Page> {
  ChewieController _chewieController;
  var haveTestorNot;
  _updateData() async {
    await Firestore.instance
        .collection('students')
        .document(studentSchoolString)
        .collection('students')
        .document(curentUser.uid)
        .updateData({'progress': map});
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
    _chewieController.dispose();
    widget.video.dispose();
    // IMPORTANT to dispose of all the used resources
  }
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.video,

      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
      systemOverlaysAfterFullScreen: [],
      autoPlay: false,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: false,

      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    SharedPreferencesHelper.getLanguageCode();

    var nullorone = widget.didTest[widget.currentSection];

    if (nullorone == '0' && widget.finalLesson == widget.currentLesson) {
      setState(() {
        for (var i in map.keys) {
          if (i == widget.CourseTitle) {
            widget.progires = map[i].split(", ");
            widget.progires[widget.currentSection] = '1';
            var needStringTest = widget.progires.join(", ");
            map[widget.CourseTitle] = needStringTest;
            _updateData();
          }
        }
        haveTestorNot = true;
        nullorone = '1';
      });
    } else {
      setState(() {
        haveTestorNot = false;
      });
    }
  }

  createHomeWork(
    double width,
    double height,
    int index,
  ) {
    final List<Gradient> colorGradients = [
      LinearGradient(colors: [Color(0xffed213a), Color(0xff93291e)]),
      LinearGradient(colors: [Color(0xFFefc76c), Color(0xffb58438)]),
      LinearGradient(colors: [Color(0xff09203f), Color(0xff537895)]),
    ];
    final List<Color> progresColor = [
      Color(0xff93291e),
      Color(0xffb58438),
      Color(0xff537895),
    ];
    List<String> labels = ['Senior', 'Middle', 'Junior'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: progresColor[index],
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0,
                  // horizontal, move right 10
                  0.0, // vertical, move down 10
                ),
              ),
            ],
            gradient: colorGradients[index],
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  labels[index],
                  style: TextStyle(
                      fontSize: width / 5,
                      color: Colors.white24,
                      fontFamily: 'Montserrat'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.homeWork[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: width / 30),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var HomeWorks = <Widget>[];
    for (var i = 0; i < 3; i++) {
      var homeCard = createHomeWork(width, height, i);
      HomeWorks.add(homeCard);
    }
    return Scaffold(
      floatingActionButton: haveTestorNot
          ? FloatingActionButton(
              child: Icon(Icons.work),
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new QuizPage(
                              didTestScore: widget.didTestScore,
                              courseTitle: widget.CourseTitle,
                              currentSection: widget.currentSection,
                              didTest: widget.didTest,
                              questions: widget.questions,
                              answers: widget.answers,
                              rightAnswers: widget.rightAnswers,
                              haveImage: widget.haveImage,
                              ImageLink: widget.ImageLink,
                            )),
                    (Route<dynamic> route) => false);
              },
            )
          : null,
      appBar: AppBar(
        title: Text(widget.CourseTitle),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Chewie(
            controller: _chewieController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: Container(
                  width: double.infinity,
                  color: Color(0xFF3D3868),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    widget.LessonName + '.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: width / 20),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              height: height / 40,
            ),
          ),
          widget.haveHomeWork
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple,
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0,
                                  // horizontal, move right 10
                                  0.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: [Color(0xff9d50bb), Color(0xff6e48aa)]),
                          ),
                          child: Text(
                            qaz ? 'Үй жұмысы' : 'Задания для практики',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: width / 20,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Container(
                      height: height / 4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: HomeWorks,
                      ),
                    )
                  ],
                )
              : Flexible(
                  child: Center(
                  child: Container(
                    height: height/2,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Text('На этом все',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: width/20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
