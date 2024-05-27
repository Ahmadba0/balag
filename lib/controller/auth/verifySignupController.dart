// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:math';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/Info.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:get/get.dart';

class VerifySignupController extends GetxController {
  bool isloadingVerifySignup = false;
  Curd curd = Curd();
  String? phone;
  List verifycodesdata = [];
  var verifycode;
  MyServices myServices = Get.find();

  gotosuccessPage(String verifycode) async {
    /* print("---start verify code ");
    isloadingVerifySignup = true;
    update();
    var response = await curd.postRequesrt(linkApi.verifySignup, {
      "phone": myServices.sharedPref.getString("phone"),
      "verifycode": verifycode,
    });
    isloadingVerifySignup = false;
    update();
    if (response["status"] == "success") {
      myServices.sharedPref.setString("step", "3");
      Get.offAll(const InfoGet());
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verifycode note correct");
    }
    print("---end verify code ");*/
    if (int.parse(verifycode) == randomNumber) {
      verifycode = randomNumber.toString();
      var response = await curd.postRequesrt(linkApi.insertVerify, {
        "usersphone": myServices.sharedPref.getString("phone").toString(),
        "users_verify": randomNumber.toString()
      });
      if (response['status'] == 'sucsses') {
        myServices.sharedPref.setString("step", "3");
        Get.offAll(const InfoGet());
        i = -1;
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
    i = 0;
    i = 60;
    /* print("---start resend code ");
    isloadingVerifySignup = true;
    update();
    var response = await curd.postRequesrt(linkApi.resendSignup, {
      "phone": myServices.sharedPref.getString("phone"),
    });
    isloadingVerifySignup = false;
    update();
    if (response["status"] == "success") {
      print("yes");
      getverifycode();
    } else {
      print("no");
    }
    print("---end resend ");*/
    generateRandom();
  }

  /* getverifycode() async {
    verifycodesdata.clear();
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

  Timer? tt;
  var i;
  minn() {
    i = 60;

    tt = Timer.periodic(Duration(seconds: 1), (timer) {
      if (i != -1) {
        i != 0 ? i-- : 0;
        print("i $i");
        update();
      }
    });
  }

  deleteandupdate() async {
    var response = await curd.postRequesrt(linkApi.deleteandupdate,
        {"usersphone": myServices.sharedPref.getString("phone").toString()});
    print(response['status']);
    if (response['status'] == 'sucsses') {
      myServices.sharedPref.clear();
      Get.offAll(() => const Info());
    } else {
      print("error");
    }
  }

  Timer? t;
  bool lottie = true;
  @override
  void onInit() {
    print("---verify code signup controller");
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
