import 'package:flutter/material.dart';
import 'package:qazaccode/course/Video_page.dart';
import 'package:video_player/video_player.dart';
import 'package:qazaccode/all_screens/myaccount.dart';
import 'package:qazaccode/login/login_page.dart';

class Course_List extends StatefulWidget {
  final courseName;
  List<Course> need;
  Course_List({this.courseName});

  var array;

  @override
  _Course_ListState createState() => _Course_ListState();
}

class _Course_ListState extends State<Course_List> {
  var didtestString;
  var didprogress;
  var didtestScore;
  var isOneBool;
  var isNull;

  @override
  void initState() {
    for (var i in testMap.keys) {
      if (i == widget.courseName) {
        didtestString = testMap[i].split(", ");
      }
    }
    for (var i in testScore.keys) {
      if (i == widget.courseName) {
        didtestScore = testScore[i].split(", ");
      }
    }
    for (var i in map.keys) {
      if (i == widget.courseName) {
        didprogress = map[i].split(", ");
      }
    }
    // TODO: implement initState
    super.initState();

    if (widget.courseName == 'Python') {
      setState(() {
        qaz ? widget.need = PythonRus : widget.need = PythonRus;
      });
    }
    if (widget.courseName == 'JavaScript') {
      setState(() {
        qaz ? widget.need = JavaScriptQaz : widget.need = JavaScriptRus;
      });
    }
    if (widget.courseName == 'C#') {
      setState(() {
        qaz ? widget.need = CSharpRus : widget.need = CSharpRus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildExpandableContent(Course course, int index) {
      List<Widget> columnContent = [];

      for (var i = 0; i < course.LessonName.length; i++) {
        columnContent.add(ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 24),
          title: new Text(
            course.LessonName[i],
            style: new TextStyle(fontSize: 18.0),
          ),
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple,
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      0.0, // vertical, move down 10
                    ),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(
                (i + 1).toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Video_Page(
                    finalLesson: course.LessonName.length - 1,
                    homeWork: widget.need[index].homeWork[i],
                    haveHomeWork: widget.need[index].haveHomeWork[i],
                    currentLesson: i,
                    answers: course.answers,
                    video: VideoPlayerController.network(
                        widget.need[index].url[i]),
                    didTest: didtestString,
                    didTestScore: didtestScore,
                    questions: course.questions,
                    ImageLink: course.ImageLink,
                    haveImage: course.havePicture,
                    rightAnswers: course.rightAnswers,
                    currentSection: index,
                    LessonName:
                        (i + 1).toString() + '. ' + course.LessonName[i],
                    CourseTitle: widget.courseName,
                    url: widget.need[index].url[i],
                  ),
                ));
          },
        ));
      }

      return columnContent;
    }

    return ListView.builder(
      itemCount: widget.need.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 1.0,

                    // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      10.0, // vertical, move down 10
                    ),
                  ),
                ]),
            child: new ExpansionTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1),
                      topRight: Radius.circular(14),
                      bottomRight: Radius.circular(1),
                      bottomLeft: Radius.circular(14),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple,
                        blurRadius:
                            5.0, // has the effect of softening the shadow
                        spreadRadius:
                            1.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          0.0, // vertical, move down 10
                        ),
                      ),
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    (i + 1).toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
              trailing: Icon(
                didprogress[i] == '1'
                    ?
//            isOneBool ? Icons.check_circle :
                    Icons.check_circle
                    : Icons.timelapse,
                color: didprogress[i] == '1' ? Colors.deepPurple : Colors.grey,
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  widget.need[i].SectionName,
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.start,
                ),
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(widget.need[i], i),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Course {
  final String SectionName;
  List<String> LessonName = [];

  List<String> url;
  List<bool> haveHomeWork;
  List<List<String>> homeWork;
  List<String> questions;
  List<List<String>> answers;
  List<int> rightAnswers;
  List<String> ImageLink;
  List<bool> havePicture;
  Course(
      this.SectionName,
      this.LessonName,
      this.haveHomeWork,
      this.url,
      this.homeWork,
      this.questions,
      this.answers,
      this.rightAnswers,
      this.havePicture,
      this.ImageLink);
}

List<Course> PythonRus = [
  new Course('Добро пожаловть в Python', [
    'Введение в курс',
    'Среда разработки Python',
    'Наш первый код',
    'Числа в Python',
    'Вычисление остатка в Python',
    'Строки в Python',
    'Форматирование строки',
    'Ввод информации',
    'Логический тип данных',
    'Логические операции',
    'List(Список) в Python',
    'Tuples(Картежи) в Python',
    'Sets(Наборы) в Python',
    'Продвинутые set операции',
    'Dictionaries(Словари) в Python',
    'Сумма и длина',
    'Добавление в List',
  ], [
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
    false
  ], [
    'https://www.dl.dropboxusercontent.com/s/bhow3443i9q5f9r/overview%20python.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/cv2isyn2srd3rbt/Section1.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/ig7druh02njjccy/Section1.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/0zchetv00jmtycb/Section1.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/82asxbbblvmshv5/Section1.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/eryrvqhny1viz7z/Section1.%209%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/1gxypcqlfqg10h1/Section1.%2011%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/wd0cty6i5l0prfa/Section1.%2010%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/ipg0bmvrcn4gkrt/Section1.%2014%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/vt6qu3si4vt3l6h/Section1.%2015%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/v0as4x2or1upupm/Section1.%2016%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/j1f1i59i4njtaqc/Section1.%2017%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/evunvhgh5bp7jg8/Section1.%2018%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/7nujjndrdzd5n0l/Section1.%2019%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/5shn95vjvfpvhzj/Section1.%2021%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/omhasoglt3ac0dr/Section1.%2022%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/b6750ie1uise3lv/Section1.%2024%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что выведет данный код?',
    'У какого варианта тип данных Int?',
    'Какой из данных не принадлежит к типу float?',
    'Вывод: You have 200.0 dollar. Какое значение ввел пользователь?',
    'Что выведет эта программа?',
    'Что выведет эта программа?',
    'Как мы можем добавить новый элемент к нашему List?',
    'Как найти максимальное значение List?'
  ], [
    [
      'Ошибка!',
      'Hello world!',
      'hello world!',
      'print("Hello world!")',
    ],
    [
      '101',
      'Hello world',
      'A',
      '+777',
    ],
    [
      '5/3',
      '4.5',
      '100.12',
      '5',
    ],
    [
      '20.0',
      '20',
      '76000',
      '380',
    ],
    [
      '4',
      '6',
      '5',
      '3',
    ],
    [
      'Site',
      'Yes',
      'No',
      'Ошибка',
    ],
    [
      '.reverse()',
      '.count',
      '.append',
      '.remove',
    ],
    [
      'max(list)',
      '.append',
      'min(list)',
      'showMax',
    ],
  ], [
    2,
    1,
    4,
    3,
    1,
    2,
    3,
    1,
  ], [
    true,
    false,
    false,
    true,
    true,
    true,
    false,
    false,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2015.54.30.png?alt=media&token=25d4d440-ffcc-4fda-8dea-42b02666a7a5',
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2016.12.25.png?alt=media&token=36bb6f01-a915-4906-b067-f5c0f4056bd4',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2016.33.37.png?alt=media&token=cce68666-899c-4cee-b553-7794344cdf07',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2016.56.21.png?alt=media&token=b6d7ae54-3ddb-47fa-8c21-0f00bfff93c0',
    null,
    null,
  ]),
  new Course('Основы Python', [
    'Улсовии If',
    'Циклы While',
    'Циклы For',
    'Деструктивный синтакс',
    'Итерация словарей',
    'Break и Continue',
    'Понимание свойств в List',
    'Функция ZIP',
    'Функции в Python',
    'Параметры и аргументы функции',
    'Свойство Return',
    'Функция Lambda',
    'Функции высшего порядка',
  ], [
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
  ], [
    'https://www.dl.dropboxusercontent.com/s/5gbg8a2wg2eramc/Section2.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/aypeg9mqmsqtbwp/Section2.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/7u375wt8u09mc2t/Section2.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/ltciwfauikjp3h3/Section2.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/26u70uiql86wwbf/Section2.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/xw8s9w5tfc6f9kv/Section2.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/8nrjbo572q35ydr/Section2.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/3nk37ce7th1kgec/Section2.%208%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/csyrqadkjfjytt6/Section2.%209%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/bamh8ez9hdozh63/Section2.%2010%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/baluzrssi9itn3w/Section2.%2011%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/b6x4skb3dfd4m3o/Section2.%2012%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/xk5z6gouoo2enug/Section2.%2013%20full.mp4?dl=0',
  ], [
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    ['sddssd', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ]
  ], [
    'Что выведет эта программа?',
    'Что выведет эта программа?',
    'Что выведет эта программа?',
    'Что выведет эта программа?',
    'Какой метод нужно внести, чтобы перечислить все машины и в конце каждой поставить вопросительный знак?',
    'Для чего нужна функция Lambda?',
    'Для чего нужна функция ZIP?',
    'Что выведет эта программа?'
  ], [
    [
      'adult',
      'Teenager',
      'teenager',
      'Ошибка',
    ],
    [
      'YES',
      'Yes',
      'Not Given',
      'No',
    ],
    [
      'total',
      '1.8',
      '2',
      '9/5',
    ],
    [
      '1.0',
      '2.0',
      'Ошибка',
      '1',
    ],
    [
      'print(cars + ?)',
      'print(car + ?)',
      "print(car + '?')",
      'return cars',
    ],
    [
      'Возвращать данные?',
      'Совмещать несколько',
      "Сократить действие функции в одну строку",
      'Для проведении итераций',
    ],
    [
      'Объеденить листы в один лист',
      'Вывести данные с одного листа в другие листы',
      'Конвертировать лист в set или tuple',
      'Выразить данные одинакого типа со словаря',
    ],
    [
      '3',
      '7',
      '[2, 4, 5, 67, 9, 12, 23]',
      '["banana", "apple", "cherry"]',
    ],
  ], [
    3,
    4,
    2,
    1,
    3,
    3,
    1,
    2,
  ], [
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    true,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2016.29.18.png?alt=media&token=626a52c8-7aee-4d67-8a3a-97c7f962dbdd',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2016.49.41.png?alt=media&token=1fa33d27-be13-4abd-b1bf-4ee59c148409',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.55.41.png?alt=media&token=0e32b486-a5b1-4300-a745-ed912db8ab3d',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2018.00.11.png?alt=media&token=4d1253cf-4c79-4801-b38e-29df3eaabde2',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2018.05.39.png?alt=media&token=ec10f7be-7605-472e-85e0-44b2b3badb7b',
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2FСнимок%20экрана%202019-08-23%20в%2011.59.10.png?alt=media&token=f7c10644-7d1a-4f94-bd96-9034b6dc533e'
  ]),
  new Course('Проект "Список игр"', [
    'Установка Python',
    'Установка PyCharm',
    'Создание первого проекта',
    'Настройка интерфейса в PyCharm',
    'Создание меню',
    'Добавление новых игр',
    'Отображение игр пользователя',
    'Создание поисковика',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
  ], [
    'https://www.dl.dropboxusercontent.com/s/86b62kqlslswu05/Section3.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/qa4p3owqvyag7he/Section3.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/p14dqolto9vo0qt/Section3.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/4w1rvvbar5rxbbt/Section3.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/op9heg7tj3nt9e6/Section3.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/hg3w2kk6lv9f4jf/Section3.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/t0lv97vdpf9i3pj/Section3.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/nywitf4r2pqs5wz/Section3.%208%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Сделать свой список с таким же функционалом в PyCharm',
      'Сделать свой список с возможностью удалять данные с списка',
      'Сделать свой список с таким же функционалом в PyCharm'
    ]
  ], [
    'Что такое PyCharm?',
    'Какую функцию мы использовали, чтобы найти игры?',
    'Что вы использовали для хранения данных?',
    'Какая функция запустится при нажатий кнопки "l"?'
  ], [
    [
      'Язык программирования',
      'Библиотека',
      'Среда разработки',
      'Framework',
    ],
    [
      'find_by_attribute()',
      'show_game_details()',
      'add_games()',
      'find_games()',
    ],
    [
      'List',
      'Tuples',
      'Dictionary',
      'array',
    ],
    [
      'find_by_attribute()',
      'show_games()',
      'add_games()',
      'find_games()',
    ],
  ], [
    3,
    4,
    1,
    3,
  ], [
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
  ]),
  new Course('ООП в Python', [
    'Введение в ООП',
    'Классы и объекты',
    'Наименование параметров',
    'Избранные методы в Python',
    'Наследование в python',
    'Декоратор @property',
    '@staticmethod и @classmedthod',
    'Примеры classmethod и staticmethod'
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/ki3j46u759hlt83/Section4.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/7vsdz5hxrrkmt9m/Section4.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/q52cp79wk8fbc1a/Section4.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/iyc0ru888nq3xoo/Section4.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/aaeqfwdkfjjmvw3/Section4.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/pfj5to5q9bc9gyk/Section4.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/9p941i14d9m7n5t/Section4.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/b89eh9j8mpo10qb/Section4.%208%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что такое @classmethod?',
    'Что такое объектно-ориентированное программирование?',
    'Какой из примеров верный?',
    'Что такое наследование?',
    'Что выведет эта программа?',
    'Что выведет эта программа?',
    'Что такое суперкласс класса?',
    'Что выведет эта программа?',
  ], [
    [
      'Сборник методов',
      'Конвертирует методы в класс',
      'Конвертирует классы в методы',
      'Метод, который получает переданный класс',
    ],
    [
      'Программирование с использованием объектов',
      'Среда разработки с элементами',
      'Создание среды разработки',
      'Программа',
    ],
    [
      'class developer',
      'class developer:',
      'class Developer:',
      'Class developer',
    ],
    [
      'Удаление предыдущего класса',
      'Копирование всех классов',
      'Наслоедование свойств класса - родителя',
      'Наследование всех методов программы',
    ],
    [
      '154.5',
      'Zhenya, Google, 46',
      '46',
      '[25, 38, 67, 98]',
    ],
    [
      "<class 'tuple>'",
      "<class 'list'>",
      "<class 'set'>",
      "'Tales of arise', 'fire emblem'",
    ],
    [
      "Экземпляр класса",
      "Первый класс, который наследует от него",
      "Родитель класса",
      "Класс, от которого он наследует",
    ],
    [
      "dragon age death stranding",
      "death stranding dragon age",
      "dragon age",
      "death stranding",
    ],
  ], [
    4,
    1,
    2,
    3,
    4,
    2,
    4,
    1,
  ], [
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
  ], [
    null,
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2012.53.52.png?alt=media&token=a3edce29-c6c7-486b-9c33-f370f72e3199',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.02.55.png?alt=media&token=7ced364f-0691-4f7d-8fbe-f8e50eb8e88c',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.11.29.png?alt=media&token=5df7e4c3-f7b5-4d03-aeae-f5d9dd7cfaf3',
  ]),
  new Course('Виды файлов в Python', [
    'Файлы в Python',
    'Копирование файлов',
    'CSV файлы в Python',
    'JSON файлы',
    'WithSyntax в Python',
    'Импортирование файлов',
    'Импортирование children относительно к parent',
    'Импортирование parent',
    'Добавление ошибок и запуск в Python'
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/a7xdbc143udixt3/Section6.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/hqbbfepcvig84kp/Section6.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/d4w0j7odtqn8op5/Section6.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/vpgdknwoaqkckro/Section6.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/075b2byhpd7aulb/Section6.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/wrddiut9xbk5n6r/Section6.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/2hnmikg8e4zc87j/Section6.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/wujtxpye9g2pync/Section6.%208%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/q6yfppwl6vv9zd5/Section6.%209%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Для чего нам "w"?',
    'Какие данные хранит .CSV файлы?',
    'Какому формату обменаа данных относится этот пример?',
    'Что делает данный код?',
    'Какая строчка кода записывает "Hello, QazCode!" в файл?',
    'Что из этого является родительским классом?',
    'Что выведет данная программа?',
    'Какой из путей к файлам правильный?'
  ], [
    [
      'Записывать даннные в .txt файл',
      'Читать данные с .txt файла',
      'Вывести "w"',
      'Найти букву "w" в файле',
    ],
    [
      'Текстовые',
      'Изображения',
      'Табличные',
      'Аудио',
    ],
    [
      'CSV',
      'JSON',
      'txt',
      '.docx',
    ],
    [
      'Создаем собственный файл',
      'Читаем файл',
      'Форматируем данные',
      'Перезаписываем данные',
    ],
    [
      'file.read("Hello QazCode!")',
      'write(file, "Hello QazCode!")',
      'write("Hello QazCode!", file)',
      'file.write("Hello QazCode!")',
    ],
    [
      'DeskTable',
      'KitchenTable',
      'Table',
      'Не существует',
    ],
    [
      '34 4',
      '34',
      '4',
      'error',
    ],
    [
      'import.package.file',
      'import untitled.package.file',
      'import file',
      'import package.file',
    ],
  ], [
    1,
    3,
    2,
    1,
    4,
    3,
    2,
    4,
  ], [
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    true,
  ], [
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.36.06.png?alt=media&token=72ead41a-78e1-423f-bb5f-72355129c1e2",
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.40.10.png?alt=media&token=c3502b18-e466-47fa-ae57-0bbeaaf1189c',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.46.34.png?alt=media&token=04253a75-25f3-4133-aadd-bbcba02d8efa',
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.54.54.png?alt=media&token=7c8b8174-704a-4b94-bfa4-5256b6da4b2e",
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2013.56.01.png?alt=media&token=1dc0f204-67c3-4bdb-a8a7-9751e78f05bb",
  ]),
  new Course('База данных и проект "Список машин"', [
    'Пользовательский интерфейс и создание БД',
    'Добавление машин и вывод на консоль',
    'Улучшение БД',
    'Использование JSON',
    'Исопльзование MySql',
  ], [
    false,
    false,
    false,
    false,
    true,
  ], [
    'https://www.dl.dropboxusercontent.com/s/nvbtygy11tg3984/Section7.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/si5i5mkx3x7rx4x/Section7.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/lptye9juizfvcg2/Section7.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/d954wb0ofq3l8qw/Section7.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/l6vs5dp9yot41ap/Section7.%205%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    [
      'Сделать один проект PyCharm с двумя и более списками внутри и сохранить данные в MySQL',
      'Сделать свои список и сохранить его в json',
      'Сделать свои список и сохранить в txt файле в PyCharm'
    ],
  ], [
    'Что вы использовали на этом отрезке кода для хранения данных??',
    'Что такое SQL?',
    'Что мы используем для возвращения в меню?',
    'Какой метод используется для ввода данных в MySql3?'
  ], [
    [
      'txt',
      'CSV',
      'SQL',
      'JSON',
    ],
    [
      'система управления базами данных',
      'среда разработки',
      'плагин для PyCharm',
      'название базы данных',
    ],
    [
      'return menu()',
      'user_input = input(USER_CHOICE)',
      'menu()',
      'user input = menu()',
    ],
    [
      "database +='information'",
      'database.insert_car()',
      'database.append()',
      'database.add()',
    ],
  ], [
    3,
    1,
    2,
    2,
  ], [
    true,
    false,
    false,
    false,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2014.03.10.png?alt=media&token=0c14febe-94a9-4941-ad65-00230d89ad3d',
    null,
    null,
    null,
  ]),
  new Course('Расширенные функции в Python', [
    'Генератоы в Python',
    'Генератор классов и итераторов',
    'Итерации в Python',
    'Функция .filter()',
    'Функция .map()',
    'Функции any и all в Python',
    'Функция enumerate',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/vm063g5mv0us57h/Section8.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/w4dytw1qjl2cbwm/Section8.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/pw1ymu0xnr5ejbg/Section8.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/pw1ymu0xnr5ejbg/Section8.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/pw1ymu0xnr5ejbg/Section8.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/q6yg48waqk4e4l4/Section8.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/58y4mat2z9l7dwu/Section8.%207%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ]
  ], [
    'Чем является любой объект у которого есть метод "next"',
    'Что изображено на картинке?',
    'Какая функция возвращает итератор, состоящий из тех элементов последовательности',
    'Какая функция из нижеперечисленных принимает два аргумента: функцию и аргумент составного типа данных?',
    'Какая функция из нижеперечисленных прекращает проверку после первого элемента, не удовлетворяющего условию?',
    'Какая функция проверяет, выполняется ли условие хотя бы для одного элемента?',
    'Какая функция применяется для итерируемых коллекций?'
        'Что выведет программа?'
  ], [
    [
      'Функция',
      'Класс',
      'Генератор',
      'Итератор',
    ],
    [
      'Действие с переменной',
      'Герератор',
      'Итератор',
      'Функция',
    ],
    [
      'all()',
      'any()',
      'filter()',
      'map()',
    ],
    [
      'all()',
      'any()',
      'next()',
      'map()',
    ],
    [
      'all()',
      'any()',
      'next()',
      'zip()',
    ],
    [
      'any()',
      'sort()',
      'next()',
      'zip()',
    ],
    [
      'iter()',
      'sort()',
      'enumerate()',
      'zip()',
    ],
    [
      '[19, 16, 8, 41, 12]',
      '[6, 17, 28, 39, 50]',
      '[65, 127, 2, 319, 5]',
      'ошибка',
    ],
  ], [
    4,
    2,
    3,
    4,
    1,
    1,
    3,
    2,
  ], [
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
  ], [
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2014.18.13.png?alt=media&token=b3416ef2-baf7-4e29-a83b-8c735cdd4f18',
    null,
    null,
    null,
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2014.42.37.png?alt=media&token=446dc2ca-df50-430d-b909-1d9bc4df55d5',
  ]),
  new Course('Продвинутая разработка в Python', [
    'Переменчивость в Python',
    'Переменчивость аргумента в Python',
    'Значение параметров по умолчанию',
    'Переменчивые аргументы по умолчанию',
    'Распаковка аргументов в Python',
    'Коллекции в Python',
    'Дата и время',
    'Методы с временем',
    'Регулярное выражение в Python',
    'Введение в консоль',
    'Вывод сообщения в отдельный файл',
  ], [
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
  ], [
    'https://www.dl.dropboxusercontent.com/s/58y4mat2z9l7dwu/Section8.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/58y4mat2z9l7dwu/Section8.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/y3jzxout3z1t9ar/Section9.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/jmii3gpzg2qb8dx/Section9.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/axs2xd3nef7uy8p/Section9.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/9fz2piyofcj2e3j/Section9.%207%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/mbwcscv9uclettd/Section9.%208%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/0f4x8yis3ip7ith/Section9.%2010%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/tooizplfti74aj4/Section9.%2013%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/diyd7fcy7dqih9e/Section9.%2014%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/opk0boko7enuh4x/Section9.%2015%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Как выводить настоящее время?',
    'Какую задачу выполняет данный код?',
    'Какие функций выполняет данный код?',
    'Какой результат выдаст данный участок программы?',
    'Что это за коллекция, которая не отличается от обычного словаря за исключением того, что по умолчанию всегда вызывается функция, возвращающая значение?',
    'Что это за коллекций ведущий себя как кортеж, с тем дополнением, что каждому элементу присваивается имя?',
    'Какой результат выдаст данный участок программы?',
    'Какая библиотека помогает вычислить точное время относительно гринвича?',
  ], [
    [
      'datetime.now()',
      'datetime.current()',
      'datetime.directory.time()',
      'datetime.time()',
    ],
    [
      'Вычисляет скорость интернета',
      'Вычисляет мощность процессора',
      'Вычисляет скорость запуска программы',
      'Устанавливает таймер на 5 секунд',
    ],
    [
      ' Показывает директорию файла',
      ' Выводит формат данных',
      'Выводит текущее время',
      'Показывает расстановку файлов в базе данных',
    ],
    [
      '2754.34',
      '2957.93',
      '3287.53',
      '2109.12',
    ],
    [
      'Defaultdict',
      'OrderedDict',
      'Counter',
      'Deque',
    ],
    [
      'OrderedDict',
      'Deque',
      'namedtuple',
      'Counter',
    ],
    [
      'gmail.com',
      '@',
      'QazCode',
      'gmail',
    ],
    [
      'Datetime',
      'Timezone',
      'Timedelta',
      'tzlocal',
    ]
  ], [
    1,
    3,
    3,
    2,
    1,
    3,
    3,
    2,
  ], [
    false,
    true,
    true,
    true,
    false,
    false,
    true,
    false,
  ], [
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2014.55.48.png?alt=media&token=b2e58d5b-3ff4-48b8-b62a-876151aa5f06',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2016.03.45.png?alt=media&token=e2004fb4-91fe-4c49-97b4-72e659388378',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2016.11.32.png?alt=media&token=a08dee39-d71f-43b6-a8d0-9319a070e708',
    null,
    null,
    ' https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2016.27.05.png?alt=media&token=2eb087fa-2f82-4727-9f5f-2e6e3b937aaa',
    null,
  ]),
  new Course('Декораторы в Python', [
    'Декораторы',
    'Синтакс',
    'Использование библиотеки functools',
    'Декоракция функции параметрами',
    'Декораторы с параметрами',
    'Функции с несколькими аргументами',
    'Универсальные декораторы для любой функции',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/uktphgfa04gqerm/Section17.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/zym8dcan463x4im/Section17.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/7njwflff52qnvw0/Section17.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/6l22apupmjzue3k/Section17.%204%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/chz7qlfmimettae/Section17.%205%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/vzjayt1sgie13mm/Section17.%206%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/4oplywt9jlu57sk/Section17.%207%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Какой класс является родительским?',
    'Что позволяет сделать ABCMeta?',
    'Что такое абстрактные базовые классы?',
    'При каком декораторе нужно переопределить класс в классе наследника?',
    'Какой декоратор позволяет отделить свойства класса от методов?',
    'Какой метод возвращает формальное строковое представление указанного объекта?',
    ' Какая переменная подразумевает что метод принадлежит классу а не его экземпляру?',
  ], [
    [
      'Salary',
      'Salary, Promotable',
      'Promotable',
      'Employee',
    ],
    [
      'Позволяет создать новые классы',
      'Позволяет ввести новые типы данных',
      'Позволяет форматировать данные',
      'Позволяет определить класс, и его методы и свойства',
    ],
    [
      'Это классы, экземпляры которых нельзя создать',
      'Это классы, данных которые не существует',
      'Это классы, которые перераспределяют данные между наследниками',
      'Это классы, свойства которых импортируются с соответствующих библиотек',
    ],
    [
      'isinstance()',
      'register()',
      '@abstractmethod',
      '__instancecheck__',
    ],
    [
      '@classmethod',
      '@property',
      '@staticmethod',
      '@departure_point',
    ],
    [
      '_init_',
      ' _repr_',
      ' _enter_',
      '_len',
    ],
    [
      'self',
      'debug',
      'cls',
      'func',
    ]
  ], [
    2,
    4,
    1,
    3,
    2,
    2,
    3,
  ], [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    ' https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2016.52.02.png?alt=media&token=127596fd-e7f0-40e9-993c-f343a8e77a93',
    null,
    null,
    null,
    null,
    null,
    null,
  ]),
  new Course('Продвинутое ООП', [
    'Множественное наследование в Python',
    'ABCs',
    'Польза ABSc',
    'Установщик свойств в Python',
  ], [
    false,
    false,
    false,
    false
  ], [
    'https://www.dl.dropboxusercontent.com/s/20tbjabzxpwdhyq/Section11.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/xx686iiav7nawx4/Section11.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/dc2h01ltugvg02g/Section11.%203%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/4dmq0q47z9oif1c/Section11.%204%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ]
  ], [
    'Какое ключевое слово используется для выявления исключений и поднятий его как ошибки?',
    'Что используется для изменений поведений функций без изменений кода?',
    'Какой результат выдаст данный участок программы?',
    'Что такое модуль functools?',
    'Какую функцию нужно использовать что бы передать неизвестное количество неименованных аргументов?',
    'Какую функцию нужно использовать для передачи переменного количества именованных аргументов?',
  ], [
    [
      'raise',
      'return',
      'rewrite',
      'Runtime',
    ],
    [
      'Методы',
      'Классы',
      'Декораторы',
      'Кортежы',
    ],
    [
      'Welcome ADMIN',
      'QazCode',
      'OHRANA',
      'user.get',
    ],
    [
      'Сборник функций высокого уровня',
      'Библиотека форматирования функций',
      'Атрибут для работы функций',
      'Вывод функций в отдельный txt файл',
    ],
    [
      '**kwargs',
      '*args',
      '*nums',
      'adder()',
    ],
    [
      '*nums',
      'adder()',
      '**kwargs',
      '**data',
    ],
  ], [
    1,
    3,
    3,
    1,
    2,
    3,
  ], [
    false,
    false,
    true,
    false,
    false,
    false,
  ], [
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.05.18.png?alt=media&token=25326cf4-e46c-4c4f-a594-98fe0d8ae49e',
    null,
    null,
    null,
  ]),
  new Course('Введение в Tkinter', [
    'Настройки в Tkinter',
    'Hello World',
    'Labels и Fields',
  ], [
    false,
    false,
    false
  ], [
    'https://www.dl.dropboxusercontent.com/s/orx91l3fx306a6u/Section19.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/uzvta832nrb22zn/Section19.%202%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/c5wmdu3p3lnb3ff/Section19.%203%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ]
  ], [
    'Какая библиотека используется для создания desktop приложений?',
    'Что делает tkinter.test?',
    'Какой результат выдаст данный участок программы?',
    'Что делает данная строчка кода?',
    'Для чего нужен label?',
    'Какой метод нужен для ввода сообщений в tkinter?',
  ], [
    [
      'Django',
      'Pygame',
      'Tkinter',
      'Pycharm',
    ],
    [
      'Вызывает консоль',
      'Запускает тестовую программу',
      'Проверяет программу',
      'Удаляет баги',
    ],
    [
      "Выведет 'Welcome to tkinter’",
      'Выведет ‘Hello’',
      'Выйду ошибка',
      'Выведет пустой экран с названием hello',
    ],
    [
      'Включает программу',
      'Форматирует код',
      'Выключает программу',
      'Переадресует на следующие страницы',
    ],
    [
      'Выводить сообщения и символы на экран',
      'Для создания рисунков на экране',
      'Воспроизведение видео на экране',
      'Стирание экрана',
    ],
    [
      'add()',
      'input',
      'entry',
      'append()',
    ],
  ], [
    3,
    2,
    4,
    3,
    1,
    3,
  ], [
    false,
    false,
    true,
    true,
    false,
    false,
  ], [
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.40.47.png?alt=media&token=78b26365-b897-420a-bf3e-7eba5a9c5eac',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2018.47.09.png?alt=media&token=402435d7-7aa4-4da1-a421-ad981ef6b56a',
    null,
    null,
  ]),
  new Course('Анализ данных в Python', [
    'Бинарный поиск',
    'Бинарное древо',
  ], [
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/12lmdwd5qit1fbm/Section21.%201%20full.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/4tzxqakjef3vz7a/Section21.%202%20full.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    [
      'Написать свобственную ос',
      'Написать ии который определяет калорию продукта',
      'Выучить стих'
    ]
  ], [
    'Конечная совокупность точно заданных правил решения произвольного класса задач или набор инструкций, описывающих порядок действий исполнителя для решения некоторой задачи. это:',
    'Какой результат выдаст данный участок программы?',
    'Классический алгоритм поиска элемента в отсортированном массиве (векторе), это:',
    'Визуализаций бинарного поиска называется:',
    'Как начинает свою работу бинарный поиск?',
  ], [
    [
      'Алгоритм',
      'Семантика',
      'Вычисление',
      'Критическое мышление',
    ],
    [
      '18',
      '20',
      '17',
      '15',
    ],
    [
      'Бинарный поиск',
      'Алгоритм пузырька',
      'Теорема чевы',
      'табу-поиск',
    ],
    [
      'Бинарный алгоритм',
      'Бинарный цикл',
      'Бинарное древо',
      'Бинарная таблица',
    ],
    [
      'С конца',
      'С начало',
      'Случайно',
      'С середины',
    ],
  ], [
    1,
    3,
    1,
    3,
    4,
  ], [
    false,
    true,
    false,
    false,
    false,
  ], [
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FPython%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-23%20%D0%B2%2019.05.08.png?alt=media&token=6f404550-8f05-4b15-941e-3bff3d18d44f',
    null,
    null,
    null,
  ]),
];
List<Course> JavaScriptQaz = [
  new Course('mql', [
    'lda',
    'lasd,' 'das'
  ], [
    true,
    true,
    true
  ], [
    '1',
    '2',
    '3',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что такое агаш?',
    'Зачем нам жить?'
  ], [
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
  ], [
    1,
    2,
    3
  ], [
    true,
    false,
    false,
  ], [
    'https://cdn.shopify.com/s/files/1/0657/0459/products/Screen_Shot_2018-07-15_at_9.57.47_PM.png?v=1531707367',
    null,
    null,
  ]),
  new Course('mql', [
    'lda',
    'lasd,'
  ], [
    true,
    true,
    true,
    false
  ], [
    '1',
    '2',
    '3',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что такое агаш?',
    'Зачем нам жить?'
  ], [
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
  ], [
    1,
    2,
    3
  ], [
    true,
    false,
    false,
  ], [
    'https://cdn.shopify.com/s/files/1/0657/0459/products/Screen_Shot_2018-07-15_at_9.57.47_PM.png?v=1531707367',
    null,
    null,
  ]),
];
List<Course> JavaScriptRus = [
  new Course('Введение в курс', [
    'Настройка рабочего пространства',
    'Установка JSHint'
  ], [
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/n82mijg11y00cci/overview%20js.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/604z8tzl3gzdp8z/section%201.%20%282%29.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    "Какой тег содержит код JavaScript?",
    "Что такое npm?",
    "Что такое NodeJS?",
    "Что такое JSHint?",
    "С помощью какой программы можно устанавливать библиотеки?"
  ], [
    ["style", "script", "tilte", "code"],
    [
      "Менеджер пакетов",
      "Язык программирования",
      "Серверная технология",
      "Програмное обеспечение"
    ],
    [
      "Менеджер пакетов",
      "Язык программирования",
      "Серверная технология",
      "Програмное обеспечение"
    ],
    [
      "Язык программирования",
      "Инструмент статического анализа кода",
      "Серверная технология",
      "Встроенная библиотека"
    ],
    ["Терминал/Командная строка", "JSHint", "Android Studio", "Pods"]
  ], [
    2,
    1,
    3,
    2,
    1
  ], [
    false,
    false,
    false,
    false,
    false
  ], [
    null,
    null,
    null,
    null,
    null,
  ]),
  new Course(
    'JavaScript',
    [
      'Переменные',
      'Виды типов данных в JS',
      'Взаимодействие с пользователем',
      'Основные операторы в JS',
      'Введение в GitHub',
      'gitignore и Git Kraken',
      'Условия в JS',
      'Циклы в JS',
      'Функции в JS',
      'Callback-функции в JS',
      'Объекты в JS',
      'Массивы в JS'
    ],
    [
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
    [
      'https://www.dl.dropboxusercontent.com/s/zno68303iawo141/section%202.%20%281%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/0n53ok1hf6ko7rh/section%202.%20%282%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/qbr94dzzydeapi5/section%202.%20%283%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/jepcs4pfmt9wm2s/section%202.%20%284%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/504fpmxcdaiiqd2/section%202.%20%285%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/pj4frz0dz90zoww/section%202.%20%286%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/q76bvwsh0ppjm8x/section%202.%20%287%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/q7x0logq6b0zo4d/section%202.%20%288%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/j5f7psebnj4w83z/section%202.%20%289%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/iugiwlnj1vhayme/section%202.%20%2810%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/pup505cfoylfw5w/section%202.%20%2811%29.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/5hbyeaizam0l3nt/section%202.%20%2812%29.mp4?dl=0',
    ],
    [
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['Golddsfnlkfdsln', 'Silvdsjnfsdfner', 'Bronze'],
      ['s', 's', 'j'],
      ['Gosmadasld', 'Silver', 'Bronze'],
    ],
    [
      "С помощью какого атрибута вызвается js код?",
      "С помощью какого метода можно получить тип данных переменной",
      "С помошью какого метода можно выводить сообщения в консоль",
      "Назовите сайт для опубликования кода?",
      "Что выведет этот код?",
      "Для чего используются инкременты и декременты?",
      "Сколько элекментов 'case' можно использовать внутри оператора 'switch'?",
      "Что выведет этот код?",
      "Что выведет этот код?",
      "Как найти длину массива?",
      "Что делает метод 'concat'?",
      "Какой тип данных принимают операторы условия?",
      "Сколько раз будет выполняться цикл While без параметра",
      "Что мы должны сделать для объявления параметра?",
      "Сколько параметров может быть внутри функции 'alert'?",
      "В диалоговом окне 'confirm', кнопка «ОК» возвращает ...",
      "Какой символ используется для отделения параметров друг от друга?",
      "Сколько раз можно вызывать объявленную функцию?",
      "Какое ключевое слово используется для создания экземпляра объекта?",
      "Выберите метод, которого нет у массива",
      "Где можно посмотреть код страницы сайта?",
      "Каков результат использования оператора модуля для 103 % 5?",
      "Выберите правильный объект",
      "Как правильно удалить элемент с объекта?",
      "Чтобы использовать свойства объекта внутри функции, используйте:"
    ],
    [
      ["title", "type", "name", "src"],
      ["var", "script", "typeof", "includes"],
      ["print", "console.log", "Writeline", "System.out.print"],
      ["GitHub", "Wikipedia", "w3schools", "stackoverflow"],
      ["You are kid", "You are adult", "You are teenager", "Ошибка!"],
      [
        "для сложения/вычитание 1 из числа",
        "для нахождения остатка",
        "для солжения двух чисел",
        "Они не используются в js"
      ],
      ["Только 1", "2", "Не больше 5", "Столько, сколько условии"],
      ["2", "3", "4", "5"],
      ["6", "5", "12", "18"],
      [
        "Через свойство length",
        "Через свойство count",
        "Через свойство items.count",
        "С помощью специальный функции"
      ],
      [
        "Объединяет два массива",
        "Удаляет элекменты с массива",
        "Добавляет другие переменные",
        "Сортирует массив"
      ],
      ["Integer", "Boolean", "String", "Symbol"],
      ["Бесконечно", "0", "1", "5"],
      [
        "Использовать ключевые слова \"var\" и \"param\"",
        "Использовать ключевое слово \"var\"",
        "Использовать ключевое слово \"param\"",
        "Написать имя переменной в скобках"
      ],
      ["1", "2", "3", "Бесконечно"],
      ["Ложь", "Истину", "null", "undefined"],
      [".", ";", ",", ":"],
      ["0", "1", "2", "Бесконечно"],
      ["create", "object", "var", "new"],
      ["getValues()", "concat()", "fill()", "push()"],
      ["Консоль разработчика", "Wikipedia", "NodeJS", "В настроках браузера"],
      ["4", "0", "3", "5"],
      [
        "var object = []",
        "var object",
        "var object = {}",
        "var object = Symbol()"
      ],
      [
        "object.remove(key)",
        "delete object.key",
        "object.slice(key, 1)",
        "object.key = delete"
      ],
      [
        "Ключевое слово this",
        "Ключевое слово var",
        "Имя функции",
        "Имя программы"
      ]
    ],
    [4, 3, 2, 1, 3, 1, 4, 4, 3, 1, 1, 2, 1, 4, 1, 2, 3, 4, 4, 1, 1, 4, 3, 2, 1],
    [
      false,
      false,
      false,
      false,
      true,
      false,
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
      false
    ],
    [
      null,
      null,
      null,
      null,
      "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.17.16.png?alt=media&token=d8bd4e8d-c792-4363-862c-63e83c8de91b",
      null,
      null,
      "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.53.36.png?alt=media&token=444d89c1-546b-49be-a2e5-a254166307eb",
      "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.57.49.png?alt=media&token=6de98ae4-8ab5-4b6d-ae82-206a99000d05",
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
  ),
  new Course('ООП', [
    'Введение в ООП',
    'Консоль разработчика',
    'Динамическая типезация',
    'Извлечение элементов со страницы',
    'Работа с элементами',
    'События',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    'https://www.dl.dropboxusercontent.com/s/hc4gfkt69pbym02/section%202.%20%2813%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/nmjx1u7fnqke5h6/section%202.%20%2814%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/5f3fecytp5rhjoe/section2.%2815%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/044bu721x2tnu3e/section2.%2816%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/wrtlxlv9ktejra3/section3.%287%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/c0bv0uxmpubzdpw/section3.%288%29.mp4?dl=0'
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    "Как добавить обработчик click для элемента div?",
    "Какой вид типизации используется в JavaScript?",
    "С помощью какого метода можно получить элементы со страницы?",
    "slice является методом ... ?",
    "С помощью какого атрибута 'style' можно округлить элементы?",
    "Как можно удалить 'div' с элемента 'body'?",
    "Через какой атрибут можно редактировать внутренние элементы 'div'?",
    "Что можно использовать для отладки кода?",
    "Что выведет код: console.log(typeof(String(4)));?",
    "Для чего нужен свойство prototype?",
    "В какой вкладке консоля разработчика можно редактировать код?"
  ], [
    ["click(div)", "div.clicked", "div.click", "div.onclick"],
    [
      "Динамическая сильная",
      "Динамическая слабая",
      "Динамическая средняя",
      "Нет правильного ответ"
    ],
    ["takeElement()", "byIdGet()", "getElementsById()", "get()"],
    ["Number", "Array", "Object", "Нет правильного ответа"],
    ["corner-radius", "borderRadius", "cornerRadius", "border-radius"],
    ["remove()", "removeChild()", "removeChildren()", "delete"],
    ["html", "innerHTML", "bodyOfDiv", "div"],
    ["Warn", "Breakpoints", "Alert", "Notification"],
    ["string", "char", "integer", "number"],
    [
      "Посмотреть все методы объекта",
      "Посмотреть все функций объекта",
      "Посмотреть все свойства объекта",
      "Нет правильного ответа"
    ],
    ["Sources", "Console", "Code", "Network"]
  ], [
    4,
    1,
    3,
    2,
    2,
    2,
    2,
    2,
    1,
    3,
    1
  ], [
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
  ], [
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
  ]),
  new Course('Практика с JS', [
    'Функции setTimeOut и setInterval',
    'Портфолио на GitHub',
    'Парамтеры документа',
    'Конструкторы и классы в JS',
    'Метод .this',
    'Интерполяция с ES6',
    'Константы в ES6',
    'Стрелочные функции в ES6',
    'Изначальные парамтеры функции',
    'Классы',
    'Spread - операторы в ES6',
  ], [
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
  ], [
    'https://www.dl.dropboxusercontent.com/s/3bpx6ru74nki3ux/section3.%281%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/azka9sw8hcbulmc/section3.%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/lvbk2scfpxfwj2s/section3.%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/o8vdgusc3r9tw1d/section3.%284%29.mp4?dl=0 ',
    'https://www.dl.dropboxusercontent.com/s/kut2qzx20g93x1d/section3.%285%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/kgq4hrb1zh8fn2k/section3.%286%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/wrtlxlv9ktejra3/section3.%287%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/c0bv0uxmpubzdpw/section3.%288%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/14pf1bgsifqyrmx/section3.%289%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/u7q98w7jsy5txlq/section3.%2810%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/k7u6xgkmaatapnq/section3.%2811%29.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    "Как правильно вывести на экран сообщение 'Hi!' после 5 секунд?",
    "Выверите правильный синтаксис метода setInterval()",
    "Для чего нужен ReadMe файл в GitHub?",
    "Чем отличается функция-конструктор от обычной функций?",
    "Какое ключевое слово нужно использовать для объявления класса?",
    "Что выведет данный код?",
    "Что такое 'this'?",
    "Что выведет код: console.log(typeof({'name' : 'Maksat'}));?",
    "Чем отличается фукнция call от обычной функций?",
    "Что такое метод bind?",
    "Чем отличаются методы call и apply?",
    "Что выведет код 'console.log([0,1,2][4][2])'?",
    "Чем отличается const от let?",
    "Выберите правильный синтаксис функций",
    "Как обозначается метод return в стрелочной функций??",
    "Что выведет этот код?",
    "Что выведет этот код?",
    "Что такое class ?",
    "Как правильно вызвать класс в JS?",
    "Выберите метод который наследуется автоматический?",
    "Что выведет этот код?",
    "Как объединить два массива?"
  ], [
    [
      "sleep(5); alert('Hi!')",
      "sleep(5000); alert('Hi!')",
      "setTimeout(function() {alert('Hi!')}, 5000)",
      "setTimeout(function() {alert('Hi!'')}, 5)"
    ],
    [
      "setInterval(function() {}, time)",
      "setInterval(time) {}",
      "setInterval=(time)=>{}",
      "Нет правильного ответа"
    ],
    [
      "компиляция кода",
      "описание репозитория",
      "выявления ошибок",
      "создания js-кода"
    ],
    [
      "Функция-констуркторы могут возвращать какое-нибудь значение",
      "Функция-констуркторы принимают параметры",
      "Имя функции-конструктора должно начинаться с большой буквы",
      "Нет правильного ответа"
    ],
    ["func", "Имя конструктора", "new", "class"],
    ["Максат", "Ошибка", "undefined", "name"],
    [
      "Глобальное переменное",
      "Экземпляр класса",
      "Контекст вызова",
      "Нет правильного ответа"
    ],
    ["object", "array", "symbol", "string"],
    [
      "Используется без параметров",
      "Есть явно указанный 'this'",
      "Ничем не отличается",
      "Нет правильного ответа"
    ],
    [
      "Для создания контекста",
      "Для зафиксирования контекста",
      "Для добавления новых свойств",
      "Для добавления новых методов"
    ],
    [
      "'apply' принимает массив аргументов вместо списка",
      "'call' можно вызвать только один раз",
      "Они полностью аналогичны",
      "'call' принимает массив вместо списка"
    ],
    ["Ошибка", "method", "object", "function"],
    [
      "const предназначен только для чтения",
      "let предназначен только для чтения",
      "const можно только один раз применить",
      "let можно только один раз применить"
    ],
    [
      "function (a) {}",
      "function = () {}",
      "let func = (a) => {}",
      "function(a) => {} "
    ],
    ["this", "=>", "{}", "Скобки"],
    ["undefined", "12", "9", "14"],
    ["undefined", "14", "9", "Ошибка"],
    [
      "Аналог функции",
      "Экземпляр программы",
      "Шаблон кода для вызова функции",
      "Расширяемый шаблон кода для создания объектов"
    ],
    [
      "Вызвать как функция",
      'Вызвать через "new"',
      'Вызвать через "class"',
      "Нет правильного ответа"
    ],
    ["onclick", "constructor", "super", "extends"],
    ["40", "4", "10", "undefined"],
    [
      "let array = array1.push(array2)",
      "let array = array1.concat(array2)",
      "let array = [array1, array2]",
      "let array = [...array1, ...array2]"
    ]
  ], [
    3,
    1,
    2,
    3,
    3,
    1,
    3,
    1,
    2,
    2,
    1,
    1,
    1,
    3,
    2,
    2,
    2,
    4,
    2,
    2,
    1,
    4
  ], [
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
    false,
    false,
    true,
    true,
    false,
    false,
    false,
    true,
    false
  ], [
    null,
    null,
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-22%20%D0%B2%2014.56.04.png?alt=media&token=5905bcd9-48d7-411c-bb7f-26aeb3dbb47e",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-22%20%D0%B2%2015.41.47.png?alt=media&token=ee3e61ca-8202-4dae-afbe-45e3a1c8bac0",
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-22%20%D0%B2%2016.10.28.png?alt=media&token=4d1a7d47-3571-42d1-a48a-d06575415d28",
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-22%20%D0%B2%2016.10.28.png?alt=media&token=4d1a7d47-3571-42d1-a48a-d06575415d28",
    null
  ]),
  new Course('JS для профессионалов', [
    'JSON файлы',
    'AJAX запросы',
    'Promise в ES6',
    'Хранение данных в local storage',
    'Инкапсуляция',
    'Модули в ES6',
  ], [
    false,
    false,
    false,
    false,
    false,
    false
  ], [
    'https://www.dl.dropboxusercontent.com/s/pg05xpcrqaljfhn/section4.%281%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/2fp5ew6sw2gzgbo/section4.%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/2eb7kl1leo53oms/section4.%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/2fkgeu1pbznisog/section4.%284%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/af708esaee4uqrw/section4.%287%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/c9lfdcbukr880fi/%20section4.%2811%29.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    "Как расшифруется слово 'JSON'?",
    "Что такое JSON?",
    "Как декодировать JSON?",
    "Как конвертировать JSON в string?",
    "Что такое 'Ajax'?",
    "Что такое 'XMLHttpRequest'?",
    "Как правильно вызвать 'XMLHttpRequest'?",
    "... - состояние AJAX-запроса, когда объъект был создан, но open() еще не вызвался",
    "Выберите событие для 'XMLHttpRequest()'",
    "Как взять статус AJAX-запроса?",
    "Что такое Promise?",
    "Выберите состояния Promise",
    "Выберите правильный синтаксис 'Promise'?",
    "Как очистить 'localStorage'?",
    "Что должен вывести этот код?",
    "Как правильно импортировать модуль 'component' с './script'?",
    "Как сохранить данные в 'localStorage'?"
  ], [
    [
      "JavaScript Oriented Notation",
      "JavaScript Object Notion",
      "JavaScript Oriented Notion",
      "JavaScript Object Notation"
    ],
    ["Библиотека", "Фреймворк", "Формат данных", "Синтаксис"],
    ["JSON.decode()", "JSON.parse()", "JSON.take()", "JSON.get()"],
    ["JSON.stringify()", "JSON.string()", "JSON.getString()", "JSON.give()"],
    [
      "Запросы для обмена данными с сервером",
      "Технология для передачи файлов в сервер",
      "Библиотека для декодирование JSON",
      "Нет правильного ответа"
    ],
    [
      "Библиотека для передачи данных",
      "API для обмена данными",
      "Формат данных",
      "Серверная технология"
    ],
    [
      "let request = XMLHttpRequest()",
      "let request = XMLHttpRequest",
      "let request = new XMLHttpRequest()",
      "let request = XMLHttpRequest()"
    ],
    ["NOT_OPENED", "UNSENT", "HEADERS_RECEIVED", "LOADING"],
    ["readystatechange", "statechanged", "onready", "onreadychanged"],
    [
      "request.status",
      "request.getStatus()",
      "request.status()",
      "request.mainStatus"
    ],
    [
      "Функция для API-запросов",
      "Метод для извлечения JSON",
      "Объект, который содержит своё состояние",
      "Нет правильного ответа"
    ],
    [
      "Waiting,Rejected,Finished",
      "Loading, Error, Fulfilled",
      "Getting, Error, Finished",
      "Pending,Rejected,Fulfilled"
    ],
    [
      "let promise = Promise(function(resolve, reject) {})",
      "let promise = new Promise(function(resolve, reject) {})",
      "let promise = Promise(resolve, reject) {}",
      "let promise = new Promise(resolve, reject) {}"
    ],
    [
      "localStorage.removeAll()",
      "localStorage.data = null",
      "localStorage.clear()",
      "localStorage = null"
    ],
    ["Ошибка", "Hello", "null", "undefined"],
    [
      "imoprt: './script/component'",
      "'import./script'",
      "comopnent from './script';",
      "import comopnent from './script';"
    ],
    [
      "localStorage.setItem(key, value)",
      "localStorage.set(key, value)",
      "localStorage.setItem(value, key)",
      "localStorage.set(value, key)"
    ]
  ], [
    4,
    3,
    2,
    1,
    1,
    1,
    3,
    2,
    1,
    1,
    3,
    4,
    4,
    3,
    2,
    4,
    1
  ], [
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
    true,
    false,
    false
  ], [
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
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-22%20%D0%B2%2017.43.56.png?alt=media&token=7a01e856-7048-4692-97a6-df0d3c29af46",
    null,
    null
  ]),
];
List<Course> CSharpRus = [
  new Course('Введение в курс', [
    'Настройка рабочего пространства',
    'Создание нового проекта в Visual Studio',
    'Первая программа',
    'Математические операции в C#',
  ], [
    false,
    false,
    false,
    false
  ], [
    'https://www.dl.dropboxusercontent.com/s/8yossy4jzj2p4pq/Section1.%20%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/8snwjg4j2n5re4a/Section1.%20%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/iy3zsexsrbnw9r9/Section1.%20%284%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/8vyc6d7n1bsa1kz/Section1.%20%285%29.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    "Что выведет данный код?",
    "Для чего нужен метод clear?",
    "К какому типу относится int?",
    "Какое число присвоенo к переменной в данном коде?",
  ], [
    ['Hello world', 'Привет мир', 'Console', 'Writeline'],
    [
      'Удалить одну строку',
      'Очистить полностью консоль',
      'Изменить код',
      'Все ответы не верны'
    ],
    [
      'Символы Юникода',
      'Логическое значение',
      'Целочисленный со знаком',
      'Целочисленный без знака'
    ],
    ['Number', '1', '-1', '5'],
  ], [
    1,
    2,
    3,
    4,
  ], [
    true,
    false,
    false,
    true,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F1.png?alt=media&token=a2c237b9-6cf5-450c-a5bc-59349d45b74a',
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F2.png?alt=media&token=fa17f674-dff7-444d-b615-6bbf033dbb92',
  ]),
  new Course('Все типы данных', [
    'Переменные и тип данных',
    'Входные переменнын',
    'Типы данных',
    'Отладка кода',
    'Integer(числа)',
    'Тип данных Float',
    'Логический тип данных',
    'Тип данных Char',
    'Настройки char',
    'Тип данных String',
    'Объекты и переменные',
    'Массивы',
    'Конвертирование данных в тип String',
    'Методы с использованием типа данных String',
    'Операции с типами данных',
    'Рандомные числа',
  ], [
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
  ], [
    'https://www.dl.dropboxusercontent.com/s/ul1uadas2hnoszd/Section2.%20%281%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/kaezxztnsopwl7g/Section2.%20%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/lsq29lm85fx1pw2/Section2.%20%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/hcg9rjy4ovrorqd/Section2.%20%284%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/hf8au0ygyeoufet/Section2.%20%285%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/enyq9e55npi6442/Section2.%20%286%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/0csw53mkpjuanzc/Section2.%20%287%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/il68gr7yn0marcn/Section2.%20%288%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/f7lar8d2tgs69fp/Section2.%20%289%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/6025cnq94vs8jt6/Section2.%20%2810%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/0irxv6wx85je26l/Section2.%20%2811%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/54oorx3tk7r8mkq/Section3.%20%281%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/yxhwz9wh8kh3dq7/Section3.%20%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/qna7a9sos4mxin3/Section3.%20%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/cgmb22tzfz8qnru/Section3.%20%284%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/hsttpu0nnk452jm/Section3.%20%285%29.mp4?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    "С помощью какого атрибута вызвается js код?",
    "С помощью какого метода можно получить тип данных переменной",
    "С помошью какого метода можно выводить сообщения в консоль",
    "Назовите сайт для опубликования кода?",
    "Что выведет этот код?",
    "Для чего используются инкременты и декременты?",
    "Сколько элементов 'case' можно использовать внутри оператора 'switch'?",
    "Что выведет этот код?",
    "Что выведет этот код?",
    "Как найти длину массива?",
    "Что делает метод 'concat'?",
    "Какой тип данных принимают операторы условия?",
    "Сколько раз будет выполняться цикл While без параметра",
    "Что мы должны сделать для объявления параметра?",
    "Сколько параметров может быть внутри функции 'alert'?",
    "В диалоговом окне 'confirm', кнопка «ОК» возвращает ...",
    "Какой символ используется для отделения параметров друг от друга?",
    "Сколько раз можно вызывать объявленную функцию?",
    "Какое ключевое слово используется для создания экземпляра объекта?",
    "Выберите метод, которого нет у массива",
    "Где можно посмотреть код страницы сайта?",
    "Каков результат использования оператора модуля для 103 % 5?",
    "Выберите правильный объект",
    "Как правильно удалить элемент с объекта?",
    "Чтобы использовать свойства объекта внутри функции, используйте:"
  ], [
    ["title", "type", "name", "src"],
    ["var", "script", "typeof", "includes"],
    ["print", "console.log", "Writeline", "System.out.print"],
    ["GitHub", "Wikipedia", "w3schools", "stackoverflow"],
    ["You are kid", "You are adult", "You are teenager", "Ошибка!"],
    [
      "для сложения/вычитание 1 из числа",
      "для нахождения остатка",
      "для солжения двух чисел",
      "Они не используются в js"
    ],
    ["Только 1", "2", "Не больше 5", "Столько, сколько условии"],
    ["2", "3", "4", "5"],
    ["6", "5", "12", "18"],
    [
      "Через свойство length",
      "Через свойство count",
      "Через свойство items.count",
      "С помощью специальный функции"
    ],
    [
      "Объединяет два массива",
      "Удаляет элекменты с массива",
      "Добавляет другие переменные",
      "Сортирует массив"
    ],
    ["Integer", "Boolean", "String", "Symbol"],
    ["Бесконечно", "0", "1", "5"],
    [
      "Использовать ключевые слова \"var\" и \"param\"",
      "Использовать ключевое слово \"var\"",
      "Использовать ключевое слово \"param\"",
      "Написать имя переменной в скобках"
    ],
    ["1", "2", "3", "Бесконечно"],
    ["Ложь", "Истину", "null", "undefined"],
    [".", ";", ",", ":"],
    ["0", "1", "2", "Бесконечно"],
    ["create", "object", "var", "new"],
    ["getValues()", "concat()", "fill()", "push()"],
    ["Консоль разработчика", "Wikipedia", "NodeJS", "В настроках браузера"],
    ["4", "0", "3", "5"],
    [
      "var object = []",
      "var object",
      "var object = {}",
      "var object = Symbol()"
    ],
    [
      "object.remove(key)",
      "delete object.key",
      "object.slice(key, 1)",
      "object.key = delete"
    ],
    [
      "Ключевое слово this",
      "Ключевое слово var",
      "Имя функции",
      "Имя программы"
    ]
  ], [
    2,
    2,
    1,
    2,
    2,
    3,
    2,
    1,
    3,
    1,
    1,
    2,
    1,
    4,
    4,
    2,
    3,
    4,
    4,
    1,
    1,
    3,
    3,
    2,
    1
  ], [
    false,
    false,
    false,
    false,
    true,
    false,
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
    false
  ], [
    null,
    null,
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.17.16.png?alt=media&token=d8bd4e8d-c792-4363-862c-63e83c8de91b",
    null,
    null,
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.53.36.png?alt=media&token=444d89c1-546b-49be-a2e5-a254166307eb",
    "https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/tests%2FJavascript%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202019-08-21%20%D0%B2%2017.57.49.png?alt=media&token=6de98ae4-8ab5-4b6d-ae82-206a99000d05",
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
  ]),
  new Course('Работа с консолью', [
    '.Write() и .Writeline()',
    'Форматирование строки',
    'Правописание специальных символов в String',
    'Чтение символов с консоли',
    'Чтение строк с консоли',
    'Чтение нажатой клавиши с консоли',
    'Кастомизация консоли',
    'Вывод разноцветных сообщений',
    'Кастомизация курсора',
    'Масштабизация консоли',
  ], [
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
  ], [
    'https://www.dl.dropboxusercontent.com/s/sm25tdpg2jhphud/Section4.%20%281%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/v9vb2wytfky6gx8/Section4.%20%282%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/njwjpbw6rblql3f/Section4.%20%283%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/apa9jxbqgdfgw2q/Section4.%20%284%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/qbaisxvz1u5xwt3/Section4.%20%285%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/slkn3vq6qiud0hb/section4.%20%286%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/jm5f9ovefddbny5/Section4.%20%287%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/jj2umejjem8rjtp/%20section4.%20%288%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/yqnhw2tb6kifrbe/%20section4.%20%289%29.mp4?dl=0',
    'https://www.dl.dropboxusercontent.com/s/g36fp26pno6urlm/section4.%2810%29.m4v?dl=0',
  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Чем отличается Console.WriteLine от Console.Write?',
    'Что выводит данный код?',
    'Что такое таблица ASCII?',
    'Что будет находиться в переменной name?',
    'Обозночения оператора НЕ',
    'Обозночения оператора И',
    'Обозночения оператора ИЛИ',
    'Что делает данный код?',
    'Какой результат даст данный код?',
    'Какой оператор сравнения вы бы использовали, чтобы проверить, не равны ли две переменные?',
    'Что делает данная строка кода?',
  ], [
    [
      'Console.WriteLine() выводит текст, что в круглых скобках, на консоль и переносит строку. Console.Write() выводит текст, что в круглых скобках, на консоль без переноса строки.',
      'Разницы нет',
      'Нет правильного ответа',
      'Все ответы верны'
    ],
    [
      'Age',
      'Возраст, который вы ввели вместе с предложением',
      'Число которое вы ввели',
      'I am'
    ],
    [
      'Таблица, в которой некоторым распространённым печатным и непечатным символам сопоставлены числовые коды',
      'таблица с цифрами',
      'таблица с буквами',
      'все ответы верный'
    ],
    ['Arthur', 'NULL', 'Vasya', 'String'],
    ['!', 'Not', 'No', '!='],
    ['Все выше перечисленные', '&', 'and', '&&'],
    [
      '1',
      '||'
          'Or'
          '!='
    ],
    [
      'Увеличивает и уменьшает переменную на 1',
      'Выводит на экран 5',
      'Минусует 1 от 5',
      'Нет правильного ответа'
    ],
    ['Не истинный', 'Истинный', 'Все ответы верны', 'Нет правильного ответа'],
    ['!=*', '==', '!', '>='],
    [
      'Объединяет две строки "Black" и " Coffe"',
      'Суммирует две переменные',
      'Умнoжает строки на друг-друга',
      'Нет правильного ответа'
    ],
  ], [
    2,
    2,
    1,
    1,
    1,
    4,
    2,
    1,
    3,
    2,
    1
  ], [
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
  ], [
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F6.png?alt=media&token=2cca4025-04b9-4fd0-a14a-d325d6fc1371',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F7.png?alt=media&token=a1dba77b-fae5-4adc-8d37-0473bb7ef5cf',
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F8.png?alt=media&token=8b966e43-55bf-4e81-975b-18c7f2edafe3',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F9.png?alt=media&token=fb77233b-85ec-40a3-985d-3b63586159bf',
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F10.png?alt=media&token=1bd3f89d-45fa-4a73-bf82-4a97ef2fc65e'
  ]),
  new Course('Операторы и выражения', [
    'Арифметические операторы',
    'Логические операторы',
    'Операции сравнения',
    'Операторы присваивания',
    'Одинарные, Бинарные и Тернарные операторы',
    'Проверка чисел на четность'
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/0an57gy08x5gxah/section%205%20%281%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/mg4ulllzp7w1dai/section%205%20%282%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/bnjokj4qzjvj3gi/section%205%20%283%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/gqqtd1svdo06vph/section5.%20%284%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/enfe3velvcqg6p8/section5.%20%285%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/z2tivunduggc8x0/section5.%20%286%29_x264.mp4?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    "Для чего нужны массивы в C#?",
    "Для чего нужен метод gettype?",
    "Что является переменным в данном коде?",
    "Что делает данный код?",
  ], [
    [
      'Для объединения связанных вместе переменных',
      'Для удаления данных',
      'Для созданий новых переменных',
      'Все ответы верны'
    ],
    [
      'Чтобы вывести значение в экрна',
      'Суммировать значения',
      'Для определения типа переменного',
      'Нет правильного ответа'
    ],
    ['Coffe', 'String', 'NaN', 'coffeMug'],
    [
      'Выводит на экран следующее число после rng',
      'Выводит абсолютно рандомное число',
      '0',
      '1',
    ],
  ], [
    1,
    3,
    4,
    2
  ], [
    false,
    false,
    true,
    true,
  ], [
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F4.png?alt=media&token=c678c11e-e060-48c6-b463-e072c42a3471',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F5.png?alt=media&token=e5162add-3f4d-44bb-b76b-bb09fa90ddcb',
  ]),
  new Course('Условные операторы', [
    'Условия IF, Else',
    'Условие else if',
    'Switch(переключатель)',
    'Важность скобок',
  ], [
    false,
    false,
    false,
    false
  ], [
      'https://www.dl.dropboxusercontent.com/s/uoa2c93vom10w0d/section6.%20%281%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/wl3uacg8jvyd8s6/section6.%20%282%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/e7h0y73qt0t17dc/section6.%20%283%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/e7h0y73qt0t17dc/section6.%20%283%29_x264.mp4?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Можете ли вы иметь условный оператор if без блока кода else?',
    'В чем разница между if/else if/else and switch?'
  ], [
    ['Да', 'Нет', 'Зависит от кода', 'Нет правильного ответа'],
    [
      'Нет абсолютно никакого отличия',
      'Отличия только в ключевых словах',
      'Этот переключатель сравнивает одну заданную переменную со многими различными случаями. в то время как if / else if может сравнивать много разных случаев, которые не связаны одной и той же переменной.',
      'Нет правильного ответа'
    ],
  ], [
    1,
    3,
  ], [
    false,
    false,
  ], [
    null,
    null,
  ]),
  new Course('Циклы', [
    'Цикл While',
    'Do-While цикл',
    'Цикл For',
    'Обратный цикл',
    'Цикл Foreach',
    'Вложенные циклы',
  ], [
    false,
    false,
    false,
    false,
    false,
    false
  ], [
      'https://www.dl.dropboxusercontent.com/s/dc5ihkf6mixw9xv/section7.%20%281%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/5jey5lc3rnhnd99/section7.%20%282%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/a3gzesznm4fuyio/section7.%20%283%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/37x03g7rvb7zhxx/section7.%20%284%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/e8nrh1mye92uwdp/section7.%20%285%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ztlqlkermyl2619/section7.%20%286%29_x264.mp4?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Что делает цикл?',
    'Какой оператор возвращает значение из метода?',
    'В чем разница между циклом While и Do-While?',
    'Для чего в основном используется цикл for?',
  ], [
    [
      'Ставит условия в коде',
      'Организует многократное исполнение набора инструкций',
      'Используется для того, чтобы очистить строку кода',
      'Нет правильного ответа'
    ],
    ['return', 'veni', 'end', 'out'],
    [
      'Нет разницы',
      'Разница в том, что цикл While всегда будет выполняться хотя бы один раз независимо от условия, а Do-While не будет',
      'Разница в том, что цикл Do-While всегда будет выполняться хотя бы один раз независимо от условия, а While не будет',
      'Нет правильного ответа'
    ],
    [
      'Цикл for последовательно выполняет одинаковые действия, определенное количество раз.',
      'Обнуляет переменные при их создании',
      'Код будет выполняться до тех пор, даже если пользователь завершит работу программы',
      'Нет правильного ответа'
    ],
  ], [
    4,
    1,
    3,
    4,
  ], [
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
  ]),
  new Course('Проект 1', [
    'Создание проекта',
    'Исправление ошибок',
  ], [
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/uxvnx7icq0sec0o/section8.%20%281%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/qqyzma6j4u2fw2j/section8.%20%282%29_x264.mp4?dl=0',


      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Что будет выведено на консоль?',
    'Что будет выведено на консоль?',
    'Структура — это …',
    'Какой способ вызова исключения является корректным?',
  ], [
    ['5', '5.5', '6', 'Возникнет ошибка'],
    ['EnumValue', 'Names', 'Enum', 'Value'],
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
  ], [
    1,
    2,
    1,
    1,
  ], [
    true,
    true,
    false,
    false,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F11.png?alt=media&token=325dd6ec-a792-4971-8b2d-930f662d10a4',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F12.png?alt=media&token=02fdd81f-f0f9-4cd2-82b4-cffe595eb7c7',
    null,
    null,
  ]),
  new Course('Массивы и Списки', [
    'Что такое массивы?',
    'Цикл с массивами',
    'Значения и ссылочные типы',
    'Клонирование массивов',
    'Обратный массив',
    'Сортировка массивов',
    'Проверка массива на симметричность',
    'Массив из чисел',
    'Что такое List(Список)?'
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/v9lm58wxroaupe1/section9.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/zs32c7hfnii0d03/section9.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/zpf8ibbvzllwu6r/section9.%20%283%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/4hc10eriqy4ibaz/section9.%20%284%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/u2it8cyjwgkwtfz/Section9.%20%285%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ffhe9b7g5rd741a/Section9.%20%286%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/rvjqffhf4x7i90y/Section9.%20%287%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ocksa6mnbpzvrrc/Section9.%20%288%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/kvj24z0r2zcq7q6/Section9.%20%289%29.m4v?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что будет содержать массив models после выполнения данного фрагмента кода?',
    'Какие бывают массивы?',
    'Когда вы должны использовать список вместо массива?',
    'Какой код правильно инициирует список строк?',
    'Структура данных, хранящая набор значений пронумерованные с индексами начиная от 0?',
  ], [
    [
      'Возникнет ошибка',
      '1, 100, "300", "5"',
      '1, "300", 100, "5"',
      '1, "5", 100, "300"'
    ],
    [
      'Разнообразные',
      'Сложные и простые',
      'Одномерные и многомерные',
      'Резиновые и статичные'
    ],
    [
      'Это не имеет значения, они похожи',
      'Я должен использовать список всякий раз, когда мне нужна коллекция, которая должна изменить свой размер',
      'я должен использовать массив всякий раз, когда мне нужна коллекция, которая должна изменить свой размер',
      'Нет правильного ответа'
    ],
    [
      'List<string> list = new List<string>();',
      'List<string> list = new List<string>;',
      'List<string> list = new List<10>();',
      'List<string>() list = new List<string>;'
    ],
    ['Массив', 'list', 'tuple', 'set'],
  ], [
    1,
    3,
    2,
    1,
    1,
  ], [
    true,
    false,
    false,
    false,
    false,
  ], [
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F13.png?alt=media&token=40fdd149-00c0-4aac-83b6-5498379af279',
    null,
    null,
    null,
    null,
  ]),
  new Course('Многомерный массив', [
    'Введение',
    'Двумерный массив',
    'Вывод двумерного массива',

  ], [
    false,
    false,
    false,

  ], [
      'https://www.dl.dropboxusercontent.com/s/egaf9u55f96ntdm/Section10.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/4v58thse8c48lfj/Section10.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/rqdkhsl6rmmadmm/Section10.%20%283%29.m4v?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
   
  ], [
    'Как правильно инициировать двумерный целочисленный массив с 4 строками и 7 столбцами?',
    'Правильно ли заполнен двумерный массив?',
    'Есть ли в этом коде ошибка?',
    'Что делает модификатор sealed?',
    'Какой массив называется многомерным?',
  ], [
    [
      'Int[,] array = new int[4, 7];',
      'Int[4, 7] array = new int[, ];',
      'Int[] array = new int[4, 7];',
      'Нет правильного ответа'
    ],
    [
      'Нет правильного ответа',
      'Да',
      'Нет',
      'Все зависит от предыдущих строк кода'
    ],
    [
      'Да, потому что row не может быть равен 0',
      'Да, потому что цикл неправильно составлен',
      'Нет',
      'Да, потому что вместо int должен был быть boolean'
    ],
    [
      'Разрешает наследование только один раз',
      'Ограничивает видимость текущей сборкой',
      'Добавляется просто для наглядности, но ничего не изменяет',
      'Запрещает наследование'
    ],
    [
      'Тот в котором можно хранить созданные листы',
      'Тот в котором можно хранить как переменные, так и константы',
      'Который отличается двумя или более измерениями',
      'В котором можно хранить данные разных типов'
    ]
  ], [
    1,
    2,
    3,
    4,
    3
  ], [
    false,
    true,
    true,
    false,
    false,
  ], [
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F14.png?alt=media&token=b6cff1e9-40ee-4664-aa72-a6ec2368ccd6',
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F15.png?alt=media&token=27293fda-a7b3-4e8a-afa4-06eddcd4eb60',
    null,
    null,
  ]),
  new Course('Методы', [
    'Что такое метод?',
    'Создание методов',
    'Методы возврата',
    'Перегрузка методов',
    'Методы с переменными и аргументами',
    'Методы с опциональными аргументами',
    'Значения и ссылочные типы',
    'Модификаторы Ref и Out',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/virzbvmw5qdd1cj/Section11.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/s0tu3zna1w52ils/Section11.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/283zms19rjp5ecn/Section11.%20%283%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/jy1m1e7eb1swcrn/Section11.%20%284%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/08i7ho666j7hwuv/Section11.%20%285%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ds1mxlqkteaxpq1/Section11.%20%286%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/pk65rtzuvvw34zy/Section11.%20%287%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ph99zgoh4wtmw3d/Section11.%20%288%29.m4v?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Должны ли методы выполнять более одной задачи, true или false?',
    'Есть ли разница и что это между пустыми методами и методами возврата?',
    'Что такое перегрузки?',
    'C# код компилируется в код …',
  ], [
    ['True', 'False', 'Все ответы верны', 'Нет правильного ответа'],
    [
      'Методы Void могут дополнительно возвращать значение при выполнении своей задачи, в то время как методы Return всегда должны возвращать значение указанного типа данных',
      'Методы Void не могут возвращать значение при выполнении своей задачи, в то время как методы Return всегда должны возвращать значение указанного типа данных',
      'Пустота и методы возврата может и при необходимости возвращать значение, когда они выполняют свою задачу',
      'Нет правильного ответа'
    ],
    [
      'Перегрузка позволяет создать несколько методов с одинаковым именем, но они могут иметь разные реализации',
      'Перегрузка позволяет создать более одного метода с тем же именем, но он может иметь разные реализации, и вы должны использовать ключевое слово "перегрузка" при создании метода',
      'Перегрузка позволяет создать несколько методов с одинаковым именем, и все методы перегрузки должны иметь разное количество и/или типы аргументов',
      'Нет правильного ответа'
    ],
    ['CIL', 'MASM', 'CLI', 'FCL'],
  ], [
    2,
    2,
    3,
    1
  ], [
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
  ]),
  new Course('Строки', [
    'Извлечение подстрок из строки',
    'Разделение строки',
    'Замена подстроки в строке',
    'Удаление подстроки из строке',
    'Обрезка пробелов и других символов',
    'Конкатенация строк',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/7ra90yvkpk0w68p/Section12.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/161id6ae6b63xbv/section12.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/d2cvsi5ph10bunx/Section12.%20%283%29.mp4.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/rdndwlpptlwdegs/Section12.%20%284%29.mp4.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/ke2pys456ev9a0z/Section12.%20%285%29.mp4.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/6y1kh14x0xwia9c/Section12.%20%286%29.m4v?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Что делает оператор «%»?',
    'Чему будет равен с, если int a=10; int b=4; int c= a%b?',
    'Что такое константа ?',
    'Верно ли, что тип string хранит набор символов Unicode?',
    'Для преобразования текста в целое число используется функция',
  ], [
    [
      'Возвращает остаток от деления',
      'Нет правильного ответа',
      'Возвращает тригонометрическую функцию',
      'Возвращает процент от суммы'
    ],
    ['1', '3', '11', '2'],
    [
      'Переменная типа string',
      'Переменная которая может быть изменена в любое время',
      'Глобальная переменная',
      'Переменная значение которой нельзя изменить'
    ],
    ['Да', 'Нет', 'Возникнет ошибка', 'NaN'],
    [
      'Int32.Convert();',
      'Convert.ToInt16();',
      'Int16.ToStr()',
      'String.ToInt32()'
    ],
  ], [
    1,
    4,
    4,
    1,
    2
  ], [
    false,
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
    null,
  ]),
  new Course('Работа с файлами', [
    'Введение в каталоги',
    'Свойства и методы каталогов',
    'Введение в DirectoryInfo Class',
    'Свойства и методы DirectoryInfo',
    'Введение в файлы',
    'Свойства FileInfo',
    'TextFile в C#',
    'Разные методы чтения',
    'StreamRead и StreamWrite',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/m5s69k3rmo0d0ig/section%2014%281%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/xryri7kcf0wsuzs/section%2014%282%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/67e0iutklo1q673/section%2014%283%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/vhwnhszndpi8kpy/Section14%284%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/5hx3za4gu7esho6/section%2014%285%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/k0hamzn0x0474c7/Section14.%20%286%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/4hf34ths97oxlkj/Section14.%20%287%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/hpv8ivhf7vcw4oo/Section14.%20%288%29_x264.mp4?dl=0',
      'https://www.dl.dropboxusercontent.com/s/iro1ypdzgts02qn/Section14.%20%289%29_x264.mp4?dl=0',

      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Чему будет равен с, если int a = 10; int b = 4; bool c = (a == 10 && b == 4)?',
    'Что представляет собой класс Directory?',
    'Что делает метод CreateDirectory(path)?',
    'Что делает метод Delete(path)?',
    'Что делает метод GetDirectories(path)?',
    'Что делает класс DirectoryInfo?',
    'Для чего нужен метод MoveTo(destDirName)?',
  ], [
    ['14', 'Null', 'False', 'True'],
    [
      'функциональность для создания, удаления, перемещения и других операций с каталогами',
      'Нет правильного ответа',
      'Указывает путь файла в коде',
      'Класс Directory предоставляет ряд статических методов для управления каталогами'
    ],
    [
      'создает каталог по указанному пути path',
      'удаляет каталог по указанному пути path',
      'получает список каталогов в каталоге path',
      'получает список файлов в каталоге path'
    ],
    [
      'создает каталог по указанному пути path',
      'удаляет каталог по указанному пути path',
      'получает список каталогов в каталоге path',
      'получает список файлов в каталоге path'
    ],
    [
      'получает список файлов в каталоге path',
      'перемещает каталог',
      'получает список каталогов в каталоге path',
      'получение родительского каталога'
    ],
    [
      'Данный класс способен показывать директорию чужих файлов',
      'Данный класс может показать директорию файла',
      'Данный класс может изменить изначальную директорию файла',
      'Данный класс предоставляет функциональность для создания, удаления, перемещения и других операций с каталогами.'
    ],
    [
      'перемещает каталог',
      'перемещает файл',
      'перемещает переменную',
      'загружает библиотеки'
    ],
  ], [
    4,
    4,
    1,
    2,
    3,
    1,
    1
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ]),
  new Course('Интерполяция строк', [
    'Введение',
    'Форматирование интерполированных строк',
    'Выражения и методы',
  ], [
    false,
    false,
    false
  ], [
      'https://www.dl.dropboxusercontent.com/s/wqedgx4iv16jwqd/Section16.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/bsex8tydw64vqpk/Section16.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/qi0nq1tn6z2m2ta/Section16.%20%283%29.m4v?dl=0',
      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze']
  ], [
    'Как указать строку формата для выражения интерполяции?',
    'Какое из этих кодов задает выравнивание?',
    'Какой знак идентифицирует строковый литерал как интерполированную строку?',
    'Что будет выведено на консоль?',
  ], [
    [
      '{<interpolationExpression>:<formatString>}',
      '{<interpolationExpression><formatString>}',
      '{<interpolation>:<formatString>}',
      '{<interpolationExpression>:}'
    ],
    [
      '{<interpolationExpression>,<alignment>:}',
      '{<interpolationExpression><alignment>:<formatString>}',
      '{<interpolationExpression>,<alignment><formatString>}',
      '{<interpolationExpression>,<alignment>:<formatString>}'
    ],
    ['#', '||', 'Знак доллора', '—'],
    ['-1', 'Возникнет ошибка', '1', '-6'],
  ], [
    1,
    4,
    3,
    4,
  ], [
    false,
    false,
    false,
    true,
  ], [
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F16.png?alt=media&token=a8369e59-56cf-4e2a-beb4-536a43112f31',
  ]),
  new Course('Обработка исключений', [
    'Введение',
    'Ловить несколько исключений',
    'Использование исключения как переменную',
    'Пример на try и catch',
  ], [
    false,
    false,
    false,
    false,
  ], [
      'https://www.dl.dropboxusercontent.com/s/7f40a7yilbyi27j/Section17.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/x7q0xsdqk7yw6hr/section17.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/lwmdfayd0wluo7f/section17.%20%283%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/vc1z3uk2zj68vo2/section17.%20%284%29.m4v?dl=0',

  ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Для чего нужны функции обработки исключений в языке С#?',
    'Когда выдается ArgumentException?',
    'Когда выдается ArgumentNullException?',
    'Когда выдается ArgumentOutOfRangeException?',
  ], [
    [
      'Помогают вам справиться с непредвиденными или исключительными проблемами, которые возникают при выполнении программы',
      'помогают вам справиться с предвиденными проблемами, которые возникают при выполнении программы',
      'усложняют задачу исправления с непредвиденными или исключительными проблемами, которые возникают при выполнении программы',
      'Нет правильного ответа'
    ],
    [
      'Он выдается при выполнении арифметических операций, приведения или преобразования.',
      'Выдается, когда метод требует аргумент, но аргумент не предоставляется.',
      'Он выбрасывается при выполнении арифметических операций, приведения или преобразования.',
      'Выдается, когда в метод предоставлен неверный аргумент.'
    ],
    [
      'Он выдается, когда в метод предоставлен неверный аргумент',
      'Выдается, когда метод требует аргумент, но аргумент не предоставляется',
      'Он выбрасывается при выполнении арифметических операций, приведения или преобразования',
      'Выдается, когда значение аргумента выходит за пределы допустимого диапазона'
    ],
    [
      'Он выдается, когда в метод предоставлен неверный аргумент.',
      'Выдается, когда метод требует аргумент, но аргумент не предоставляется.',
      'Выдается, когда значение аргумента выходит за пределы допустимого диапазона.',
      'Он выбрасывается при выполнении арифметических операций, приведения или преобразования.'
    ],
  ], [
    1,
    4,
    2,
    3,
  ], [
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
  ]),
  new Course('ООП', [
    'Введение',
    'Структурирование файлов',
    'Классы',
    'Ключевое слово this',
    'Поля и их свойства',
    'Реализация проверки свойства',
    'Read-Only, Write-Only, Read-Write в C#',
    'Статические поля',
    'Константы в C#',
    'Перечисление',
    'Cтатический класс'
  ], [
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
  ], [
      'https://www.dl.dropboxusercontent.com/s/3lwhlflbrgvkmc1/section19.%20%281%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/azssg013ocs26d1/Section19.%20%282%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/s81jhqyhs3e7opb/Section19.%20%283%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/s5p0c37wrb2veb9/Section19.%20%284%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/krtrjhrin2g7zwg/Section19.%20%285%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/a0osnvfdfj2gxwi/Section19.%20%286%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/gfxm3efh0jb0zmx/Section19.%20%287%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/4gorq597l2etgnz/Section19.%20%288%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/epbrcuz2nwwk0kz/Section19.%20%289%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/v6nfyan2d2nwwzi/Section19.%20%2810%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/fg9o9g4m5f549pu/section19.%20%2811%29.m4v?dl=0',
      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что такое ООП?',
    'Можно ли наследоваться от нескольких интерфейсов?',
    'Можно ли сделать перегрузку оператора присваивания?',
    'Что будет выведено на консоль?',
    'Какое ключевое слово ссылается на текущий экземпляр класса?',
    'В чем особенность статического класса?',
    'Название ключевого слово который позволяет специфицировать набор допустимых значений, и назначить каждому понятное имя, это…',
    'Какое ключевое слово используется для объявления переменной-члена константой, но позволяет вычислять значение во время выполнения?',
    'После определения, значение не может быть изменено. Что это такое?',
  ], [
    [
      'методология программирования, основанная на представлении программы в виде совокупности объектов, каждый из которых является экземпляром определённого класса',
      'Язык программирования',
      'Метод программирования',
      'Нет правильного ответа'
    ],
    ['Да', 'Нет', 'Зависит от кода', 'Зависит от значений'],
    ['Нет', 'Возникнет ошибка', 'Нет правильного ответа', 'Да'],
    ['"Text"', '"test"', 'Возникнет ошибка', 'String.Empty'],
    ['params', 'this', 'catch', 'default'],
    [
      'Может подключать специальные библиотеки',
      'При выводе полученные данные не могут изменится',
      'Он не может быть создан и может содержать только статические элементы.',
      'Он позволяет создать константы вместо переменных'
    ],
    ['checked', 'decimal', 'implicit', 'Enumeration'],
    ['read-write', 'readonly', 'const', 'writeonly'],
    ['readonly', 'const', 'readwrite', 'tuple'],
  ], [
    1,
    1,
    1,
    3,
    2,
    3,
    2,
    2,
    2,
  ], [
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    'https://firebasestorage.googleapis.com/v0/b/qazcode-92c01.appspot.com/o/C%23%20test%2F17.png?alt=media&token=3ae0d254-5aaa-4d56-b1a9-549aa1ede90c',
    null,
    null,
    null,
    null,
  ]),
  new Course('Проект "Битва"', [
    'Введение в проект',
    'Поля',
    'Свойства и Namespace',
    'Создание конструуторов',
    'Создание наших констант',
    'Метод атаки',
    'Завершение проекта',
  ], [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ], [
     'https://www.dl.dropboxusercontent.com/s/hx76ynw645m43vp/section20.%20%281%29.m4v?dl=0',
     'https://www.dl.dropboxusercontent.com/s/b7gzryvndrk5go7/section20.%20%282%29.m4v?dl=0',
     'https://www.dl.dropboxusercontent.com/s/tumqz4fawcg0uot/section20.%20%283%29.m4v?dl=0',
     'https://www.dl.dropboxusercontent.com/s/3zwbvwmede1hd6u/section20.%20%284%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/48jgokzs2hmyu4l/section20.%20%285%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/dhorpqhv2xyl5ii/section20.%20%286%29.m4v?dl=0',
      'https://www.dl.dropboxusercontent.com/s/z5tiu54yk3w8x7n/section20.%20%287%29.m4v?dl=0',
      ], [
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
    ['Gold', 'Silver', 'Bronze'],
  ], [
    'Что вернет функция Termin после выполения. Код:int Termin(){int a = 1;int b = 3;if (a != 5) return a + b;else return 0;}',
    'Как называется оператор «?:»?',
    'Выбери правильное описание оператора «?:»',
    'Какой тип переменной используется в коде: int a = 5;',
  ], [
    ['4', '3', '5', '0'],
    [
      'Прямой оператор',
      'Тернарный оператор',
      'Вопросительный',
      'Территориальный оператор'
    ],
    [
      'Указатель на переменную',
      'Возвращает адрес переменной',
      'Условное выражение',
      'Определяет, имеет ли объект определенный тип'
    ],
    [
      'Знаковое 8-бит целое',
      'Знаковое 64-бит целое',
      'Знаковое 32-бит целое',
      '1 байт'
    ],
    [
      'Человек',
      'Human',
      'Dog',
      'Mouse',
    ],
  ], [
    1,
    2,
    3,
    3,
  ], [
    false,
    false,
    false,
    false,
  ], [
    null,
    null,
    null,
    null,
  ]),
];

//for (String content in course.LessonName)
//columnContent.add(
//new ListTile(
//onTap: () {
//Navigator.of(context).pushReplacement(
//new MaterialPageRoute(builder: (context) => Video_Page(LessonName: course.LessonName[],)));
//},
//trailing: new Icon(course.icon),
//title: new Text(
//content,
//style: new TextStyle(fontSize: 18.0),
//),
//leading: new Icon(course.icon),
//),
//);
