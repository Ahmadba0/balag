// ignore_for_file: file_names

import 'package:balag/controller/auth/forgetPasswordController.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/view/widget/forgetpassword/customElevatedButtonSigninForgetpassword.dart';
import 'package:balag/view/widget/forgetpassword/customTextFormFieldForgetPassword.dart';
import 'package:balag/view/widget/widgetInfo/customImageinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: Container(
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
        child: ListView(
          children: [
            const SizedBox(height: 15),
            const CustomImageInfo(),
            const SizedBox(height: 20),
            Form(
                key: controller.formState,
                child: CustomTextFormFieldForgetpassword(
                  hint:
                      "                                             رقم الهاتف",
                  icon: const Icon(
                    Icons.phone_android_outlined,
                    color: Color.fromARGB(255, 247, 237, 158),
                  ),
                  myController: controller.phone!,
                  validator: (p0) {
                    return ValidInput(p0!, 10, 10, "number");
                  },
                )),
            const SizedBox(height: 250),
            CustomElevatedButtonForgetpassword(
                text: "التالي",
                onPressed: () {
                  controller.checkEmail();
                })
          ],
        ),
      ),
    );
  }
}
