// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomSectionMuni extends StatelessWidget {
  final void Function() ontap;
  const CustomSectionMuni({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      child: InkWell(
        onTap: ontap,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
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
                color: Color.fromARGB(221, 26, 81, 177),
                border: Border.all(
                    color: const Color.fromARGB(255, 247, 237, 158), width: 2),
              ),
              child: Image.asset(
                "assets/image/log102.png",
                color: Color.fromARGB(255, 247, 237, 158),
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            /* const Positioned(
                top: 48,
                left: 175,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 38,
                )),*/
            /*  const Positioned(
                top: 88,
                left: 173,
                child: Text(
                  "البلدية",
                  style: TextStyle(color: Colors.white),
                ))*/
          ],
        ),
      ),
    );
  }
}
