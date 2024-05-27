// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class CustomImageLocation extends StatelessWidget {
  const CustomImageLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 60, bottom: 30),
      height: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          /* Positioned(
              top: 30,
              left: 140,
              child: Text(
                "بلاغنا",
                style: TextStyle(
                    //color: Color.fromRGBO(255, 78, 105, 90),
                    color: Colors.amber[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              )),*/
          Positioned(
            top: 20,
            left: 31,
            child: Image.asset(
              "assets/image/logofinal.png",
              fit: BoxFit.fill,
              width: 250,
              height: 190,
            ),
          ),
        ],
      ),
    );
  }
}
