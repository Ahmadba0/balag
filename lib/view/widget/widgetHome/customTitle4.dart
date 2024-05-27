// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:balag/view/screen/notificationPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle4 extends StatelessWidget {
  const CustomTitle4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
            border:
                Border.all(color: const Color.fromARGB(255, 247, 237, 158))),
        child: ListTile(
          title: const Text("الإشعارات"),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 224, 228, 231)),
          trailing: const Icon(
            Icons.notifications_active_outlined,
            color: Color.fromARGB(255, 247, 237, 158),
          ),
          onTap: () => Get.to(() => const NotificationPage()),
        ),
      ),
    );
  }
}
