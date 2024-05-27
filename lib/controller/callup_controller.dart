// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:get/get.dart';

class CallupController extends GetxController {
  Curd curd = Curd();
  MyServices myServices = Get.find();
  bool isloading = false;
  List callupdata = [];
  getCallup() async {
    isloading = true;
    var response = await curd.postRequesrt(linkApi.viewcallup, {
      "callup_phoneuser": myServices.sharedPref.getString("phone"),
    });
    isloading = false;
    if (response['status'] == 'success') {
      callupdata.addAll(response['data']);
      update();
      print(response['data']);
    } else {
      print("some error in get call up data");
    }
  }

  bool lottie = true;

  @override
  void onInit() {
    getCallup();
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
