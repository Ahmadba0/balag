// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomSectionOther extends StatelessWidget {
  final void Function() ontap;
  const CustomSectionOther({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: ontap,
        child: Container(
          margin: const EdgeInsets.all(9),
          height: 200,
          decoration: BoxDecoration(
              /*  gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 50, 97, 177),
                    Color.fromARGB(255, 160, 193, 209),
                    Color.fromARGB(255, 113, 162, 187),
                  ]),*/
              /* borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),*/
              border: Border.all(
                  color: const Color.fromARGB(255, 4, 45, 95), width: 2)),
          child: Image.asset(
            "assets/image/q6.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
