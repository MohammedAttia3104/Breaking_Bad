import 'package:breakingbad/Data/models/characters.dart';
import 'package:breakingbad/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, //60 seconds
      receiveTimeout: 60 * 1000, //60 seconds
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
