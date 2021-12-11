import 'package:flutter/material.dart';
import 'package:qazaccode/course/course_content.dart';
class CoursePreview extends StatefulWidget {
  CoursePreview({
    this.courseTitle,
    this.gradientCourse,
    this.imgRoute,
  });
  static String id = 'dlknsfklnsd';
  final Gradient gradientCourse;
  final String imgRoute;
  final String courseTitle;

  @override
  _CoursePreviewState createState() => _CoursePreviewState();
}

class _CoursePreviewState extends State<CoursePreview>
    with TickerProviderStateMixin {
  List<Tab> tabs;
  List<Widget> pages;
  TabController _controller;
  @override
  void initState() {
    super.initState();
    pages = [
      Course_List(courseName: widget.courseTitle),
    ];
    tabs = [
      Tab(icon: Icon(Icons.book), text: "Курсы",),
      Tab(icon: Icon(Icons.lightbulb_outline), text: "Описание"),
    ];
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: height / 5,
                floating: true,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.keyboard_backspace)),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                          tag: "${widget.courseTitle} + con1",
                          child: Image.asset(
                            widget.imgRoute,
                            width: width / 8,
                          )),
                    ),
                    background: Stack(
                      children: <Widget>[
                        Hero(
                          tag: "${widget.courseTitle} + con",
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: widget.gradientCourse,
                            ),
                          ),
                        ),

                      ],
                    )),
              ),
            ];
          },
        body: SizedBox(child: pages[0],),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: Material(color: Color(0xFF3D3868),child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
