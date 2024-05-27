// ignore_for_file: file_names

import 'package:balag/core/classes/crud.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/info/VerifyCodeForget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController? phone;
  GlobalKey<FormState> formState = GlobalKey();
  Curd curd = Curd();
  bool isLoading = false;

  checkEmail() async {
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await curd.postRequesrt(
          //email!.text
          linkApi.checkphone,
          {
            "phone": phone!.text,
          });
      if (response['status'] == "success") {
        //  data.addAll(response['data']);
        Get.off(const VerifyCodeForget(), arguments: {"phone": phone!.text});
      } else {
        Get.defaultDialog(title: "Warning", middleText: "phone is not found");
      }
      update();
    } else {
      print("not valid forgetpassword");
    }
  }

  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone!.dispose();
    super.dispose();
  }
}
