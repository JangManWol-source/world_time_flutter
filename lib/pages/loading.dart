import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_app/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void goToMain() async {
    WorldTime classes = WorldTime(
        url: 'Asia/Manila',
        flag: 'ph.png',
        location: 'Metro Manila');
    await classes.getTime();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/location', arguments: {
        'location': classes.location,
        'time': classes.time,
        'isDayTime': classes.isDayTime,
        'flag': classes.flag,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), opacity: 480,
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  const [
              SpinKitFadingCube(
                color: Colors.lightBlue,
                size: 80,
              ),
              SizedBox(height: 20,),
              Text('World Time App', style: TextStyle(
                fontSize: 35,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),),
              Text('Developed by Joe Cristian Jamis', style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black54
              ),),
              SizedBox(height: 10,),
              Text('Inspired By Net Ninja', style: TextStyle(
                fontWeight: FontWeight.w300,
              ),)
            ],
          ),
        )
    );
  }
}
