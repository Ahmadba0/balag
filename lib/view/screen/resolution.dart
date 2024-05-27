// ignore_for_file: avoid_unnecessary_containers

import 'package:balag/controller/resolution_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Resoultion extends StatefulWidget {
  const Resoultion({super.key});

  @override
  State<Resoultion> createState() => _ResoultionState();
}

class _ResoultionState extends State<Resoultion> {
  ResolutionController controller = Get.put(ResolutionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "القرارت",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      body: Container(child: GetBuilder<ResolutionController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(8),
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
                      ///
                      ///
                      ...List.generate(
                          controller.resolutiondata.length,
                          (index) => Column(
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      const Text(
                                        " القرار",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 4, 45, 95),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        "نص القرار",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 4, 45, 95),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 247, 237, 158))),
                                    child: Text(
                                      controller.resolutiondata[index]
                                          ['resolution_text'],
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
                                    padding: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 4, 45, 95),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 247, 237, 158))),
                                    child: Text(
                                      controller.resolutiondata[index]
                                          ['resolution_time'],
                                      style: TextStyle(
                                          color: Colors.blue[100],
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    height: 2,
                                    color: const Color.fromARGB(
                                        255, 247, 237, 158),
                                  )
                                ],
                              ))
                    ],
                  ),
          );
        },
      )),
    );
  }
}
