import 'package:flutter/material.dart';
import 'package:qazaccode/all_screens/bottomnavbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'myaccount.dart';
import 'package:qazaccode/course/quizExam.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class Downloads_Page extends StatefulWidget {
  static String id = 'download';
  @override
  _Downloads_PageState createState() => _Downloads_PageState();
}

class _Downloads_PageState extends State<Downloads_Page> {
  _createProgressCard(
    int index,
    double height,
    double width,
  ) {
    var alertStyle = AlertStyle(
      backgroundColor: Colors.white,
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: width / 26,
      ),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
            color: Color.fromRGBO(75, 82, 112, 1),
            width: 1,
            style: BorderStyle.solid),
      ),
      titleStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'),
    );

    String score;
    int sum;
    var need;
    bool readyForExam;
    int sumEmptySection;
    List<int> scores = [];
    List<int> emptySections = [];
    List<int> allSections = [];
    double percentOverall;
    int examScoreProgress;
    String percentTest;
    String percentExam;
    double rangIndicator;
    int onlyTestScore;
    for (var i in testScore.keys) {
      if (i == availableCorsces[index]) {
        var progrescs = testScore[i].split(", ");

        setState(() {
          for (var a = 0; a < progrescs.length; a++) {
            var charity = progrescs[a];
            var integers = int.parse(charity);

            scores.add(integers);
          }
          sum = scores.reduce((a, b) => a + b);
          onlyTestScore = scores.reduce((a, b) => a + b);
          percentTest = (onlyTestScore * 100 / 80).toStringAsFixed(1);

          for (var i in examScore.keys) {
            if (i == availableCorsces[index]) {
              examScoreProgress = examScore[i];
              if (examScoreProgress != -1) {
                sum += examScoreProgress;
                percentExam = (examScoreProgress * 100 / 40).toStringAsFixed(1);
              }
            }
          }
          setState(() {
            percentOverall = (sum) / 120;
            rangIndicator = (sum * 100) / 120;
          });
        });
      }
    }

    for (var i in testMap.keys) {
      if (availableCorsces[index] == i) {
        setState(() {
          var statisticSection = testMap[i].split(", ");
          for (var a = 0; a < statisticSection.length; a++) {
            if (statisticSection[a] == '0') {
              var charity = statisticSection[a];
              var integers = int.parse(charity);
              emptySections.add(1);
            }
            var charity2 = statisticSection[a];

            var integers2 = int.parse(charity2);
            allSections.add(integers2);
          }
          if (statisticSection.contains('0')) {

            sumEmptySection = emptySections.reduce((a, b) => a + b);
          }
          var sumallSections = allSections.reduce((a, b) => a + b);
          if (statisticSection.length == sumallSections) {
            setState(() {
              readyForExam = true;

            });
          } else {
            setState(() {
              readyForExam = false;
            });
          }
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
       padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '${availableCorsces[index]}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: width / 20,
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: percentOverall,
              center: new Text(
                "$sum/120",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat'),
              ),
              footer: new Text(
                sumEmptySection == null
                    ? 'Вы прошли все тесты!'
                    : "Осталось пройти: $sumEmptySection тестов ",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width / 40,
                    color: Colors.black54),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Color(0xfff56d91),
              backgroundColor: Color(0xffdfdfe2),
              animationDuration: 2000,
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: 1,
              width: width / 1.6,
              color: Color(0xffdfdfe2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: width / 4,
                      height: height / 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            percentTest.toString() + '%',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: width / 16,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Выполнено тестов',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: width / 50,
                                  fontFamily: 'Montserrat'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  examScoreProgress == -1 && readyForExam == false
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                              width: width / 4,
                              height: height / 10,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Center(
                                child: Text(

                                  'Для экзамена пройдите все тесты',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: width / 40,
                                  ),
                                ),
                              )),
                        )
                      : examScoreProgress == -1 && readyForExam == true
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Alert(
                                    style: alertStyle,
                                    context: context,
                                    title: "Внимание!",
                                    desc:
                                        "Вы хотите пройти экзамен прямо сейчас? Экзамен состоит из 40 тестов",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Да",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          if (availableCorsces[index] ==
                                              'Python') {
                                            setState(() {
                                              need = Python;
                                            });
                                          }
                                          if (availableCorsces[index] ==
                                              'JavaScript') {
                                            setState(() {
                                              need = JavaScript;
                                            });
                                          }
                                          if (availableCorsces[index] == 'C#') {
                                            setState(() {
                                              need = CSharp;

                                            });
                                          }
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      new QuizExam(
                                                        questions:
                                                            need.questions,
                                                        answers: need.answers,
                                                        courseTitle:
                                                            availableCorsces[
                                                                index],
                                                        rightAnswers:
                                                            need.rightAnswers,
                                                        haveImage:
                                                            need.haveImage,
                                                        ImageLink:
                                                            need.ImageLink,
                                                      )),
                                              (Route<dynamic> route) => false);
                                        },
                                        width: width / 2.5,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ).show();
                                },
                                child: Container(
                                    width: width / 4,
                                    height: height / 10,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xfff56d91),
                                            blurRadius:
                                                1.0, // has the effect of softening the shadow
                                            spreadRadius:
                                                0.0, // has the effect of extending the shadow
                                            offset: Offset(
                                              0.0, // horizontal, move right 10
                                              0.0, // vertical, move down 10
                                            ),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xfff56d91)),
                                    child: Center(
                                      child: Text(
                                        'Начать экзамен!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: width / 40,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: width / 4,
                                height: height / 10,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      percentExam + '%',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: width / 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'Экзамен сдан       ',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: width / 50,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                  width: width / 1.6,
                  height: height / 10,
                  child: LiquidLinearProgressIndicator(
                    value: 0.3, // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(Color(
                        0xfff56d91)), // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors
                        .white, // Defaults to the current Theme's backgroundColor.
                    borderColor: Colors.white,
                    borderWidth: 0.0,
                    borderRadius: 16.0,
                    direction: Axis
                        .vertical, //// The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                    center: Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Material(
                              child: Container(
                                width: width / 10,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.school,
                                      color: Colors.pink,
                                    )),
                              ),
                              shape: CircleBorder(),
                              elevation: 20,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: rangIndicator < 25
                                ? Text(
                                    'Ваш уровень: Beginner',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: width / 30,
                                      fontFamily: 'Montserrat',
                                    ),
                                  )
                                : rangIndicator > 25 && rangIndicator < 65
                                    ? Text(
                                        'Ваш уровень: Junior',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: width / 30,
                                          fontFamily: 'Montserrat',
                                        ),
                                      )
                                    : rangIndicator >= 65 && rangIndicator < 85
                                        ? Text(
                                            'Ваш уровень: Middle',
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: width / 30,
                                              fontFamily: 'Montserrat',
                                            ),
                                          )
                                        : Text(
                                            'Ваш уровень: Senior',
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: width / 30,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
//          Color(0xffdfdfe2),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                0.0, // vertical, move down 10
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var containerCard = <Widget>[];
    for (var i = 0; i < availableCorsces.length; i++) {
      var huina = _createProgressCard(i, height, width);

      containerCard.add(huina);
    }
    ;
    return Scaffold(
      backgroundColor: Color(0xfff7f5f2),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(75, 82, 112, 1),
        title: Text(
          'Статистика',
          style: TextStyle(
              color: Colors.white,
//              Color.fromRGBO(75, 82, 112, 1),
              fontSize: width / 20,
              fontFamily: 'Montserrat'),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width / 1.2,
            height: double.infinity,
            child: ListView(
              children: containerCard,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseExam {
  final List<String> questions;
  final List<List<String>> answers;
  final List<bool> haveImage;
  final List<String> ImageLink;
  final List<int> rightAnswers;
  CourseExam(
      {this.questions,
      this.rightAnswers,
      this.answers,
      this.haveImage,
      this.ImageLink});
}

var Python = CourseExam(
  questions: [
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Какое ключевое слово используется в функциях, чтобы превратить их в генераторы?',
    'Что выведет данный код?',
    "Вывод программы: ['Q', 'Qa', 'Qaz', 'QazC', 'QazCo', 'QazCod', 'QazCode']. Выберите пропущенную строку",
    'Что выведет данный код?',
    'Как с помощью декоратора можно по другому написать эту строку: program = my_program(program)?',
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Какой из следующих типов данных не допускает дублирование значений?',
    'Какой метод вызывается непосредственно перед созданием объекта?',
    'Можно разделять tuple?',
    'Что будет возвращтаь функция без метода return()?',
    'Что выведет эта строка: print("{2}{1}{1}".format("qaz", "code","go"))?',
    "a = '{x}, {y}'.format(x='qaz', y='code'). Что выведет программа, если запустить строку: print(a)?",
    'var =  int("3" + "4"). Что выведет программа, если запустить строку: print(var)?',
    'age = -18, Что выведет код если запустить эту строку: assert (age >= 0), "Impossible"?',
    'file = open("randomfile.txt", "r"). Какой файл откроет этот код?',
    'С помощью какого метода можно закрыть файл?',
    'Как можно сократить else if?',
    'Найдите сумму всех чисел, которую выведет программа. Выберите правильный ответ',
    'Что выведет данный код?',
    'Сколько слов Waiting выведет программа?',
    'Что выведет данный код?',
    'Что такое bool?',
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Что выведет данный код?',
    'Какой результат выдаст данный участок программы?',
    'Что такое @mission?',
    'Какой результат выдаст данный участок программы?',
    'Для чего используется конструкция with ... as?',
    'Чем является return, raise, pass?',
    'Какой результат выдаст данный участок программы?',
    'Какой результат выдаст данный участок программы?',
    'Какое ключевое вызывает новые модули в python?',
    'Какое ключевое слово определяет анонимные функции?',
    'Какой результат выдаст данный участок программы?',
  ],
  answers: [
    [
      '15',
      '16',
      '14',
      '16.0',
    ],
    [
      '16.0',
      '16',
      '14',
      '15',
    ],
    [
      '321',
      '0',
      '1 2 3',
      '3 2 1',
    ],
    [
      'generate',
      'return',
      'yield',
      'gener',
    ],
    [
      '[1, 4]',
      '{1, 4}',
      '[1, 3, 6]',
      '{1, 3, 6}',
    ],
    [
      'company = i',
      'company+=i',
      'company+=Q',
      'print(QazCode)',
    ],
    [
      '{21, 12, 21, 12}',
      '[21, 12, 11, 21]',
      '[21, 12, 21, 21]',
      '{21, 22, 21, 21}',
    ],
    [
      '@my_program',
      '@program',
      '== program',
      '@(my_program)',
    ],
    [
      'False False',
      'False True',
      'True False',
      'True True',
    ],
    [
      "['Python', 3]",
      "{'Python', 3}",
      "{'Python', 5}",
      "{'React', 5}",
    ],
    [
      "Tuple",
      "Set",
      "Dictionary",
      "List",
    ],
    [
      "_create_",
      "_delete_",
      "_init_",
      "_update_",
    ],
    [
      "Да",
      "Нет",
      "Да, но выйдет ошибка!",
      "Только с помощью метода cut",
    ],
    [
      "0",
      "Ничего",
      "Ошибку",
      "False",
    ],
    [
      "gocodecode",
      "qazcodeqo",
      "codeqoqaz",
      "qazqazgo",
    ],
    [
      "codeqaz",
      "qazcode",
      "qaz code",
      "qaz, code",
    ],
    [
      "7",
      "3 4",
      "34",
      "'34'",
    ],
    [
      "Impossible",
      "AssertionError: Impossible",
      "Ничего",
      "Ошибка: меньше чем 0",
    ],
    [
      "randomfile.csx",
      "randomfile",
      "randomfile.txt",
      "random file.txt",
    ],
    [
      ".close()",
      ".delete()",
      ".read()",
      ".close.txt()",
    ],
    [
      "elfe",
      "elf",
      "Elif",
      "elif",
    ],
    [
      "2",
      "4",
      "3",
      "1",
    ],
    [
      "3",
      "0",
      "25",
      "1",
    ],
    [
      "0",
      "Бесконечно",
      "1",
      "Выдаст ошибку",
    ],
    [
      "y",
      "w",
      "z",
      "x",
    ],
    [
      "Название листа",
      "Числовой тип данных",
      "База данных",
      "Логический тип данных",
    ],
    [
      "12",
      "7.0",
      "7",
      "6",
    ],
    [
      "((9, 'one'), (2, 'two'))",
      "(9, 'one'), (2, 'two')",
      "((9, 'one'), (46, 'two'))",
      "((46, 'one'), (2, 'two'))",
    ],
    [
      "True False True",
      "False False False",
      "True True True",
      "True",
    ],
    [
      "1 True 0",
      "1 0 0",
      "0 False 0",
      "True 0",
    ],
    [
      'programming',
      'QazCode',
      'programming python QazCode',
      'python',
    ],
    [
      'Параметр',
      'Метод',
      'Декоратор',
      'класс',
    ],
    [
      'our Company is QazCode.',
      'our access_level is admin.',
      'our Company is QazCode',
      'our access_level is admin',
      'ошибка',
    ],
    [
      'Для того что бы сопрягать между собой методы',
      'Используется для оборачивания выполнения блока инструкций менеджером контекста',
      'Используется для получения доступа к директорий файлов',
      'Используется для соединений связи между классами',
    ],
    ['Метод', 'Класс', 'Ключевое слово', 'Параметр'],
    [
      'God of war 1997 Cs go 2010 final fantasy 1989 Tales of berseria 2016',
      'God of war Cs go final fantasy Tales of berseria',
      '1997 2010 1989 2016',
      'Ошибка *'
    ],
    [
      "{'Code vein': 3, 'nier': 7, dragon quest': 15, 'diablo': 11}",
      "ошибка *",
      "{'Code vein': 'nier', 'dragon quest': 'diablo'}",
      "{‘ 3 : 7, 15 : 11}"
    ],
    ["global", "assert", "import *", "finally"],
    ["yield", "nonlocal", "except", "lambda *"],
    [
      "{ 'username': 'Arman', 'password': '123' }",
      "{ 'username': 'QazCode', 'password': '1234' }",
      "<map object at 0x7f81bc933c90> *",
      "ошибка",
    ],
  ],
  rightAnswers: [
    2,
    1,
    4,
    3,
    1,
    2,
    3,
    1,
    4,
    2,
    2,
    3,
    1,
    2,
    1,
    4,
    3,
    2,
    3,
    1,
    4,
    2,
    3,
    2,
    1,
    4,
    3,
    1,
    3,
    1,
    2,
    3,
    1,
    2,
    3,
    4,
    2,
    3,
    4,
    3,
  ],
  haveImage: [
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    false,
    true,
  ],
  ImageLink: [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.03.25.png?alt=media&token=1c131ffc-c185-4acb-9fe9-9eccfe0b6531',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.08.14.png?alt=media&token=3702352b-b8f2-4512-beee-0c8447021ff6',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.13.56.png?alt=media&token=ed120024-aa69-4768-b6d8-c6261877b34b',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.18.22.png?alt=media&token=f5a02ca2-9fbb-49ff-ab9a-04154483cf0e',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.23.56.png?alt=media&token=160a290c-2e2d-4ee1-8e97-96d1a2547ac5',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.28.56.png?alt=media&token=8027a252-612c-4351-8449-c7fd269fe0ab',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.39.39.png?alt=media&token=d1d9289a-abd1-43ff-8f56-7751336aa220',
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.43.28.png?alt=media&token=2deb2c03-fe72-4fdf-9683-ffd7b13b482d",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2019.34.35.png?alt=media&token=6a8e0fa3-5f3f-4726-8d3c-90ef3a4c6653',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2019.42.33.png?alt=media&token=326f7ec1-e348-4e91-bff7-e1b3d2896f3b',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2019.48.59.png?alt=media&token=b327eaad-ddca-4ea6-9bc5-857c102ffeba',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2019.58.29.png?alt=media&token=8e2f0765-1676-4f65-b9b0-fbf9343e0906',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2020.10.05.png?alt=media&token=56540000-da32-4a75-bfba-a282d1615941',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2020.13.34.png?alt=media&token=2a2da075-7805-4c39-a29b-821e61b0ebe4',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2020.17.11.png?alt=media&token=943c71f4-61e4-40d9-8050-64f2f4addfc6',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2020.20.50.png?alt=media&token=55d021d5-58c2-4e8a-b867-3db718632e4e',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%209.53.45.png?alt=media&token=d0274f6d-76ae-41ad-bcbf-98e180058594',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%209.58.43.png?alt=media&token=d4713294-afc3-4e5f-b201-a0d55d7ec6a5',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%2010.07.13.png?alt=media&token=e34cc581-a2a5-48b9-86df-0270c8877bb6',
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%2010.42.22.png?alt=media&token=4277f810-4acb-4f18-b1d6-3d9ab2b8ca34',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%2010.54.34.png?alt=media&token=8838321e-87f9-4e18-88d3-def37f30cd9f',
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-24%20%D0%B2%2011.32.49.png?alt=media&token=2058fdd1-9f55-493c-8497-ae9926794364',
  ],
);
var CSharp = CourseExam(questions: [
  'Что будет находиться в переменной name?',
  'Можно ли наследоваться от нескольких интерфейсов?',
  'Что будет выведено на консоль?',
  'Что будет выведено на консоль?',
  'Что будет выведено на консоль?',
  'Что будет выведено на консоль?',
  'Можно ли сделать перегрузку оператора присваивания?',
  'Структура — это:',
  'Какой способ вызова исключения является корректным?',
  'Что делает модификатор sealed?',
  'C# код компилируется в код:',
  'Что делает модификатор partial?',
  'Что будет выведено на консоль?',
  'Что будет выведено на консоль?',
  'Можно ли наследоваться от нескольких классов?',
  'Выполнится ли блок finally, если исключения не было?',
  'Что будет выведено на консоль?',
  'Верно ли, что тип string хранит набор символов Unicode?',
  'Что будет выведено на консоль?',
  'Что будет выведено на консоль?',
  'Какой тип переменной используется в коде: int a = 5;',
  'Что делает оператор «%»',
  'Что сделает программа выполнив следующий код: Console.WriteLine(«Hello, World!»);',
  'Как сделать инкрементацию числа?',
  'Как отнять от числа однерку?',
  'Как найти квадратный корень из числа x',
  'Обозначения оператора «НЕ»',
  'Обозначение оператора «ИЛИ»',
  'Обозначение оператора «И»',
  'Чему будет равен с, если int a = 10; int b = 4; int c = a % b;',
  'Чему будет равен с, если int a = 10; int b = 4; bool c = (a == 10 && b == 4);',
  'Чему будет равен с, если int a = 0; int c = -a;',
  'Чему будет равен с, если int a = 12; int c = —a;',
  'Чему равен d, если int a = 0; int b = a++; int c = 0; int d = a + b + c + 3;',
  'Для чего нужны условные операторы',
  'Как называется оператор «?:»',
  'Что такое массив',
  'Какие бывают массивы?',
  'Что такое цикл и для чего они нужны',
  'Какие бывают циклы?',
], answers: [
  ['Arthur', 'NULL', 'Vasya', 'String'],
  ['Да', 'Нет', 'Зависит от кода', 'Зависит от значений'],
  ['Возникнет ошибка', 'True', 'False', 'Нет правильного ответа'],
  ['False', 'True', 'Возникнет ошибка', 'Нет правильного ответа'],
  ['5', '5.5', '6', 'Возникнет ошибка'],
  ['EnumValue', 'Names', 'Enum', 'Value'],
  ['Нет', 'Возникнет ошибка', 'Нет правильного ответа', 'Да'],
  [
    'Значимый тип',
    'Ссылочный тип',
    'Пользовательский тип',
    'Нет правильного ответа'
  ],
  [
    'throw new Exception();',
    'throw Exception();',
    'call Exception();',
    'Exception();'
  ],
  [
    'Разрешает наследование только один раз',
    'Ограничивает видимость текущей сборкой',
    'Добавляется просто для наглядности, но ничего не изменяет',
    'Запрещает наследование'
  ],
  ['CIL', 'MASM', 'CLI', 'FCL'],
  [
    'Позволяет разделять сущность на несколько частей',
    'Запрещает наследование',
    'Ограничивает видимость текущим классом',
    'Позволяет использовать неуправляемый код'
  ],
  ['-1', 'Возникнет ошибка', '1', '-6'],
  ['"Text"', '" test"', 'Возникнет ошибка', 'String.Empty'],
  ['Да', 'Возникнет ошибка', 'Нет правильного ответа', 'Нет'],
  ['Зависит от кода', 'Зависит от режима работы', 'Да', 'Нет'],
  ['True', 'False', 'Возникнет ошибка', 'NaN'],
  ['Да', 'Нет', 'Возникнет ошибка', 'NaN'],
  ['Int', 'Int32', 'Single', 'Object'],
  ['32767', '2147483647', '255', '92264646649947'],
  [
    'Знаковое 8-бит целое',
    'Знаковое 64-бит целое',
    'Знаковое 32-бит целое',
    '1 байт'
  ],
  [
    'Возвращает процент от суммы',
    'Возвращает остаток от деления',
    'Возвращает тригонометрическую функцию',
    'Ни чего из выше перечисленного'
  ],
  [
    'Напишет на новой строчке Hello, World!',
    'Напишет Hello, World!',
    'Удалит все значения с Hello, World!',
    'Вырежет слово Hello, World! из всего текста'
  ],
  ['++', '—-', '%%', '!='],
  ['%%', '—', '!=', '++'],
  ['Sqrt(x)', 'Summ.Koren(x);', 'Arifmetic.sqrt(x);', 'Math.Sqrt(x);'],
  ['Not', 'No', '!', '!='],
  ['!', '!=', '||', 'Or'],
  ['and', '&&', '&', 'Все выше перечисленные'],
  ['11', '2', '3', '1'],
  ['True', 'False', 'Null', '14'],
  ['Null', '-1', '0', '1'],
  ['Null', '-12', '0', '1'],
  ['3', 'True', 'False', '4'],
  [
    'Чтобы устанавливать условия пользователю',
    'Для ветвления программы',
    'Для оптимизации программы',
    'Чтобы были'
  ],
  [
    'Вопросительный',
    'Прямой оператор',
    'Тернарный оператор',
    'Территориальный оператор'
  ],
  [
    'Набор однотипных данных, которые располагаются в памяти последовательно друг за другом',
    'Набор текстовых значений в формате Unicode, которые расположены в случайном порядке',
    'Набор данных типа int (32-бит целое)',
    'Переменная'
  ],
  [
    'Разнообразные',
    'Сложные и простые',
    'Одномерные и многомерные',
    'Резиновые и статичные'
  ],
  [
    'Циклы нужны для многократного запуска программы',
    'Циклы нужны для многократного выполнения кода',
    'Циклы нужны для многократного размещения данных',
    'Циклы нужны чтобы выполнить код без ошибок'
  ],
  [
    'Большие и маленькие',
    'Цикл, foreach, Двойной цикл, Многократный',
    'for, while, do-while, foreach',
    'ref, out, static, root’]',
  ],
], rightAnswers: [
  1,
  1,
  3,
  2,
  1,
  2,
  1,
  1,
  1,
  4,
  1,
  1,
  4,
  1,
  3,
  4,
  3,
  2,
  1,
  2,
  1,
  3,
  2,
  1,
  1,
  2,
  4,
  3,
  2,
  2,
  1,
  3,
  2,
  4,
  2,
  3,
  1,
  3,
  2,
  3,
], ImageLink: [
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2011.52.58.png?alt=media&token=4133d9a5-f360-4643-9ea2-fca68c88ac73',
  null,
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2011.59.47.png?alt=media&token=4449e189-f25b-485d-bf0d-14c6cb3eb7a7',
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.00.30.png?alt=media&token=4f10a3a7-b813-45ac-a537-f63b3ed396ed',
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.01.03.png?alt=media&token=db7b0ee6-6f6b-4c48-8658-5a278943c790',
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.01.47.png?alt=media&token=6bc1d5ef-12ba-4690-a137-4bbef0b78285',
  null,
  null,
  null,
  null,
  null,
  null,
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.05.07.png?alt=media&token=b4fb5ef8-bc3c-49fb-a2ca-171d8b48999a',
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.06.27.png?alt=media&token=d83bcf76-fd5a-45ac-83a6-e41cdf81f3b4',
  null,
  null,
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.07.09.png?alt=media&token=61748216-13a9-4d85-bcb0-421348c0cd24',
  null,
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.07.46.png?alt=media&token=d803ee46-b93e-4872-ac1e-6a73b1e4ad30',
  'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FC%23%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-28%20%D0%B2%2012.10.13.png?alt=media&token=60b034d5-1bfb-4c00-904d-62e3833d9b6d',
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
],
haveImage: [
  true,
  false,
  true,
  true,
  true,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  true,
  true,
  false,
  false,
  true,
  false,
  true,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  ],
);


var JavaScript = CourseExam(
  questions: [
    "В каком месте HTML документа может располагаться JavaScript код?",
    "Выберите JavaScript команду позволяющую вывести текст на страницу.",
    "Выберите перечень содержащий только действительно существующие в JavaScript циклы",
    "Выберите метод для выполнения произвольного кода через через заданные промежутки времени",
    "Что вернет команда document.getElementById('hero')",
    "Что выведет код: console.log(typeof 'number')",
    "В какой кодировке XmlHttpRequest отправляется на сервер?",
    "Что делает строчка 'use strict' в верхней части блока кода?",
    "Какой вариант правильно объявляют переменную для k, возвращающей сумму двух аргументов?",
    "Какой оператор используется для удаления элемента с объекта?",
    "Какое ключевое слово используется для ссылки на текущий объект?",
    "Как правильно сохранить данные в локальной хранилище?",
    "Выберите недопустимое имя для переменной",
    "Что выведет этот код?",
    "JavaScript - это ... язык",
    "Какой символ используется для разделения каждой пары JSON?",
    "В какой тип данных переходит JSON внутри JavaScript кода?",
    "Могут ли конструкторы в JavaScript вернуть примитивное значение?",
    "К какому типу данных относиться NaN?",
    "На что ссылается ключевое слово this в функции класса?",
    "Какое свойство используется для проверки выполнения запроса AJAX?",
    "Что выведет этот код?",
    "Как правильно экспортировать модуль в ES6?",
    "Что выведется в консоль?",
    "С помощью какого ключевого слова можно расширить класс в ES6?",
    "Что такое callback-функция?",
    "Какой оператор служит для создания нового экземпляра из класса однотипных объектов?",
    "Что такое ECMAScript?",
    "Какое свойство, из ниже перечисленных, позволяет получить число элементов массива?",
    "Какими способами можно получить доступ к свойству объекта?",
    "Что такое метод объекта",
    "Выберите среди перечисленных метод, с помощью которого можно добавить элемент в документ:",
    "Что такое JSHint?",
    "Что из следующего является компонентом веб-страницы?",
    "JavaScript файлы имеют суффикс ...",
    "Как можно отлаживать код, написанный на js?",
    "Какую команду следует использовать, чтобы выбрать элемент с id 'qazcode' в DOM",
    "Какая команда используется для показа всплывающего окна с вопросом?",
    "Как правильно объявить массив?",
    "Как правильно объединить два массива с помощью spread-операторов?"
  ],
  answers: [
    [
      "В \"<body>\"",
      "В \"<head>\"",
      "В \"<body>\" и \"<head>\"",
      "В \"<title>\""
    ],
    [
      "write('How are you?')",
      "document.write('How are you?')",
      "document.out('How are you?')",
      "text('How are you?')"
    ],
    [
      "while, forEach, loop",
      "loop, switch, do",
      "try, catch, for",
      "for, while, do..while"
    ],
    ["setTimeout", "setInterval", "Timeout", "afterInterval"],
    [
      "Все элементы с id 'hero'",
      "Один элемент с id 'hero'",
      "Ничего",
      "Ошибка"
    ],
    ["number", "string", "float", "Symbol"],
    [
      "В кодировке страницы",
      "В той, какую захочет получить сервер",
      "В той, какую укажем в заголовке запроса",
      "UTF-8"
    ],
    [
      "Отображает комментарий",
      "Скрывает ошибки",
      "Включает строгий режим",
      "Показывает подсказки при отладке"
    ],
    [
      "var k=function(a,b){ return a+b }",
      "var k = new Function('a,b', 'return a+b')",
      " var k = new Func('a,b', 'return a+b')",
      " var k = ('a,b', 'return a+b')"
    ],
    ["clear", "slice", "remove", "delete"],
    ["current", "this", "obj", "it"],
    [
      "localStorage.setItem(key, value)",
      "localStorage.setItem(value, key)",
      "localStorage.set(value, key)",
      "localStorage.set(key, value)"
    ],
    ["var _qazcode", "var 1qazcode", "var qazcode", "var QazCode"],
    ["12", "null", "undefined", "5"],
    [
      "высокоуровный",
      "объектно-ориентированный",
      "статический",
      "динамический"
    ],
    [";", ":", ",", "."],
    ["Array", "Number", "Map", "Object"],
    ["Да", "Нет", "Только внутри функции", "Только внутри констурктора"],
    ["string", "number", "undefined", "null"],
    [
      "На объект, функцией которого является метод класса",
      "На фукнцию класса",
      "К классу",
      "Нет правильно ответа"
    ],
    ["request", "ReadyState", "response", "state"],
    ["Qazcode = Hi!", "Some error has occured", "Ошибка", "undefined"],
    [
      "export default module ModulName",
      "export ModuleName",
      "export module ModuleName",
      "export default ModuleName"
    ],
    ["123", "456", "Объект", "key"],
    ["expand", "creates", "extends", "implements"],
    [
      "Функция обратного вызова",
      "Функция с параметрами",
      "Функция с методом return",
      "Нет правильно ответа"
    ],
    ["new", "prototype", "object", "this"],
    [
      "Спецификация javascript",
      "Технология для обмена данными с сервером",
      "Библиотека",
      "Встраиваемый расширяемый язык программирования"
    ],
    ["count", "length", "array", "number"],
    [
      "Только через точку",
      "Через точку или квадратные скобки",
      "Фигурные скобки",
      "Через запятую"
    ],
    [
      "Свойства объекта, в виде функции",
      "Свойства объекта, в виде события",
      "У объекта нет методов",
      "Нет правильного ответа"
    ],
    ["addElement", "createElement", "insertElement", "appendChild"],
    [
      "Язык программирования",
      "Инструмент статического анализа кода",
      "Серверная технология",
      "Встроенная библиотека"
    ],
    ["Style", "Div", "Анимация", "Все"],
    [".json", ".javascript", ".js", ".html"],
    [
      "Использовать комментарий",
      "Выводить в консоль",
      "Перезапустить компьютер",
      "Установить библиотеки"
    ],
    [
      "document.getElementById('qazcode')",
      "select('#qazcode')",
      "document.get('qazcode')",
      "document['qazcode']"
    ],
    ["concat", "alert", "show", "prompt"],
    [
      "var colors = (1:'red',2:'green',3:'blue')",
      "var colors = 'red,green,blue'",
      "var colors = ('red'),('green'),('blue')",
      "var colors = ['red','green','blue']"
    ],
    [
      "let array = array1.push(array2)",
      "let array = array1.concat(array2)",
      "let array = [array1, array2]",
      "let array = [...array1, ...array2]"
    ]
  ],
  rightAnswers: [
    3,
    2,
    4,
    1,
    1,
    2,
    4,
    3,
    1,
    4,
    2,
    1,
    2,
    1,
    2,
    1,
    4,
    2,
    2,
    1,
    2,
    2,
    4,
    2,
    3,
    1,
    1,
    4,
    2,
    2,
    1,
    4,
    2,
    4,
    3,
    2,
    1,
    4,
    4,
    4,
  ],
  haveImage: [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ],
  ImageLink: [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2012.56.20.png?alt=media&token=b04d2c34-7934-444f-a5fa-db9a6ae486f4",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.53.23.png?alt=media&token=c4efa2e1-6df5-48e6-9553-6da285c27339",
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2014.29.24.png?alt=media&token=773cfeac-71bc-4fd9-a84a-34507243b00b",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ],
);
