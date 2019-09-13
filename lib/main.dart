import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:class_schedule_card/pages/tabs/Tab01.dart';
import 'package:class_schedule_card/pages/tabs/Tab02.dart';
import 'package:class_schedule_card/pages/tabs/Tab03.dart';
import 'package:class_schedule_card/pages/tabs/Tab04.dart';
import 'package:class_schedule_card/pages/tabs/Tab05.dart';
import 'package:class_schedule_card/pages/tabs/Tab06.dart';
import 'package:class_schedule_card/utils/Toast.dart';
import 'package:class_schedule_card/utils/net_util.dart';
import 'package:class_schedule_card/utils/schedule_util.dart';

main() {
  runApp(MyApp());
}

//写课程表

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final String link = "https://v1.hitokoto.cn";
  String weekstr = "今天${get_weekday_str()}";
  String text = "正在刷新一言数据";

  String text_data;

  var version = "2019-9-13 09:07";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init_data();
  }

  Future init_data() async {
    text_data = await NetUtil("https://v1.hitokoto.cn").getBody();

    if (text_data == "null") {
      setState(() {
        text = "网络出了一点小问题~";
      });
    } else {
      var parsedJson = json.decode(text_data);

      setState(() {
        text = parsedJson["hitokoto"] + "  --${parsedJson["from"]}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: ListView(
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Center(
                  child: Text(
                "版本号: $version",
                style: TextStyle(color: Colors.white54),
              )),
              padding: EdgeInsets.all(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
            child: RaisedButton(
              color: Colors.white,
                child: Text("分享软件给好友"),
                onPressed: () {
                  showAboutDialog(applicationName: "关于课程表",context: context,
                      children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text("扫码下载"),
                      ),
                    ),
                    Share(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "开发者:软件一班冯同学",
                          style: TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ]);
                }),
          ),
          GestureDetector(
            child: Container(
              child: Card(
                  child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: Center(
                  child: Text(
                    weekstr,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
              padding: EdgeInsets.all(10),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(text),
              )),
              padding: EdgeInsets.all(10),
            ),
            onTap: () {
              init_data();
            },
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: text));

              Toast.toast(context,
                  msg: "复制完成", position: ToastPostion.bottom, showTime: 1500);
            },
          ),
        ],
      ),
    );
  }
}

class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Card(
            child: Image.asset("images/downlink.png"),
          ),
        ),
      ),
    );
  }
}
