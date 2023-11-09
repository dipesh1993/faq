import 'dart:convert';
import 'dart:js_interop';

import 'package:faq_demo_flutter/CommonUtils/ApiClient.dart';
import 'package:faq_demo_flutter/Models/request/AddUpdateDeleteRequest.dart';
import 'package:faq_demo_flutter/Models/response/AddUpdateDeleteResponse.dart';
import 'package:faq_demo_flutter/Models/response/ModuleListResponse.dart';
import 'package:get/get.dart';

import '../Models/response/FaqListResponse.dart';

class FaqController extends GetxController {
  var faqListResponse = FaqListResponse().obs;
  var moduleListResponse = ModuleListResponse().obs;
  var addUpdateDeleteResponse = AddUpdateDeleteResponse().obs;

  Future<FaqListResponse> getFaqList() async {
    var response = await ApiClient().getFaqList();
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print("INSIDE " + jsonMap.toString());

      faqListResponse.value = FaqListResponse.fromJson(jsonMap);
      print("INSIDE " + faqListResponse.value.toString());
    }
    return faqListResponse.value;
  }

  Future<ModuleListResponse> getModuleList() async {
    var response = await ApiClient().getModuleList();
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print("INSIDE Module" + jsonMap.toString());

      moduleListResponse.value = ModuleListResponse.fromJson(jsonMap);
      print("INSIDE Module Response" + moduleListResponse.value.toString());
    }
    return moduleListResponse.value;
  }

  Future<AddUpdateDeleteResponse> deleteFaq(
      AddUpdateDeleteRequest addUpdateDeleteRequest) async {
    print("request is " + json.encode(addUpdateDeleteRequest).toString());
    var response = await ApiClient().addUpdateDelete(addUpdateDeleteRequest);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print("INSIDE delete" + jsonMap.toString());

      addUpdateDeleteResponse.value = AddUpdateDeleteResponse.fromJson(jsonMap);
      print(
          "INSIDE delete Response" + addUpdateDeleteResponse.value.toString());
    }
    return addUpdateDeleteResponse.value;
  }

  Future<AddUpdateDeleteResponse> addNewFaq(
      AddUpdateDeleteRequest addUpdateDeleteRequest) async {
    print("request is " + json.encode(addUpdateDeleteRequest).toString());
    var response = await ApiClient().addUpdateDelete(addUpdateDeleteRequest);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print("INSIDE delete" + jsonMap.toString());

      addUpdateDeleteResponse.value = AddUpdateDeleteResponse.fromJson(jsonMap);
      print(
          "INSIDE delete Response" + addUpdateDeleteResponse.value.toString());
    }
    return addUpdateDeleteResponse.value;
  }
}
