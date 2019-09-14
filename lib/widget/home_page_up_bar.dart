import 'dart:convert';
import 'dart:io';

import 'package:class_schedule_card/utils/Toast.dart';
import 'package:class_schedule_card/utils/schedule_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage_UpBar extends StatefulWidget {
  @override
  _HomePage_UpBarState createState() => _HomePage_UpBarState();
}

class _HomePage_UpBarState extends State<HomePage_UpBar> {



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




    try{

      HttpClient httpClient = new HttpClient();
      HttpClientRequest request=await httpClient.getUrl(Uri.parse("https://v1.hitokoto.cn"));
      request.headers.add("user-agent", "");
      HttpClientResponse response=await request.close();
      text_data=await response.transform(utf8.decoder).join();
      print(response.headers);
      httpClient.close();

      var parsedJson = json.decode(text_data);

      setState(() {
        text = parsedJson["hitokoto"] + "  --${parsedJson["from"]}";
      });


    }catch(e){
      setState(() {
        text = "网络出了一点小问题~ \n异常信息:$e";
      });
    }


  }

  Future _toMyHome() async {
    const url ='https://dabai2017.gitee.io/home/';
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[


        GestureDetector(
          onTap: (){
            showAboutDialog(applicationName: "关于课程表",context: context,
                children: <Widget>[

                  Share(),

                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "开发:软件一班冯同学",
                          style: TextStyle(color: Colors.blue,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ),
                    onTap: _toMyHome,
                  )


                ]
            );
          },
          child: Container(
            child: Center(
                child: Text(
                  "版本号: $version",
                  style: TextStyle(color: Colors.white54,decoration: TextDecoration.underline),
                )),
            padding: EdgeInsets.all(10),
          ),
        ),




        Padding(padding: EdgeInsets.only(top: 20,left: 20),
          child: Text("小提示",style: TextStyle(
              color: Colors.white
          ),),
        ),

        GestureDetector(
          child: Container(
            child: Card(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
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


        Padding(padding: EdgeInsets.only(top: 20,left: 20),
          child: Text("一言",style: TextStyle(
              color: Colors.white
          ),),
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


        Padding(padding: EdgeInsets.only(top: 20,left: 20),
        child: Text("课程时间",style: TextStyle(
          color: Colors.white
        ),),
        ),



GestureDetector(
  child:         Container(
    child: Card(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[



                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Text("上午"),
                  ),
                ),



                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Row(
                      children: <Widget>[
                        Text("第1节课"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(sc_times[0]),

                      ],
                    ),
                  ),
                ),


                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Row(
                      children: <Widget>[
                        Text("第2节课"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(sc_times[1]),

                      ],
                    ),
                  ),
                ),



                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Text("下午"),
                  ),
                ),


                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Row(
                      children: <Widget>[
                        Text("第3节课"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(sc_times[2]),

                      ],
                    ),
                  ),
                ),


                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Row(
                      children: <Widget>[
                        Text("第4节课"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(sc_times[3]),

                      ],
                    ),
                  ),
                ),

                Container(
                  child: Padding(padding: EdgeInsets.all(10),
                    child:   Row(
                      children: <Widget>[
                        Text("晚自习"),
                        SizedBox(
                          width: 30,
                        ),
                        Text("  "+sc_times[4]),

                      ],
                    ),
                  ),
                ),


              ],
            )
        )),
    padding: EdgeInsets.all(10),
  ),

)

      ],
    );
  }
}





class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Center(
          child: Text("扫码下载Android版本"),
        ),

        GestureDetector(

          onTap: _toapp,
          child: Container(
            child: Center(
              child: Card(
                child: Image.asset("images/downlink.png",width: 200,),
              ),
            ),
          ),
        ),


        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Text("扫码使用WEB版本"),
          ),
        ),

        GestureDetector(

          onTap: _toWEB,
          child: Container(
            child: Center(
              child: Card(
                child: Image.asset("images/web.png",width: 200,),
              ),
            ),
          ),
        ),

      ],
    );
  }

  Future _toapp() async {
    const url ='https://www.lanzous.com/b402939';
    if (await canLaunch(url)) {
    await launch(url);
    }else {
    throw 'Could not launch $url';
    }
  }
  Future _toWEB() async {
    const url ='https://dabai2017.gitee.io/class-schedule-card-web/';
    if (await canLaunch(url)) {
    await launch(url);
    }else {
    throw 'Could not launch $url';
    }
  }

}
