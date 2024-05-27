// ignore_for_file: file_names

import 'package:balag/controller/auth/info_controller.dart';
import 'package:balag/core/function/alertexitapp.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:balag/view/widget/widgetInfo/customImageinfo.dart';
import 'package:balag/view/widget/widgetInfo/customTextFormFieldInfo.dart';
import 'package:balag/view/widget/widgetInfoGet/customTextInfoGet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertexitapp,
            child: Container(
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
                  //1
                  const CustomImageInfo(),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Form(
                        key: controller.formState,
                        child: Column(
                          children: [
                            //name
                            CustomTextFormFieldInfo(
                                validator: (p0) =>
                                    ValidInput(p0!, 9, 100, "password"),
                                isnumber: false,
                                mycontroller: controller.name!,
                                labelText:
                                    "الاسم الثلاثي                                                  ",
                                prefixIcon: const Icon(
                                  Icons.person_4_outlined,
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                  color: Color.fromARGB(255, 247, 237, 158),
                                )),
                            const SizedBox(height: 10),
                            //num
                            CustomTextFormFieldInfo(
                                validator: (p0) =>
                                    ValidInput(p0!, 11, 11, "number"),
                                isnumber: true,
                                mycontroller: controller.number!,
                                labelText:
                                    "الرقم الوطني                                                      ",
                                prefixIcon: const Icon(
                                  Icons.format_list_numbered_rtl,
                                  color: Color.fromARGB(255, 247, 237, 158),
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                )),
                            const SizedBox(height: 10),

                            //phone
                            CustomTextFormFieldInfo(
                                validator: (p0) =>
                                    ValidInput(p0!, 10, 10, "number"),
                                isnumber: true,
                                mycontroller: controller.phone!,
                                labelText:
                                    "رقم الهاتف                                                    ",
                                prefixIcon: const Icon(
                                  Icons.phone_android,
                                  color: Color.fromARGB(255, 247, 237, 158),
                                  //color: Color.fromARGB(255, 4, 54, 95),
                                )),
                            const SizedBox(height: 10),
                            //password
                            GetBuilder<InfoController>(
                              builder: (controller) => CustomTextFormFieldInfo(
                                  validator: (p0) =>
                                      ValidInput(p0!, 5, 100, "password"),
                                  obscureText: controller.isshowpassword,
                                  isnumber: false,
                                  mycontroller: controller.password!,
                                  labelText:
                                      "كلمة السر                                                     ",
                                  prefixIcon: IconButton(
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
                                            ))),
                            ),
                            const SizedBox(height: 1),
                            CustomTextInfoGet(
                              text1: "  لديك حساب ؟",
                              text2: "تسجيل الدخول",
                              onTap: () => Get.offAll(() => const InfoGet()),
                            ),
                            const SizedBox(height: 50),
                            //go to location page
                            ElevatedButton(
                              onPressed: () {
                                controller.svaeInfo();
                              },
                              style: ElevatedButton.styleFrom(
                                  // ignore: deprecated_member_use
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 164, 188, 200),
                                      width: 1.5),
                                  // ignore: deprecated_member_use
                                  primary: const Color.fromARGB(255, 4, 45, 95),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 75)),
                              child: const Text(
                                "التالي",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 247, 237, 158)),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )));
  }
}
//const Color.fromARGB(255, 4, 54, 95)
