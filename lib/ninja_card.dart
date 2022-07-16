
import 'package:flutter/material.dart';
import 'package:my_app/ninjas.dart';
class NewWidgetNinja extends StatelessWidget {
  final Ninjas ninja;
  final Function() delete;
  NewWidgetNinja( {required this.ninja, required this.delete} );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(ninja.name, style:
            TextStyle(color: Colors.grey[900]),
            ),
            const SizedBox(height: 10,),
            Text(ninja.description, style:
            TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(height: 8,),
            FlatButton.icon(onPressed: delete, label: const Text('Delete Ninja')
                , icon: const Icon(Icons.delete),)
          ],
        ),
      ),
    );
  }
}