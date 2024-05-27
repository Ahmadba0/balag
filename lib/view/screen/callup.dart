// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:balag/controller/callup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CallUp extends StatefulWidget {
  const CallUp({super.key});

  @override
  State<CallUp> createState() => _CallUpState();
}

class _CallUpState extends State<CallUp> {
  CallupController controller = Get.put(CallupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "الاستدعاءات",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      body: Container(child: GetBuilder<CallupController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 50, 97, 177),
                      Color.fromARGB(255, 160, 193, 209),
                      Color.fromARGB(255, 113, 162, 187),
                      Color.fromARGB(255, 50, 97, 177),
                    ]),
                border: Border(
                    top: BorderSide(
                        width: 2, color: Color.fromARGB(255, 247, 237, 158)))),
            child: controller.lottie == true
                ? Center(
                    child: Lottie.asset("assets/lottie/load2.json",
                        width: 150, height: 150),
                  )
                : ListView(
                    children: [
                      ...List.generate(
                          controller.callupdata.length,
                          (index) => Column(
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        " الاستدعاء",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 4, 45, 95),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        "نص الاستدعاء",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerRight,
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 4, 45, 95),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    child: Text(
                                      controller.callupdata[index]
                                          ['callup_text'],
                                      style: TextStyle(
                                          color: Colors.blue[100],
                                          fontSize: 18),
                                    ),
                                  ),
                                  const Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        "التاريخ",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerRight,
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 4, 45, 95),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    child: Text(
                                      controller.callupdata[index]
                                          ['callup_time'],
                                      style: TextStyle(
                                          color: Colors.blue[100],
                                          fontSize: 18),
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        "المركز",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),

                                  ///
                                  ///
                                  //
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerRight,
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 4, 45, 95),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    child: Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          controller.callupdata[index]
                                              ['callup_centercity'],
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "  /  ",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        ),
                                        Text(
                                          controller.callupdata[index]
                                              ['callup_centerregion'],
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "  /  ",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        ),
                                        Text(
                                          controller.callupdata[index]
                                                      ['callup_centertype'] ==
                                                  "police"
                                              ? "الشرطة"
                                              : controller.callupdata[index][
                                                          'callup_centertype'] ==
                                                      "muni"
                                                  ? "الإدارة المحلية"
                                                  : "",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    height: 2,
                                    color: Color.fromARGB(255, 247, 237, 158),
                                  )
                                ],
                              )),
                    ],
                  ),
          );
        },
      )),
    );
  }
}
