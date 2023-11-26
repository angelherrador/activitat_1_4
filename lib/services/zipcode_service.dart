import 'package:activitat_1_4/models/zip_code_model.dart';
import 'package:http/http.dart' as http;

class ZipCodeService {
  late String url;

    Future<ZipCode> fetchData(String zipInput) async {
      // if (int.tryParse(zipInput) != null) {
      //   url='https://api.zippopotam.us/es/ct/$zipInput';
      // } else {
      //   url='https://api.zippopotam.us/es/$zipInput';
      // }

      url='https://api.zippopotam.us/es/$zipInput';
      var response = await http.get(Uri.parse(url));

      //debugPrint(response.body);
      final zipCode = zipCodeFromJson(response.body);
      return zipCode;

    }
  //}
}