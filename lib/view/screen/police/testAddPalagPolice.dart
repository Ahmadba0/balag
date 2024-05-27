// ignore_for_file: unused_local_variable, file_names, deprecated_member_use, avoid_print

import 'dart:async';

import 'package:balag/controller/police/addPalagPolice_Controller.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/view/widget/widgetLocation/customDropDownButton.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customButtonSendAddPalag.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customInkButtonMoreInfo.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customLocationAddPalag.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customTestAddImage.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customTextFormMoreInfo.dart';
import 'package:balag/view/widget/widgetTestAddPalagPolice/customTextFormTestAddPalagg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    AddPalagPoliceController controller = Get.put(AddPalagPoliceController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 17, 68, 155),
          title: const Text(
            "الشرطة",
            style: TextStyle(
                color: Color.fromARGB(255, 247, 237, 158),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 50,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
        ),
        body: GetBuilder<AddPalagPoliceController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 50, 97, 177),
                      Color.fromARGB(255, 160, 193, 209),
                      Color.fromARGB(255, 113, 162, 187),
                    ]),
              ),
              child: controller.lottie == true
                  ? Center(
                      child: Lottie.asset("assets/lottie/load2.json",
                          width: 150, height: 150, animate: true),
                    )
                  : ListView(
                      children: [
                        Form(
                            key: controller.formState,
                            child: Column(
                              children: [
                                //حقل
                                CustomTextFormTestAddPalag(
                                  mycontroller: controller.body!,
                                  validator: (p0) =>
                                      ValidInput(p0!, 10, 100, "password"),
                                ),
                                //عرض الصور
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: controller.myfile == null
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: controller.myfile3 != null
                                                  ? 3
                                                  : controller.myfile2 != null
                                                      ? 2
                                                      : 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2,
                                                        color: const Color
                                                                .fromARGB(255,
                                                            247, 237, 158))),
                                                height: 150,
                                                margin: const EdgeInsets.all(2),
                                                child: controller.myfile != null
                                                    ? Image.file(
                                                        controller.myfile!,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                            controller.myfile2 != null
                                                ? Expanded(
                                                    flex: controller.myfile3 !=
                                                            null
                                                        ? 3
                                                        : 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  247,
                                                                  237,
                                                                  158))),
                                                      height: 150,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              2),
                                                      width: Get.width * 0.29,
                                                      child: controller
                                                                  .myfile2 !=
                                                              null
                                                          ? Image.file(
                                                              controller
                                                                  .myfile2!,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : null,
                                                    ),
                                                  )
                                                : Container(),
                                            controller.myfile3 != null
                                                ? Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  247,
                                                                  237,
                                                                  158))),
                                                      height: 150,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              2),
                                                      width: Get.width * 0.29,
                                                      child: controller
                                                                  .myfile3 !=
                                                              null
                                                          ? Image.file(
                                                              controller
                                                                  .myfile3!,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : null,
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                ),
                                //مرفقات
                                controller.count == 3
                                    ? Container()
                                    : CustomTestAddImage(
                                        onPressedCamera: () =>
                                            controller.addImageCamera(),
                                        onPressedGallery: () =>
                                            controller.addImageGallery()),
                                //موقع
                                controller.loc == true
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        color: Color.fromARGB(255, 4, 45, 95),
                                      ))
                                    : CustomLocationAddPALAG(
                                        a: controller.currentAddress,
                                        b: controller.currentAddress,
                                        onpressed: () {
                                          //controller.locationButton();
                                          Get.defaultDialog(
                                              backgroundColor: Colors.grey[200],
                                              title:
                                                  "هل تريد ادخال معلوماتك يدوياً أم GPS",
                                              content: const Icon(
                                                Icons.location_on_outlined,
                                                color: Color.fromARGB(
                                                    255, 4, 45, 95),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: const Color
                                                                    .fromARGB(
                                                                255,
                                                                4,
                                                                45,
                                                                95)),
                                                    onPressed: () {
                                                      /*controller.getCurrentLocation();*/
                                                      Get.back();
                                                      controller.loc = true;
                                                      setState(() {});
                                                      Timer(
                                                          Duration(seconds: 1),
                                                          () {
                                                        controller.loc = false;
                                                        controller
                                                                .currentAddress =
                                                            'دير عطية';
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: const Text("GPS",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: const Color
                                                                    .fromARGB(
                                                                255,
                                                                4,
                                                                45,
                                                                95)),
                                                    onPressed: () {
                                                      controller
                                                          .changeHandLocation();
                                                      Get.back();
                                                    },
                                                    child: const Text("يدوياَ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                              ]);
                                        },
                                      ),
                                const SizedBox(height: 10),
                                controller.showHandLocation == true
                                    ? Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            CustomDrop(
                                              items: controller.items1,
                                              onChanged: (p0) {
                                                controller.changeCity(p0);
                                                print(p0);
                                              },
                                              text: "المحافظة",
                                              valuee: controller.selectedCity,
                                              widgetIcon: const Icon(
                                                  Icons.location_city_outlined),
                                            ),
                                            const SizedBox(height: 20),
                                            controller.selectedCity ==
                                                    "ريف دمشق"
                                                ? CustomDrop(
                                                    items: controller.refDamas,
                                                    onChanged: (p0) {
                                                      controller
                                                          .changeRegion(p0);
                                                    },
                                                    text: "المنطقة",
                                                    valuee: controller
                                                        .currentAddress,
                                                    widgetIcon: const Icon(Icons
                                                        .location_city_outlined),
                                                  )
                                                : controller.selectedCity ==
                                                        "دمشق"
                                                    ? CustomDrop(
                                                        items: controller.damas,
                                                        onChanged: (p0) {
                                                          controller
                                                              .changeRegion(p0);
                                                        },
                                                        text: "المنطقة",
                                                        valuee: controller
                                                            .currentAddress,
                                                        widgetIcon: const Icon(Icons
                                                            .location_city_outlined),
                                                      )
                                                    : controller.selectedCity ==
                                                            "حمص"
                                                        ? CustomDrop(
                                                            items:
                                                                controller.homs,
                                                            onChanged: (p0) {
                                                              controller
                                                                  .changeRegion(
                                                                      p0);
                                                            },
                                                            text: "المنطقة",
                                                            valuee: controller
                                                                .currentAddress,
                                                            widgetIcon:
                                                                const Icon(Icons
                                                                    .location_city_outlined),
                                                          )
                                                        : Container(),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                //زؤ معلومات اضافية
                                controller.currentAddress == null
                                    ? Container()
                                    : CustomInkButtonMoreInfo(onTap: () {
                                        controller.changeMoreInformation();
                                      }),

                                //حقل لاضافة المعلومات
                                controller.moreInformation == false
                                    ? Container()
                                    : CustomTextFormMoreInfo(
                                        mycontrollerl: controller
                                            .moreInformationController!),
                                //زر
                                CustomButtonSendAddPalag(onPressed: () async {
                                  await controller.addPoliceReport();
                                  controller.press2 == true
                                      ? await controller.addPoliceReportimg2()
                                      : null;
                                  controller.press3 == true
                                      ? await controller.addPoliceReportimg3()
                                      : null;
                                }),
                              ],
                            ))
                      ],
                    ),
            );
          },
        ));
  }
}
