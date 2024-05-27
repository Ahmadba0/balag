// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomSectionPolice extends StatelessWidget {
  final void Function() ontap;
  const CustomSectionPolice({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: ontap,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(9),
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(221, 31, 89, 187),
                border: Border.all(
                    color: const Color.fromARGB(255, 247, 237, 158), width: 2),
              ),
              child: Image.asset(
                "assets/image/103.png",
                fit: BoxFit.contain,
                color: Color.fromARGB(255, 247, 237, 158),
                height: 200,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
