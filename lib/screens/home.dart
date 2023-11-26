import 'package:activitat_1_4/services/zipcode_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String city="";
  String ?longitude;
  String ?latitude;
  String ?state;

  String zipCodeInput="23700";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Postal Code App-'),

      ),
      body:
        Text('City: $city'),
        floatingActionButton: FloatingActionButton(
          onPressed: ()
            async {
              var zipcode = await ZipCodeService().fetchData("23700");

              city = zipcode.places.first.placeName;
              longitude = zipcode.places.first.longitude;
              latitude = zipcode.places.first.latitude;
              state = zipcode.places.first.state;

              debugPrint(city);
              debugPrint(longitude);
              debugPrint(state);
              setState(() {});
            },

            child: const Icon(Icons.refresh),
        ),

    );
  }
}
// void getZipCode(zipCodeInput){
//   ZipCodeService zipCodeService = ZipCodeService();
//   zipCodeService.methodeWithParam(zipCodeInput);
// }
