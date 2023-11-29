import 'package:flutter/material.dart';

class MapSituation extends StatelessWidget {
   MapSituation(this.city, {super.key});

  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text('Situation Map'),
        ),
      body:
        Column(
          children: [
            Text('Coordenadas: $city', style: TextStyle(fontSize: 20),)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },

          child: const Icon(Icons.exit_to_app),
        ),
      );
  }
}
