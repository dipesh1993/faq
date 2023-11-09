import 'dart:convert';

import 'package:faq_demo_flutter/Models/request/AddUpdateDeleteRequest.dart';
import 'package:http/http.dart' as http;

import 'Constants.dart';

class ApiClient {
  Future<http.Response> getFaqList() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response =
        await http.get(Uri.parse('$baseUrl/FAQGetList'), headers: headers);
    print("TAG " + response.body);
    return response;
  }

  Future<http.Response> getModuleList() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response =
        await http.get(Uri.parse('$baseUrl/ModuleList'), headers: headers);
    print("TAG " + response.body);
    return response;
  }

  Future<http.Response> addUpdateDelete(
      AddUpdateDeleteRequest addUpdateDeleteRequest) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response = await http.post(Uri.parse('$baseUrl/FAQSave'),
        headers: headers, body: jsonEncode(addUpdateDeleteRequest.toJson()));
    print("TAG " + response.body);
    return response;
  }

// Future<http.Response> saveFaqList(http.Request request) async {
//   Map<String, String> headers = {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json'
//   };
//   var response = await http.post(Uri.parse(baseUrl),
//       headers: headers, body: jsonEncode(request.toJson()));
//
//   return response;
// }
}
