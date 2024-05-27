// ignore_for_file: unused_local_variable, file_names

import 'package:balag/controller/auth/verifySignupController.dart';
import 'package:balag/view/widget/verifySignup/customEmail.dart';
import 'package:balag/view/widget/verifySignup/customImagever.dart';
import 'package:balag/view/widget/verifySignup/customOTP.dart';
import 'package:balag/view/widget/verifySignup/customResend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodeSignup extends StatefulWidget {
  const VerifyCodeSignup({super.key});

  @override
  State<VerifyCodeSignup> createState() => _VerifyCodeSignupState();
}

class _VerifyCodeSignupState extends State<VerifyCodeSignup> {
  @override
  Widget build(BuildContext context) {
    VerifySignupController controller = Get.put(VerifySignupController());
    return Scaffold(
        body: GetBuilder<VerifySignupController>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 50, 97, 177),
                Color.fromARGB(255, 51, 97, 177),
                Color.fromARGB(255, 160, 193, 209),

                //255,58,56,71
              ]),
        ),
        padding: const EdgeInsets.all(10),
        child: controller.lottie == true
            ? Center(
                child: Lottie.asset("assets/lottie/load2.json",
                    width: 150, height: 150),
              )
            : ListView(
                children: [
                  const SizedBox(height: 25),
                  const CustomImageVer(),
                  const SizedBox(height: 15),
                  CustomEmail(
                      text: "${controller.myServices.sharedPref.get("phone")}"),
                  const SizedBox(height: 15),
                  CustomOTP(
                    onSubmit: (String verificationCode) {
                      controller.gotosuccessPage(verificationCode);
                    },
                  ),
                  const SizedBox(height: 25),
                  Customresend(
                    text1: " :الوقت المتبقي",
                    text2: "${controller.i}",
                    onTap: () {
                      //controller.resend();
                    },
                  ),
                  Customresend(
                    text1: "لم يصل الكود؟ ",
                    text2: "إعادة إرسال",
                    onTap: () {
                      controller.resend();
                    },
                  ),
                  Customresend(
                    text1: "تغيير الرقم؟ ",
                    text2: "الذهاب",
                    onTap: () {
                      controller.deleteandupdate();
                    },
                  ),
                ],
              ),
      ),
    ));
  }
}
