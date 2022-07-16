

import 'package:flutter/material.dart';
import 'package:my_app/services/world_time.dart';

class WorldTimePage extends StatefulWidget {
  const WorldTimePage({Key? key}) : super(key: key);

  @override
  State<WorldTimePage> createState() => _WorldTimePageState();
}

class _WorldTimePageState extends State<WorldTimePage> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'shanghai'
        '.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore'
        '.png'),
    WorldTime(url: 'Asia/Taipei', location: 'Taipei', flag: 'taipei.png'),
    WorldTime(url: 'Asia/Brunei', location: 'Brunei', flag: 'brunei.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'bangkok.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(url: 'Asia/Manila', location: 'Metro Manila', flag: 'ph'
        '.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homeScreen
   if(!mounted) return;
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'flag' : instance.flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: Hero(
                tag: '-img${locations[index].flag}',
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}'
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
