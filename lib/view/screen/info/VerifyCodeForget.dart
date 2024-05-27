// ignore_for_file: unused_local_variable, file_names

import 'package:balag/controller/auth/verifyForgetcontroller.dart';
import 'package:balag/view/widget/verifyCodeForget/customEmailForget.dart';
import 'package:balag/view/widget/verifyCodeForget/customOTPForget.dart';
import 'package:balag/view/widget/verifyCodeForget/customResendForget.dart';
import 'package:balag/view/widget/widgetInfo/customImageinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodeForget extends StatefulWidget {
  const VerifyCodeForget({super.key});

  @override
  State<VerifyCodeForget> createState() => _VerifyCodeForgetState();
}

class _VerifyCodeForgetState extends State<VerifyCodeForget> {
  @override
  Widget build(BuildContext context) {
    VerifyForgetController controller = Get.put(VerifyForgetController());
    return Scaffold(
        body: GetBuilder<VerifyForgetController>(
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
                  const CustomImageInfo(),
                  const SizedBox(height: 15),
                  CustomEmailForget(text: controller.phone!),
                  const SizedBox(height: 15),
                  CustomOTPForget(
                    onSubmit: (String verificationCode) {
                      controller.gotoResetPassword(verificationCode);
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomresendForget(
                    text1: " :الوقت المتبقي",
                    text2: "${controller.j}",
                    onTap: () {
                      //controller.resend();
                    },
                  ),
                  CustomresendForget(
                    text1: "لم يصل الكود؟ ",
                    text2: "إعادة إرسال",
                    onTap: () {
                      controller.resend();
                    },
                  ),
                  CustomresendForget(
                    text1: "تغيير الرقم؟ ",
                    text2: "الذهاب",
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
      ),
    ));
  }
}
