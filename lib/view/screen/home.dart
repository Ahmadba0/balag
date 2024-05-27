// ignore_for_file: sized_box_for_whitespace, unused_local_variable

import 'package:balag/controller/home_controller.dart';
import 'package:balag/core/function/alertexitapp.dart';
import 'package:balag/view/screen/muni/MuniPage.dart';
import 'package:balag/view/screen/police/PolicePage.dart';
import 'package:balag/view/widget/widgetHome/custom.dart';
import 'package:balag/view/widget/widgetHome/customSectionMuni.dart';
import 'package:balag/view/widget/widgetHome/customSectionPolice.dart';
import 'package:balag/view/widget/widgetHome/customTitle1.dart';
import 'package:balag/view/widget/widgetHome/customTitle2.dart';
import 'package:balag/view/widget/widgetHome/customTitle3.dart';
import 'package:balag/view/widget/widgetHome/customTitle4.dart';
import 'package:balag/view/widget/widgetHome/custompositionedForLogOut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return WillPopScope(
        onWillPop: alertexitapp,
        child: GetBuilder<HomeController>(
          builder: (controller) => controller.lottie == true
              ? Scaffold(
                  body: Center(
                    child: Lottie.asset("assets/lottie/load2.json",
                        width: 150, height: 150),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color.fromARGB(221, 26, 81, 177),
                    title: const Text(
                      "الرئيسية",
                      style: TextStyle(
                          color: Color.fromARGB(255, 247, 237, 158),
                          fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                    elevation: 50,
                    iconTheme: const IconThemeData(
                        color: Color.fromARGB(255, 247, 237, 158)),
                  ),

                  ///
                  ///

                  drawer: Drawer(
                    child: Container(
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
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CustomUserAccount(
                                  text1:
                                      "${controller.myServices.sharedPref.getString("name")}",
                                  text2:
                                      "${controller.myServices.sharedPref.getString("phone")}"),
                              CustomPositionedLogOut(
                                onpress: () => controller.logout(),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomTitle1(),
                          const SizedBox(height: 10),
                          const CustomTitle2(),
                          const SizedBox(height: 10),
                          const CustomTitle3(),
                          const SizedBox(height: 10),
                          const CustomTitle4(),
                        ],
                      ),
                    ),
                  ),

                  ///
                  ///

                  body: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color.fromARGB(255, 247, 237, 158))),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 160, 193, 209),
                              Color.fromARGB(255, 50, 97, 177),
                              Color.fromARGB(255, 160, 193, 209),
                              Color.fromARGB(255, 50, 97, 177),
                              // Color.fromARGB(255, 160, 193, 209),
                            ]),
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(
                        child: ListView(
                          children: [
                            SizedBox(height: 50),
                            CustomSectionPolice(
                              ontap: () => Get.to(() => const PolicePage()),
                            ),
                            SizedBox(height: 25),
                            CustomSectionMuni(
                              ontap: () => Get.to(() => const MuniPage()),
                            ),
                            /*CustomSectionOther(
                                ontap: () => Get.to(() => const OthersPage())),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
