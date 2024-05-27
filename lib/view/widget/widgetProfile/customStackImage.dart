// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class CustomStackImage extends StatelessWidget {
  const CustomStackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(255, 4, 54, 95),
          ),
          const Positioned(
              top: 150,
              left: 100,
              right: 100,
              child: CircleAvatar(
                radius: 50,
                //backgroundColor: Color.fromARGB(255, 126, 115, 114),
                backgroundImage: AssetImage("assets/image/profile.jpg"),
              ))
        ],
      ),
    );
  }
}
