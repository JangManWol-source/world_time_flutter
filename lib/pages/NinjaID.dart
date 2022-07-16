
import 'package:flutter/material.dart';

class NinjaID extends StatefulWidget {
  const NinjaID({Key? key}) : super(key: key);

  @override
  State<NinjaID> createState() => _NinjaIDState();
}

class _NinjaIDState extends State<NinjaID> {
  int ninjaLvl = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Ninja Card ID'),
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          ninjaLvl+=1;
        });
      },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/p1.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 50,
              color: Colors.grey.shade200,
            ),
            const Text('NAME', style:
            TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins'
            ),),
            const SizedBox(height: 2,),
            const Text('Jo-Ni-Tian', style:
            TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange,
                fontFamily: 'Poppins'
            ),),
            const SizedBox(height: 4,),
            const Text('Current Ninja Level', style:
            TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins'
            ),),
            const SizedBox(height: 4,),
            Text('Lvl. $ninjaLvl', style:
            const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange,
                fontFamily: 'Poppins'
            ),),
            const SizedBox(height: 30,),
            Row(children: const [
              Icon(
                Icons.email,
                color: Colors.grey,
              ),
              SizedBox(width: 10,),
              Text('jamisjoecristian@gmail.com', style: TextStyle(
                  color: Colors.grey
              ),)
            ],)
          ],
        ),
      ),
    );
  }
}