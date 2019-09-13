import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NetUtil {

  String link = "";
  String data = "";


  NetUtil(String link){
    this.link = link;
  }

  Future<String> getBody() async {
    var response = await http.get(link);
    if (response.statusCode == 200) {
      data = response.body;
      return data;
    } else {
      data = "null";
      return data;
    }
  }


}