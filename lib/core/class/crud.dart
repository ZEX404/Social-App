// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Error statusCode : ${response.statusCode}");
      }
    } catch (e) {
      print("Error from catch : $e");
    }
  }

  postRequest(String url, Map data) async {
    // await Future.delayed(const Duration(seconds: 3));
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Error statusCode : ${response.statusCode}");
      }
    } catch (e) {
      print("Error from catch : $e");
    }
  }
}
