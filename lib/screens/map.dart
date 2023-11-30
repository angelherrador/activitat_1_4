import 'package:flutter/material.dart';

class MapSituation extends StatelessWidget {
  const MapSituation(this.city, this.latitude, this.longitude, {super.key});

  final String city;
  final String latitude;
  final String longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Situation Map'),
      ),
      body: Column(
        children: [
          Text(
            'Coordenadas: $city - Lat: $latitude, Lon: $longitude',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
