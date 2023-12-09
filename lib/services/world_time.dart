import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;
  late bool isDayTime;

  WorldTime(this.location, this.flag, this.url);
  Future getTime () async {
    try {
      final response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url')
      );

      Map data = jsonDecode(response.body);
      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      // set the time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
    } catch (e) {
      print('Error caught: $e');
      time = "cannot get time value";
    }
  }
}