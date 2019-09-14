import 'package:flutter/material.dart';
import 'package:class_schedule_card/utils/schedule_util.dart';


class Tab5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: ListView(children: getListView()),
    );
  }

  List<Widget> getListView() {
    List<Widget> list = new List();

    List data = sc[4];

    for (int i = 0; i < data.length; i++) {
      if (data[i] != "") {
        list.add(Padding(
          padding: EdgeInsets.all(10),
          child: Card(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: Text(
                          data[i],
                          style:TextStyle(fontSize: 16,color: Colors.deepOrange),
                        ),
                      )),
                  Positioned(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Chip(
                            label: Text("${i + 1 == 5 ? "晚自习" : "第${(i + 1)}节课"}")),
                      ))
                ],
              )),
        ));
      } else {
        list.add(Padding(
          padding: EdgeInsets.all(10),
          child: Card(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: Text(
                          "没课",
                          style:TextStyle(fontSize: 20,color: Colors.green),
                        ),
                      )),
                  Positioned(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Chip(
                            label: Text("${i + 1 == 5 ? "晚自习" : "第${(i + 1)}节课"}")),
                      ))
                ],
              )),
        ));
      }
    }

    return list;
  }
}
