import 'package:class_schedule_card/widget/home_page_up_bar.dart';
import 'package:flutter/material.dart';
import 'package:class_schedule_card/pages/tabs/Tab01.dart';
import 'package:class_schedule_card/pages/tabs/Tab02.dart';
import 'package:class_schedule_card/pages/tabs/Tab03.dart';
import 'package:class_schedule_card/pages/tabs/Tab04.dart';
import 'package:class_schedule_card/pages/tabs/Tab05.dart';
import 'package:class_schedule_card/pages/tabs/Tab06.dart';


main() {
  runApp(MyApp());
}

//写课程表

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:"googlesan"
      ),
      title: "课程表",
      home: ScaffoldContent(),
    );
  }
}

class ScaffoldContent extends StatefulWidget {
  @override
  _ScState createState() => _ScState();
}

int count = 0;

class _ScState extends State<ScaffoldContent> {
  List PagesList = [Tab_in(), Tab1(), Tab2(), Tab3(), Tab4(), Tab5(), Tab6()];
  List titles = ["概览", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int _count = DateTime.now().weekday;

    if (_count <= 6) {
      count = _count;
    } else {
      count = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("课程表(软件一班) - ${titles[count]}"),
      ),
      body: PagesList[count],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: count,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in), title: Text("概览")),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one), title: Text("周一")),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two), title: Text("周二")),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), title: Text("周三")),
          BottomNavigationBarItem(icon: Icon(Icons.looks_4), title: Text("周四")),
          BottomNavigationBarItem(icon: Icon(Icons.looks_5), title: Text("周五")),
          BottomNavigationBarItem(icon: Icon(Icons.looks_6), title: Text("周六")),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            count = index;
          });
        },
      ),
    );
  }
}

class Tab_in extends StatefulWidget {
  @override
  _Tab_inState createState() => _Tab_inState();
}

class _Tab_inState extends State<Tab_in> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: HomePage_UpBar()
    );
  }



}

