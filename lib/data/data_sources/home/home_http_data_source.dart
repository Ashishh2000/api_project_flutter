 import 'dart:convert';

import 'package:api_project/data/dto/home_dto.dart';
import 'package:http/http.dart' as http;

import 'package:api_project/data/api_config/api_config.dart';

class HomeHttpDataSource{
  //     Future<Map<String,dynamic>>
  static Future<HomeDto> getUsersData() async{

    final url = Uri.parse(ApiConfig.Users);
    final response = await http.get(url);
    // print(response.body);
   // return jsonDecode(response.body);

    return HomeDto.fromJson(jsonDecode(response.body));
  }

}