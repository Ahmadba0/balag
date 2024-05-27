// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:balag/controller/auth/infoGetController.dart';
import 'package:balag/core/function/alertexitapp.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/view/screen/info/Info.dart';
import 'package:balag/view/screen/info/forgetPassword.dart';
import 'package:balag/view/widget/widgetInfoGet/customElevatedButtonInfoGet.dart';
import 'package:balag/view/widget/widgetInfoGet/customImageinfoget.dart';
import 'package:balag/view/widget/widgetInfoGet/customTextFormInfoGet.dart';
import 'package:balag/view/widget/widgetInfoGet/customTextInfoGet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InfoGet extends StatefulWidget {
  const InfoGet({super.key});

  @override
  State<InfoGet> createState() => _InfoGetState();
}

class _InfoGetState extends State<InfoGet> {
  @override
  Widget build(BuildContext context) {
    InfoGetController controller = Get.put(InfoGetController());

    return Scaffold(
        body: WillPopScope(
      onWillPop: alertexitapp,
      child: GetBuilder<InfoGetController>(
        builder: (controller) => controller.lottie == true
            ? Center(
                child: Lottie.asset("assets/lottie/load2.json",
                    width: 150, height: 150),
              )
            : Container(
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
                child: ListView(
                  children: [
                    const SizedBox(height: 25),
                    const CustomImageInfoGet(),
                    Form(
                        key: controller.formState,
                        child: Column(
                          children: [
                            CustomTextFormInfoGet(
                                validator: (p0) =>
                                    ValidInput(p0!, 11, 11, "number"),
                                suffixIcon: const Icon(
                                    Icons.format_list_numbered_rtl_outlined,
                                    color: Color.fromARGB(255, 247, 237, 158)),
                                isnumber: true,
                                text:
                                    "                                               الرقم الوطني",
                                mycontroller: controller.number!),
                            GetBuilder<InfoGetController>(
                              builder: (controller) => CustomTextFormInfoGet(
                                  validator: (p0) =>
                                      ValidInput(p0!, 5, 100, "number"),
                                  obscureText: controller.isshowpassword,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.showPassword();
                                      },
                                      icon: controller.isshowpassword == true
                                          ? const Icon(Icons.visibility,
                                              color: Color.fromARGB(
                                                  255, 247, 237, 158))
                                          : const Icon(Icons.visibility_off,
                                              color: Color.fromARGB(
                                                  255, 247, 237, 158))),
                                  text:
                                      "                                                    كلمة السر",
                                  mycontroller: controller.password!),
                            ),
                            CustomTextInfoGet(
                                text1: "ليس لديك حساب؟ ",
                                text2: "إنشاء حساب",
                                onTap: () => Get.offAll(() => const Info())),
                            CustomTextInfoGet(
                                text1: "هل نسيت كلمة السر؟ ",
                                text2: "إعادة تعيين",
                                onTap: () =>
                                    Get.to(() => const ForgetPassword())),
                            const SizedBox(height: 120),
                            CustomElevatedButtonInfoGet(onPressed: () {
                              controller.isloadinginfoget == true
                                  ? Center(
                                      child: Lottie.asset(
                                          "assets/lottie/load2.json",
                                          width: 200,
                                          height: 200))
                                  :

                                  ///
                                  controller.getInfo();

                              ///
                            })
                          ],
                        ))
                  ],
                ),
              ),
      ),
    ));
  }
}
