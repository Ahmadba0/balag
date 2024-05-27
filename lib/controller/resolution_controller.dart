// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:get/get.dart';

class ResolutionController extends GetxController {
  Curd curd = Curd();
  MyServices myServices = Get.find();
  bool isloading = false;
  List resolutiondata = [];
  getresolution() async {
    isloading = true;
    var response = await curd.postRequesrt(linkApi.viewresolution, {});
    isloading = false;
    if (response['status'] == 'success') {
      resolutiondata.addAll(response['data']);
      update();
    } else {
      print("some error in get call up data");
    }
  }

  bool lottie = true;
  @override
  void onInit() {
    getresolution();
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
