import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:qazaccode/tabprogress/All.dart';
import 'package:qazaccode/tabprogress/completed.dart';
import 'package:qazaccode/tabprogress/progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qazaccode/login/login_page.dart';
class Coirses_Page extends StatefulWidget {
  static String id = 'courses';
  @override
  _Coirses_PageState createState() => _Coirses_PageState();
}

class _Coirses_PageState extends State<Coirses_Page> with TickerProviderStateMixin{
  String herotag = 'mal';
  String appBarName;
  String studentSchoolString = 'mal';
  String aseetRoadforCorcs;
  List availableCorsces = [];

  @override
  void initState() {
    FirebaseUser user;

    super.initState();

    tabs = [
      Tab(text: qaz? 'Barlyǵy' : 'Все',),
      Tab(text: qaz?'Oqyp jatyrmyn':'Прохожу сейчас',),
      Tab(text: qaz?'Aıaqtadym':'Закончил',)
    ];

    _controller = TabController(length: tabs.length, vsync: this);
  }

  List<Tab> tabs;
  TabController _controller;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 80, 115, 1),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height/15,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 15,),
              child: Text(qaz? 'Menіń kýrstarym': 'Мои курсы',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width / 14),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,bottom: height/60 ),
              child: TabBar(

                labelStyle: TextStyle(color: Colors.red,),
                labelColor: Colors.black,
                indicatorPadding: EdgeInsets.all(16),
                labelPadding:EdgeInsets.symmetric(horizontal: 22),
                unselectedLabelColor: Color.fromRGBO(119, 124, 149, 1),
                isScrollable: true,
                tabs: tabs,
                controller: _controller,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BubbleTabIndicator(
                  indicatorHeight: 30.0,
                  indicatorColor: Colors.white,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            Flexible(
              child: SizedBox.fromSize(
                size: Size.fromHeight(height/1.1),
                child: TabBarView(

                  controller: _controller,
                  children: <Widget>[
                    All_tabs(),
                    Progress_Bar(),
                    Completed_tab(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}