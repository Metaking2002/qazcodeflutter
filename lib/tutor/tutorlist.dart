import 'package:flutter/material.dart';
import 'package:qazaccode/login/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TutorList extends StatefulWidget {
  static String id = 'onboardasdssdasdasdsaddaing';
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  List<String> accounts = ['aman@gmail.com','azat@gmail.com','katya@gmail.com'];
  List<String> names = ['Aman K K','Azat K K','Katya J J'];
  List<String> works = ['Python','C++','C#'];
  List<String> call = ['87055946569','87073728701','87074738791'];
  final auth = FirebaseAuth.instance;
  var streamline = Firestore.instance.document('');
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    auth.currentUser().then((user) {
//      curentUser = user;
//
//      getCurrentUserSchool();
//    });
//    for (var i = 0; i < 3;i++){
//      Firestore.instance.collection('tutor').document(accounts[i]).get().then((documents){
//        print(accounts[i]);
//        setState(() {
//          names.add(documents.data['name']);
//          works.add(documents.data['work']);
//          call.add(documents.data['phone']);
//          print(names);
//        });
//      });
//    }
//  }

//  Future getCurrentUserSchool() async {
//    try {
//      Firestore.instance
//          .collection('tutors')
//          .document()
//          .get()
//          .then((documents) {
//        setState(() {
//          names.add(documents.data['name']);
//          works.add(documents.data['work']);
//          call.add(documents.data['phone']);
//          print(names);
//        });
//      });
//    } catch (e) {
//      print(e);
//    }
//  }

  @override
  Widget build(BuildContext context) {

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
      return new Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: GestureDetector(
          onTap: () {

          },
          child: Container(
            height: height/2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      10.0, // horizontal, move right 10
                      10.0, // vertical, move down 10
                    ),
                  ),
                ]),
            child: Center(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        child: Container(
                          width: height ,
                          decoration: BoxDecoration(
                            gradient: colorGradients[2],
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                names[index][0],
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: height / 4),
                              )),
                        ),
                        shape: CircleBorder(),
                        elevation: 20,
                      ),
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
                            names[index],
                            style: TextStyle(
                                fontSize: height / 5,
                                fontFamily: 'Montserrat',
                                color: Colors.black87,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              works[index],
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Montserrat',
                                  fontSize: height / 10),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              call[index],
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Montserrat',
                                fontSize: height/10
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      );
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var containerCard = <Widget>[];
    for (var i = 0; i < 3; i++) {
      var huina = _createCourseCard(
          LinearGradient(colors: [Colors.blue, Colors.red]),
          Colors.red,
          'sadasda',
          height / 5,
          width / 25,
          i,
          width / 10,
          height / 30,
          width / 1.3);
      containerCard.add(huina);
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Поиск Репетитора'
        ),
      ),
    body: Container(
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
          )),
    );
  }
}
