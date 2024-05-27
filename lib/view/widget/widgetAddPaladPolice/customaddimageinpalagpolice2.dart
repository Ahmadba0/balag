import 'package:flutter/material.dart';

class CustomAddImageInPalagPolice2 extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAddImageInPalagPolice2({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 120,
      width: 112,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add_a_photo_outlined,
              color: Color.fromARGB(255, 4, 54, 95),
            )),
      ),
    );
  }
}
