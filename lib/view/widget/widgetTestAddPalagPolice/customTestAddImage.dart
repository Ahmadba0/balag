// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTestAddImage extends StatelessWidget {
  final void Function()? onPressedCamera;
  final void Function()? onPressedGallery;
  const CustomTestAddImage(
      {super.key, this.onPressedCamera, this.onPressedGallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 4, 45, 95),
          borderRadius: BorderRadius.circular(35),
          border:
              Border.all(color: Color.fromARGB(255, 247, 237, 158), width: 2)),
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const Text(
            "اضغط لإضافة مرفق",
            style: TextStyle(
                color: Color.fromARGB(255, 167, 196, 230), fontSize: 18),
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressedCamera,
              icon: const Icon(Icons.camera_alt_outlined,
                  size: 27, color: Color.fromARGB(255, 247, 237, 158))),
          IconButton(
              onPressed: onPressedGallery,
              icon: const Icon(Icons.photo_camera_back_outlined,
                  size: 27, color: Color.fromARGB(255, 247, 237, 158))),
        ],
      ),
    );
  }
}
