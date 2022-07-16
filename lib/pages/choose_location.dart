
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int count = 0;
  Map data = {};
  @override
  Widget build(BuildContext context) {

    //check if empty use data route
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments
    as Map;
    String flag = data['flag'];
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    Color txtColor = data['isDayTime'] ? Colors.black54 : Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child:
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 100, 10, 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Hero(
                          tag: '-img$flag',
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/$flag'),
                            radius: 40,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(data['location'], style: TextStyle(
                            fontSize: 20,
                            color: txtColor,
                            fontWeight: FontWeight.w300
                        ),),
                        const Divider(height: 10),
                        Text(data['time'], style: TextStyle(
                          fontSize: 70,
                          color: txtColor,

                        ),)
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context,
                              '/time');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDayTime': result['isDayTime'],
                              'flag' : result['flag']
                            };
                          });
                        }, icon: const Icon(Icons.edit_location, color:
                        Colors.white,), label:
                        const Text('Change Location', style: TextStyle(
                          color: Colors.white
                        ),)),
                        ElevatedButton.icon(onPressed: () async {
                          Navigator.pushNamed(context,
                              '/home');
                        }, icon: const Icon(Icons.menu_open, color:
                        Colors.white,), label:
                        const Text('Other features', style: TextStyle(
                            color: Colors.white
                        ),)),
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
