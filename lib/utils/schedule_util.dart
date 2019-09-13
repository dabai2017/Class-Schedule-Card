//获取今天星期几
String get_weekday_str() {
  var weekday = DateTime.now().weekday;

  var hour = DateTime.now().hour;
  var minute = DateTime.now().minute;

  if (int.parse("$hour$minute") > 1930) {
    return "明天";
  }

  switch (weekday) {
    case 1:
      return "星期一";

    case 2:
      return "星期二";

    case 3:
      return "星期三";

    case 4:
      return "星期四";

    case 5:
      return "星期五";

    case 6:
      return "星期六";

    case 7:
      return "星期日\n\n没课";
  }
}

//课程数据maps
List sc = [
  [
    "",
    "网站前台开发技术\n赵欢 [1-15周][3-4节] \n第一机房B区",
    "算法设计\n石慧升 [1-15周][6-7节] \n明德楼-104",
    "大学体育（三）\n段智慧 [1-13周][8-9节]\n操场",
    "Java项目实战——tank大战\n王晨光 [1-15周][11-12节]\n第一机房B区"
  ],
  ["", "网站前台美工\n赵欢 [1-15周][3-4节]\n第一机房B区", "", "", ""],
  [
    "",
    "JavaWeb程序设计\n王晨光 [1-15周][3-5节]\n第一机房A区",
    "算法设计\n石慧升 [1-15 单周][6-7节]\n计算机语言实训室",
    "",
    ""
  ],
  [
    "网站前台开发技术\n赵欢 [1-15周][1-2节]\n第一机房B区",
    "",
    "Java项目实战——tank大战\n王晨光 [1-15周][6-7节]\n第一机房A区",
    "",
    ""
  ],
  ["JavaWeb程序设计\n王晨光 [1-15周][1-2节]\n第一机房A区", "", "", "", ""],
  ["", "网站前台美工\n赵欢 [1-15周][3-4节]\n第一机房A区", "", "", ""],
  ["", "", "", "", ""],
];
