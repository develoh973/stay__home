import 'package:dio/dio.dart';

class Https {
  void getHttp(String url) async {
    try {
      Response response = await Dio().get(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
