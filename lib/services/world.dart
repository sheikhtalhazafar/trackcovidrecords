import 'dart:convert';
import 'package:covidapp/modal/stats.dart';
import 'package:http/http.dart' as http;

class world_data {
  Future<worldstatistics> getstats() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return worldstatistics.fromJson(data);
    } else {
      return worldstatistics.fromJson(data);
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      return data;
      // throw Exception();
    }
  }
}


  // Future<List<dynamic>> countylistapi() async {
  //   var data;
  //   final response =
  //       await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
  //   data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     print(data);
  //     return data;
  //   } else {
  //     throw Exception('error');
  //   }
  // }
