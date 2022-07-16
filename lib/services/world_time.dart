
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  late String offsets;
  late String time;
  late String location;
  late String flag;
  late String url;
  late String timeZoneGet;
  late bool isDayTime;
  WorldTime({required this.url, required this
      .flag, required this.location});

  Future<void> getTime() async{
   try{
     // make request from api
     var initial = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
     var response = await http.get(initial);
     Map data = jsonDecode(response.body);

     // get properties from data
     String dateTime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
     String timeZone = data['timezone'];
     String instance = data['utc_offset'];
     //create dateTime object
     DateTime now = DateTime.parse(dateTime);
     now = now.add(Duration(hours: int.parse(offset)));

     time = DateFormat.jm().format(now);
     isDayTime = now.hour > 6 && now.hour < 18 ? true: false;
     timeZoneGet = timeZone;
     offsets = instance;
   }catch(e){
     time = 'No data';
     timeZoneGet = 'No data';
     offsets = 'No data';
   }
  }
}