// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, avoid_print

import 'dart:async';
import 'dart:math';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/verifyCodeSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var selectedCity;
  var selectedRegion;
  List items1 = [
    "دمشق",
    "ريف دمشق",
    "حمص",
    "حلب",
    "اللاذقية",
    "طرطوس",
    "حماة",
    "ادلب",
    "درعا"
  ];
  List damas = [
    "الصالحية",
    "الحمراء",
    "باب توما",
    "المزة",
    "الحميدية",
    "البرامكة",
    "ركن الدين"
  ];
  List refDamas = [
    "يبرود",
    "النبك",
    "القطيفة",
    "دير عطية",
    "الزبداني",
    "القسطل",
    "قارة",
    "جيرود"
  ];
  List homs = [
    "الدبلان",
    "الحضارة",
    "القصير",
    "باب عمرو",
    "باب سبيع",
    "باب دريب",
    "عكرمة"
  ];
  Curd curd = Curd();
  GlobalKey<FormState> formState = GlobalKey();
  bool isloading = false;
  String? number;
  MyServices myServices = Get.find();
  String? phone;
  List verifycodesdata = [];
  var verifycode;
  bool lottie = true;

  changeCity(var city) {
    selectedCity = null;
    selectedCity = city;
    selectedRegion = null;
    update();
  }

  changeRegion(var region) {
    selectedRegion = region;
    update();
  }

  saveLocation() async {
    print("---start save location");
    isloading = true;
    update();
    var response = await curd.postRequesrt(linkApi.location, {
      "number": myServices.sharedPref.getString("number")!,
      "city": selectedCity,
      "region": selectedRegion,
    });
    isloading = false;
    update();
    if (response['status'] == 'success') {
      Get.off(const VerifyCodeSignup());
      //getverifycode();
      myServices.sharedPref.setString("step", "2");
    } else {
      Get.snackbar(
          "error", "there are some error pleas try sure your location");
    }
    print("---end save location");
  }

  getverifycode() async {
    print("---start verify code in location to verify code");
    var response = await curd.postRequesrt(linkApi.getverifycode, {
      "phone": myServices.sharedPref.getString("phone"),
    });
    if (response['status'] == 'sucsses') {
      verifycodesdata.addAll(response['data']);
      verifycode = verifycodesdata[0]['users_verifycode'];
      Get.snackbar("verify code is ", "$verifycode",
          duration: Duration(seconds: 3));
    } else {
      print("verify code not found click resend");
    }
    print("---start verify code in location to verify code");
  }

  var randomNumber = 0;
  generateRandom() {
    Random random = Random();
    randomNumber = random.nextInt(90000) + 10000;
    print("1randomNumber $randomNumber");
    Timer(Duration(seconds: 2), () {
      Get.snackbar("كود التحقق", "$randomNumber",
          duration: Duration(seconds: 8));
      update();
    });
    Timer(Duration(minutes: 1), () {
      randomNumber = 0;
      print("2randomNumber $randomNumber");
      update();
    });
  }

  @override
  void onInit() {
    print("---location controller");
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
    });
    super.onInit();
  }
}
