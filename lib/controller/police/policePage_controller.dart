// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/police/detailsNEW.dart';
import 'package:get/get.dart';

class PolicePageController extends GetxController {
  Curd crud = Curd();
  MyServices myServices = Get.find();
  var palagId;
  bool isloading = false;
  List datareport = [];

  getReport() async {
    //datareport.clear();
    isloading = true;
    update();
    var response = await crud.postRequesrt(linkApi.getPoliceReport, {
      'id': myServices.sharedPref.getString("id").toString(),
      'type': 'police'
    });
    if (response['status'] == 'sucsses') {
      if (response['data'] != null) {
        datareport.addAll(response['data']);
      } else {
        print("------no Report");
      }
    }
    isloading = false;
    update();
    return response;
  }

  goToDetails() {
    Get.off(() => const TestNew(), arguments: {"palagId": palagId});
    print("---go---$palagId");
  }

  refreshh() {
    datareport.clear();
    getReport();
    update();
  }

  bool lottie = true;
  @override
  void onInit() {
    print("---police page controller created");
    getReport();
    Timer(Duration(seconds: 2), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
