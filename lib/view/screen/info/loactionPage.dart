// ignore_for_file: file_names, avoid_print, unused_local_variable

import 'package:balag/controller/auth/info_controller.dart';
import 'package:balag/controller/auth/location_controller.dart';
import 'package:balag/core/function/alertexitapp.dart';
import 'package:balag/view/widget/widgetLocation/customButtonLocation.dart';
import 'package:balag/view/widget/widgetLocation/customDropDownButton.dart';
import 'package:balag/view/widget/widgetLocation/customImagelocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    InfoController infoController = Get.put(InfoController());
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertexitapp,
            child: GetBuilder<LocationController>(
              builder: (controller) {
                return Container(
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
                  width: double.infinity,
                  //color: Colors.blue,
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  child: controller.lottie == true
                      ? Center(
                          child: Lottie.asset("assets/lottie/load2.json",
                              width: 150, height: 150),
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 35),
                            const CustomImageLocation(),
                            const SizedBox(height: 30),
                            CustomDrop(
                              items: controller.items1,
                              onChanged: (p0) {
                                controller.changeCity(p0);
                                print(p0);
                              },
                              text: "المحافظة",
                              valuee: controller.selectedCity,
                              widgetIcon:
                                  const Icon(Icons.location_city_outlined),
                            ),
                            //
                            //
                            const SizedBox(height: 40),

                            controller.selectedCity == "ريف دمشق"
                                ?
                                //
                                //

                                CustomDrop(
                                    items: controller.refDamas,
                                    onChanged: (p0) {
                                      controller.changeRegion(p0);
                                    },
                                    text: "المنطقة",
                                    valuee: controller.selectedRegion,
                                    widgetIcon: const Icon(
                                        Icons.location_city_outlined),
                                  )
                                //
                                //
                                : controller.selectedCity == "دمشق"
                                    ? CustomDrop(
                                        items: controller.damas,
                                        onChanged: (p0) {
                                          /*setState(() {
                              // selectedRegion = p0;
                            });*/
                                          controller.changeRegion(p0);
                                        },
                                        text: "المنطقة",
                                        valuee: controller.selectedRegion,
                                        widgetIcon: const Icon(
                                            Icons.location_city_outlined),
                                      )
                                    : controller.selectedCity == "حمص"
                                        ? CustomDrop(
                                            items: controller.homs,
                                            onChanged: (p0) {
                                              /* setState(() {
                                  // selectedRegion = p0;
                                });*/
                                              controller.changeRegion(p0);
                                            },
                                            text: "المنطقة",
                                            valuee: controller.selectedRegion,
                                            widgetIcon: const Icon(
                                                Icons.location_city_outlined),
                                          )
                                        : Container(),
                            const SizedBox(height: 100),
                            controller.selectedRegion != null
                                ? CustomButtonLocation(
                                    text: "حفظ",
                                    onPressed: () {
                                      controller.saveLocation();
                                      //controller.getverifycode();
                                    },
                                  )
                                : Container()
                          ],
                        ),
                );
              },
            )));
  }
}
