//import 'package:flutter/material.dart';
//import 'package:qazaccode/login/login_page.dart';
//import 'package:liquid_swipe/liquid_swipe.dart' as swipe;
//class OnBoard extends StatefulWidget {
//  static String id = 'onboarding';
//  @override
//  _OnBoardState createState() => _OnBoardState();
//}
//
//class _OnBoardState extends State<OnBoard> {
//
//  List<int> btnTap = [0, 1, 2];
//  int currentCl = 1;
//  List<Gradient> btnCLS = [
//    LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
//    LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
//    LinearGradient(colors: [Colors.red, Colors.redAccent])
//  ];
//  List<Color> clrs = [Colors.deepPurple,Colors.yellow,Colors.blue];
//
//
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    final pages = [
//      Container(
//        width: width,
//        child: Row(
//          children: <Widget>[
//            Container(
//              width: width/1.15,
//              color: Color(0xfffc9399),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//
//
//                children: <Widget>[
//                  SizedBox(
//                    height: height/10,
//                  ),
//                  Flexible(
//                    child: Align(
//
//                      child: Image.asset(
//                        'assets/11.png',
//                        width: width,
//                        fit: BoxFit.cover,
//                      ),
//                      alignment: Alignment.topCenter,
//                    ),
//                  ),
//                  Padding(padding: const EdgeInsets.all(20.0)),
//                  Padding(
//                    padding:  EdgeInsets.only(left: width/8,bottom: height/8),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(bottom:4.0),
//                          child: new Text(
//                            "Эффективное",
//                            style: TextStyle(
//                                fontSize: width/20,
//                                color: Colors.white70,
//                                fontFamily: "MR",
//                                fontWeight: FontWeight.w600),
//                          ),
//                        ),
//                        new Text(
//                          "Обучение",
//                          style: TextStyle(
//                              fontSize: width/10,
//                              color: Color.fromRGBO(224, 228, 254, 1),
//                              fontFamily: "Montserrat",
//                              fontWeight: FontWeight.w600),
//                        ),
//                        Container(
//                          width: width/1.7,
//                          child: new Text(
//                            "С нашим приложением вы сможете обучатся программированию где угодно и когда угодно.",
//                            style: TextStyle(
//                              color: Colors.white,
//                                fontSize: width/25,
//                                fontFamily: 'Montserrat',
//                                fontWeight: FontWeight.w900),
//                          ),
//                        ),
//
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            ),
//            Flexible(
//              child: Container(
//                width: width,
//                height: height,
//                color: Color(0xff313d6f),
//              ),
//            ),
//          ],
//        ),
//      ),
//
//
//
//
//
//      Container(
//        child: Row(
//          children: <Widget>[
//            Container(
//              width: width/1.15,
//              color: Color(0xff313d6f),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//
//
//                children: <Widget>[
//                  SizedBox(
//                    height: height/10,
//                  ),
//                  Flexible(
//                    child: Align(
//
//                      child: Image.asset(
//                        'assets/2.png',
//                        width: width,
//                        fit: BoxFit.cover,
//                      ),
//                      alignment: Alignment.topCenter,
//                    ),
//                  ),
//                  Padding(padding: const EdgeInsets.all(20.0)),
//                  Padding(
//                    padding:  EdgeInsets.only(left: width/8,bottom: height/8),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(bottom:4.0),
//                          child: new Text(
//                            "Ваша",
//                            style: TextStyle(
//                                fontSize: width/15,
//                                color: Colors.white70,
//                                fontFamily: "MR",
//                                fontWeight: FontWeight.w600),
//                          ),
//                        ),
//                        new Text(
//                          "статистика",
//                          style: TextStyle(
//                              fontSize: width/10,
//                              color: Color.fromRGBO(224, 228, 254, 1),
//                              fontFamily: "Montserrat",
//                              fontWeight: FontWeight.w600),
//                        ),
//                        Container(
//                          width: width/1.7,
//                          child: new Text(
//                            "Здесь вы так же сможете отслеживать свой результат. Процентное соотношение помогает наглядно увидеть ваши успехи на экране.",
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: width/25,
//                                fontFamily: 'Montserrat',
//                                fontWeight: FontWeight.w900),
//                          ),
//                        ),
//
//                      ],
//                    ),
//                  ),
//
//                ],
//              ),
//            ),
//            Flexible(
//              child: Container(
//                height: height,
//                width: width,
//                color: Color(0xff842d72),
//              ),
//            )
//          ],
//        ),
//      ),
//      Container(
//        child: Row(
//          children: <Widget>[
//            Container(
//              width: width/1.15,
//              color: Color(0xff842d72),
////          Color(0xff842d72)
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  SizedBox(
//                    height: height/10,
//                  ),
//                  Flexible(
//                    child: Align(
//
//                      child: Image.asset(
//                        'assets/testwon.png',
//                        width: width,
//                        fit: BoxFit.cover,
//                      ),
//                      alignment: Alignment.topCenter,
//                    ),
//                  ),
//                  Padding(padding: const EdgeInsets.all(20.0)),
//                  Padding(
//                    padding:  EdgeInsets.only(left: width/8),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(bottom:4.0),
//                          child: new Text(
//                            "Достойная",
//                            style: TextStyle(
//                                fontSize: width/15,
//                                color: Colors.white70,
//                                fontFamily: "MR",
//                                fontWeight: FontWeight.w600),
//                          ),
//                        ),
//                        new Text(
//                          "Награда",
//                          style: TextStyle(
//                              fontSize: width/10,
//                              color: Color.fromRGBO(224, 228, 254, 1),
//                              fontFamily: "Montserrat",
//                              fontWeight: FontWeight.w600),
//                        ),
//                        Container(
//                          width: width/1.7,
//                          child: new Text(
//                            "По истечений курса вы получите сертификат соответствующий вашим достижениям в обучений.",
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: width/25,
//                                fontFamily: 'Montserrat',
//                                fontWeight: FontWeight.w900),
//                          ),
//                        ),
//
//                      ],
//                    ),
//                  ),
//                  Align(
//                    alignment: Alignment.bottomLeft,
//                    child: Padding(
//                      padding:  EdgeInsets.only(bottom: height/16,top: 16,left: width/8),
//                      child: GestureDetector(
//                        onTap: (){
//                          Navigator.pushAndRemoveUntil(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => LoginPage(
//                                  )),
//                                  (Route<dynamic> route) => false);
//                        },
//                        child: Container(
//                          height: height/15,
//                          width: width/2.2,
//                          decoration: BoxDecoration(
//                              color: Color(0xfffc9399),
//                              borderRadius: BorderRadius.circular(24)
//                          ),
//                          child: Center(
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text('Начать!',textAlign: TextAlign.center,style: TextStyle(
//                                color:Colors.white,
//                                fontSize: width/20,
//                                fontFamily: 'Montserrat',
//
//                              ),),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Flexible(
//              child: Container(
//                width: width,
//                height: height,
//                color: Color(0xfffc9399),
//
//              ),
//            )
//          ],
//        ),
//      ),
//    ];
//    return new MaterialApp(
//        home: new Scaffold(
//            body: swipe.LiquidSwipe(
//              pages: pages,
//              fullTransitionValue: 500,
//              enableSlideIcon: true,
//            )));
//  }
//
//
//}