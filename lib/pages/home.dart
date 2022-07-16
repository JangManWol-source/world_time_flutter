import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/ninjaID');
          }, icon: const Icon(Icons.person),
            label: const Text('My Ninja ID'),
          ),
          FlatButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/ninjaList');
          }, icon: const Icon(Icons.list),
            label: const Text('List of Ninjas'),),
        ],
      ),
    );
  }
}
