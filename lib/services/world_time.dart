//import 'dart:js';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime
{
  String url;
  String flag;
  String time;
  String location;
  bool isDayTime;
  bool isError;

  WorldTime({this.location,this.flag,this.url});


  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime=(now.hour>6 && now.hour<20 )? true : false;

      time = DateFormat.jm().format(now);
      isError=false;
      //print('$now');
    }
    catch(e)
    {
      //Navigator.pushReplacementNamed(context, '/location');
      isError=true;

      print("Error occured");
      time='Could not load time';
    }


  }
}