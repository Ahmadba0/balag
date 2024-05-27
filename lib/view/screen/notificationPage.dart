// ignore_for_file: unused_local_variable, unused_import, file_names, avoid_unnecessary_containers

import 'package:balag/controller/notification_controller.dart';
import 'package:balag/view/screen/police/detailsNEW.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "الاشعارات",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      body: Container(child: GetBuilder<NotificationController>(
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
                          controller.dataNotification.length,
                          (index) => InkWell(
                                onTap: () {
                                  Get.to(TestNew(), arguments: {
                                    "palagId":
                                        "${controller.dataNotification[index]['notification_reportid']}"
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Text(
                                          " الاشعار",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 247, 237, 158),
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "${index + 1}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 4, 45, 95),
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "عنوان الاشعار",
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
                                        controller.dataNotification[index]
                                            ['notification_title'],
                                        style: TextStyle(
                                            color: Colors.blue[100],
                                            fontSize: 18),
                                      ),
                                    ),
                                    const Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "نص الاشعار",
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
                                        controller.dataNotification[index]
                                            ['notification_body'],
                                        style: TextStyle(
                                            color: Colors.blue[100],
                                            fontSize: 18),
                                      ),
                                    ),
                                    const Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "تاريخ الاشعار",
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
                                        controller.dataNotification[index]
                                            ['notification_time'],
                                        style: TextStyle(
                                            color: Colors.blue[100],
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      height: 2,
                                      color: const Color.fromARGB(
                                          255, 247, 237, 158),
                                    ),
                                  ],
                                ),
                              ))
                    ],
                  ),
          );
        },
      )),
    );
  }
}
