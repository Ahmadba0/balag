// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables, file_names

import 'dart:async';
import 'dart:math';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/ResetPassword.dart';
import 'package:get/get.dart';

class VerifyForgetController extends GetxController {
  bool isLoading = false;
  Curd curd = Curd();
  String? phone;
  List verifycodesdata = [];
  var verifycode;
  MyServices myServices = Get.find();

  gotoResetPassword(String verifycode) async {
    /* isLoading = true;
    update();
    var response = await curd.postRequesrt(linkApi.verifycodeForget, {
      "phone": phone,
      "verifycode": verifycode,
    });
    isLoading = false;
    update();
    if (response["status"] == "success") {
      Get.off(ResetPassword(), arguments: {"phone": phone});
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verifycode note correct");
    }*/
    if (int.parse(verifycode) == randomNumber) {
      print("1");
      verifycode = randomNumber.toString();
      var response = await curd.postRequesrt(linkApi.insertVerify,
          {"usersphone": phone, "users_verify": randomNumber.toString()});
      print("1");
      randomNumber = 0;
      print(response['status']);
      if (response['status'] == 'sucsses') {
        print("1");

        Get.off(ResetPassword(), arguments: {"phone": phone});
        j = -1;
      } else {
        print("5");
      }
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verifycode note correct");
    }
  }

  resend() async {
    randomNumber = 0;
    j = 0;
    j = 60;
    /* isLoading = true;
    update();
    var response = await curd.postRequesrt(linkApi.resendSignup, {
      "phone": phone,
    });
    isLoading = false;
    update();
    if (response["status"] == "success") {
      print("yes");
    } else {
      print("no");
    }*/
    generateRandom();
  }

  /*getverifycode() async {
    var response = await curd.postRequesrt(linkApi.getverifycode, {
      "phone": phone,
    });
    if (response['status'] == 'sucsses') {
      verifycodesdata.addAll(response['data']);
      verifycode = verifycodesdata[0]['users_verifycode'];
      Get.snackbar("verify code is ", "$verifycode",
          duration: Duration(seconds: 3));
    } else {
      print("verify code not found click resend");
    }
  }*/

  var randomNumber = 0;
  generateRandom() {
    Random random = Random();
    randomNumber = random.nextInt(90000) + 10000;
    print("---------------------------");
    print("1randomNumber $randomNumber");
    print("---------------------------");
    Timer(Duration(seconds: 2), () {
      Get.snackbar("كود التحقق", "$randomNumber",
          duration: Duration(seconds: 8));
      update();
    });
    Timer(Duration(minutes: 1), () {
      randomNumber = 0;
      print("---------------------------");
      print("2randomNumber $randomNumber");
      print("---------------------------");
      update();
    });
  }

  Timer? t;
  var j;
  minn() {
    j = 60;

    t = Timer.periodic(Duration(seconds: 1), (timer) {
      if (j != -1) {
        j != 0 ? j-- : 0;
        print("i $j");
        update();
      }
    });
  }

//38879
//
  bool lottie = true;
  @override
  void onInit() {
    phone = Get.arguments['phone'];
    //getverifycode();
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
      print(lottie);
    });
    generateRandom();
    minn();
    super.onInit();
  }
}
