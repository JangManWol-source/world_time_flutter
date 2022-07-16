
import 'package:flutter/material.dart';
import 'package:my_app/pages/NinjaID.dart';
import 'package:my_app/pages/choose_location.dart';
import 'package:my_app/pages/loading.dart';
import 'package:my_app/pages/world_time_page.dart';
import 'ninja_card.dart';
import 'package:my_app/ninjas.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/ninjaID': (context) => NinjaID(),
      '/ninjaList': (context) => NinjaLists(),
      '/time' : (context) => WorldTimePage(),
    },
  ));
}


class NinjaLists extends StatefulWidget {
  const NinjaLists({Key? key}) : super(key: key);

  @override
  State<NinjaLists> createState() => _NinjaListsState();
}

class _NinjaListsState extends State<NinjaLists> {

  List<Ninjas> ninjas = [
   Ninjas('ChaoFan', 'The Prince of ChaoLani Island next to Chao Island.'),
    Ninjas('ChaoKing', 'King of all ninjas in Chao Island.'),
    Ninjas('ChaoLing', 'Youngest son of ChaoKing the future King of Chao Island'
        '.'),
  ];

  // Widget ninjaCard(ninja){
  //   return NewWidgetNinja(ninja:ninja);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Ninja List'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: ninjas.map((e) => NewWidgetNinja(
              ninja : e,
              delete: (){
                setState(() {
                  ninjas.remove(e);
                });
              },
          )).toList(),
        ),
      )
    );
  }
}


