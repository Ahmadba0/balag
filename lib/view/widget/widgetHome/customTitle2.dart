// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:balag/view/screen/callup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle2 extends StatelessWidget {
  const CustomTitle2({super.key});

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
          title: const Text("الاستدعاءات"),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 224, 228, 231)),
          trailing: const Icon(
            Icons.policy_outlined,
            color: Color.fromARGB(255, 247, 237, 158),
          ),
          onTap: () => Get.to(() => const CallUp()),
        ),
      ),
    );
  }
}
