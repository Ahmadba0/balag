// ignore_for_file: unused_local_variable, avoid_print

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/loactionPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  TextEditingController? name;
  TextEditingController? number;
  TextEditingController? phone;
  TextEditingController? password;
  Curd curd = Curd();
  GlobalKey<FormState> formState = GlobalKey();
  bool isloading = false;
  MyServices myServices = Get.find();
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  svaeInfo() async {
    print("---start save info method");
    if (formState.currentState!.validate()) {
      isloading = true;
      update();
      var response = await curd.postRequesrt(linkApi.info, {
        "name": name!.text,
        "number": number!.text,
        "phone": phone!.text,
        "password": password!.text,
      });
      isloading = false;
      update();
      myServices.sharedPref.setString("number", number!.text);
      print(
          "---page info- number is ${myServices.sharedPref.getString("number")}");
      myServices.sharedPref.setString("name", name!.text);
      print(
          "---page info- number is ${myServices.sharedPref.getString("name")}");
      myServices.sharedPref.setString("phone", phone!.text);
      print(
          "---page info- number is ${myServices.sharedPref.getString("phone")}");
      if (response['status'] == 'success') {
        myServices.sharedPref.setString("step", "1");
        Get.off(() => const LocationPage());
      } else {
        Get.snackbar("تنبيه", "الرقم الوطني او رقم الهاتف موجود");
      }
    }
    print("---end save info method");
  }

  String? userid;
  @override
  void onInit() {
    print("---info controller");
    name = TextEditingController();
    number = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
