import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qazaccode/login/login_page.dart';

class Coming_Soon_Overall extends StatefulWidget {
  static String id = 'dbkd';
  @override
  _Coming_Soon_OverallState createState() => _Coming_Soon_OverallState();
}

class _Coming_Soon_OverallState extends State<Coming_Soon_Overall> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> cards;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          qaz ? 'Жуырда' : 'Скоро',
          style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Swiper(
              layout: SwiperLayout.TINDER,
              itemWidth: width / 1,
              itemHeight: height / 1.2,
              itemBuilder: (context, index) {
                return Hero(
                    tag: 'overall',
                    child: NewCourseCard(
                      index: index,
                      width: width,
                      height: height,
                    ));
              },
              itemCount: 3),
        ],
      ),
    );
  }
}
class NewCourseCard extends StatelessWidget {
  NewCourseCard({
    this.height,
    this.width,
    this.index,
  });
  List<String> courseDescriptionQZ = [
    'ReactNative best lksmaf kdlsfmklsdfmk lsdfmkd lsfmlskdmfl ksdmfk lsdmfs',
    'На курсе мы изучаем основные инструменты редактора Unity, а также подходы, которые используются при разработке игр. После обучения вы будете не только понимать принципы большинства существующих игровых механик, а также сможете их реализовывать на практике.',
    'Phyton dspk kfjksdfjklsd fmklsdfm lksdmflks dmflksf'
  ];
  List<String> courseDescriptionRU = [
    'В этом курсе мы покроем тему React Native с самого начала. В конце этой серии вы сможете делать профессиональные сайты',
    'На курсе мы изучаем основные инструменты редактора Unity, а также подходы, которые используются при разработке игр. После обучения вы будете не только понимать принципы большинства существующих игровых механик, а также сможете их реализовывать на практике.',
    'Python – одна из самых быстро развивающихся и востребованных языков программирования в мире. В нем существует множество фреймворков для различных направлений. Игры, сайты, приложения. Абсолютно все это возможно вместе с python. Однако, помимо все прочего, важной ветвью в программирований является  Data Science. Благодаря ему возможны обширные хранилища данных. Менеджмент информаций и данных на сегодняшний день является очень актуальной проблемой на заре облачных хранилищ. Обо всем этом и не только вы сможете узнать в последствий, изучая python глубже и глубже'
  ];
  List<String> pictures = [
    'assets/reactbg.png',
    'assets/unitybg.png',
    'assets/mlbg.png'
  ];
  List<String> topics = ['React', 'Unity', 'Python'];
  List<String> shortIntroQZ = [
    'Веб-сайттар жасау',
    'Компьютерлік ойындар жасау',
    'Data - мен жұмыс'
  ];
  List<String> shortIntroRU = [
    'Создание веб-сайтов',
    'Создание компьютерных игр',
    'Создание искусственного интеллекта'
  ];

  final double width;
  final double height;
  final int index;
  final List<Gradient> colorGradientsComingSoon = [
    LinearGradient(colors: [Color(0xff218FE8), Color(0xff8CE2FF)]),
    LinearGradient(colors: [Colors.purpleAccent, Colors.purple]),
    LinearGradient(colors: [Color(0xff40E86F), Color(0xffC4F9AF)]),
    LinearGradient(colors: [Color(0xff8dc26f), Color(0xff76b852)]),
  ];
  List<String> topicActionQZ = ['қолданады', 'арқылы жасалған', ''];
  List<String> topicActionRU = ['используется', 'сделанные игры', 'используют такие компании'];
  List<String> topicActionText = [
    'Facebook, Instagram, Skype, VS Code',
    "Assasin's creed unity, HearthStone, Warhammer 40000: Regicide",
    'Instagram, Facebook, Google, Amazon'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage(pictures[index])),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(left: width/10, top: height/16),
                      child: Text(
                        topics[index],
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 10),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  width/10),
                      child: Text(
                        qaz ? shortIntroQZ[index] : shortIntroRU[index],
                        style: TextStyle(
                            fontSize: width / 20,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Container(
                      height: height/2.5,
                      child: SingleChildScrollView(

                        child: Padding(
                          padding: EdgeInsets.only(right:  width/20, bottom: 16, left:  width/10),
                          child: Column(
                            children: <Widget>[
                              Text(qaz ? courseDescriptionQZ[index] : courseDescriptionRU[index],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: width / 22, fontFamily: 'MR'),
                              ),
                              SizedBox(
                                height: height/100,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 15,
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                child: Text(
                  '2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width / 4,
                      color: Colors.white30,
                      letterSpacing: 2,
                      fontFamily: 'Montserrat'),
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      topics[index],
                      textAlign: TextAlign.left,
                      style:
                      TextStyle(color: Colors.white, fontSize: width / 14),
                    ),
                    Text(
                      qaz ? topicActionQZ[index] : topicActionRU[index],
                      style: TextStyle(
                          fontSize: width / 25, color: Colors.white70),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, bottom: 8),
                      child: Text(
                        topicActionText[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 22, fontFamily: 'MR'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: colorGradientsComingSoon[index]),
        ),
      ],
    );
  }
}
