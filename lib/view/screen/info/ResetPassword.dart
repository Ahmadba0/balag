// ignore_for_file: unused_local_variable, file_names

import 'package:balag/controller/auth/resetPsswordController.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/view/widget/resetPassword/customElevatedButtonResetPass.dart';
import 'package:balag/view/widget/resetPassword/customTextFormFieldResetPass.dart';
import 'package:balag/view/widget/widgetInfo/customImageinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
        body: GetBuilder<ResetPasswordController>(
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
                  const SizedBox(height: 15),
                  const CustomImageInfo(),
                  Form(
                      key: controller.formState,
                      child: GetBuilder<ResetPasswordController>(
                        builder: (controller) => Column(
                          children: [
                            CustomTextFormFieldResetPass(
                              obscureText: controller.isshowpassword,
                              hint:
                                  "                                                كلمة السر",
                              icon: IconButton(
                                  onPressed: () {
                                    controller.showPassword();
                                  },
                                  icon: controller.isshowpassword == true
                                      ? const Icon(
                                          Icons.visibility,
                                          //color: Color.fromARGB(255, 4, 54, 95),
                                          color: Color.fromARGB(
                                              255, 247, 237, 158),
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          //color: Color.fromARGB(255, 4, 54, 95),
                                          color: Color.fromARGB(
                                              255, 247, 237, 158),
                                        )),
                              myController: controller.password!,
                              validator: (p0) =>
                                  ValidInput(p0!, 5, 100, "password"),
                            ),
                            CustomTextFormFieldResetPass(
                              obscureText: controller.isshowpassword1,
                              hint:
                                  "                                                كلمة السر",
                              icon: IconButton(
                                  onPressed: () {
                                    controller.showPassword1();
                                  },
                                  icon: controller.isshowpassword1 == true
                                      ? const Icon(
                                          Icons.visibility,
                                          //color: Color.fromARGB(255, 4, 54, 95),
                                          color: Color.fromARGB(
                                              255, 247, 237, 158),
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          //color: Color.fromARGB(255, 4, 54, 95),
                                          color: Color.fromARGB(
                                              255, 247, 237, 158),
                                        )),
                              myController: controller.re_password!,
                              validator: (p0) =>
                                  ValidInput(p0!, 5, 100, "password"),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 100),
                  CustomElevatedButtonResetPass(
                      text: "حفظ",
                      onPressed: () {
                        controller.resetPassword();
                      })
                ],
              ),
      ),
    ));
  }
}
