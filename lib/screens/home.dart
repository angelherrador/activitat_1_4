
import 'package:activitat_1_4/models/zip_code_model.dart';
import 'package:activitat_1_4/services/zipcode_service.dart';
import 'package:flutter/material.dart';
import 'package:activitat_1_4/screens/map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String city = "";
  String ?longitude;
  String ?latitude;
  String ?state;
  String ?postalCode;

  //String zipCodeInput="23700";

  var zipCodeController = TextEditingController();
  ZipCode? zipCode;

  void clearText() {
    zipCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // void openGoogleMaps(){
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const MapSituation()));
    // }
    return Scaffold(
      appBar: AppBar(
        title:const Text('Postal Code App'),
      ),
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                  width: screenWidth*0.8,
                  child: const Text("Indica el codi postal per trobar la ciutat",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black45,)
                  )
                ),
              SizedBox(
                width:250,
                child: TextField(
                  autofocus: true,
                  onChanged: (zipInput) async {
                      ZipCode? zipCode = await ZipCodeService().fetchData(zipInput);

                      city = zipCode.places.first.placeName;
                      longitude = zipCode.places.first.longitude;
                      latitude = zipCode.places.first.latitude;
                      state = zipCode.places.first.state;
                      postalCode= zipCode.postCode;

                      debugPrint(city);
                      debugPrint(longitude);
                      debugPrint(state);
                      setState(() {});
                    },
                  controller: zipCodeController,
                  decoration: InputDecoration(
                    //prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                          icon: const Icon(Icons.clear,),
                          onPressed: clearText, //zipCodeController.clear,
                    ),
                    border: const OutlineInputBorder(),

                  ),
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              if (postalCode==null)
                 Text("Codi Postal ${zipCodeController.text} no trobat o no existeix!!"),
              if (postalCode != null)
                Text('Codi Postal: $postalCode'),
              if (longitude != null)
                Text('Ciutat: $city', style: const TextStyle(fontSize: 24),),
              if (longitude != null)
                Text('Comunitat: $state'),
              if (longitude != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth*0.1,
                      child: const Icon(Icons.place),),
                    SizedBox(
                        width: screenWidth*0.25,
                        child: const Text('Coordenades:'),),
                    SizedBox(
                      width: screenWidth*0.25,
                        child: Text('Long: $longitude'),),
                    SizedBox(
                      width: screenWidth*0.3,
                        child:Text('Lat: $latitude'),),
                  ],
                ),
              ElevatedButton(
                  onPressed: (){
                    //openGoogleMaps();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapSituation(city)));
                  },
                  child: const Text("Mostrar en Google Maps")
              ),
          ]),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: ()
        //     async {
        //       var zipcode = await ZipCodeService().fetchData("43001");
        //
        //       city = zipcode.places.first.placeName;
        //       longitude = zipcode.places.first.longitude;
        //       latitude = zipcode.places.first.latitude;
        //       state = zipcode.places.first.state;
        //
        //       debugPrint(city);
        //       debugPrint(longitude);
        //       debugPrint(state);
        //       setState(() {});
        //     },
        //
        //     child: const Icon(Icons.refresh),
        // ),
    );
  }
}

