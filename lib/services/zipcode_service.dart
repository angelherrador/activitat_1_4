import 'package:activitat_1_4/models/zip_code_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ZipCodeService {
  //static const int param = 43001;

  // ZipCodeService();
  // void methodeWithParam(String param) {
    Future<ZipCode> fetchData(String param) async {
      var response = await http.get(Uri.parse(
          'https://api.zippopotam.us/es/$param'));
      //debugPrint(response.body); //para ver en consola los datos
      final zipcode = zipCodeFromJson(response.body);
      return zipcode;
    }
  //}
}