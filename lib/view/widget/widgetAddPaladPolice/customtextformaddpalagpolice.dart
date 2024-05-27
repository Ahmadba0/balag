// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomTextFormFieldAddPalagPolice extends StatelessWidget {
  final TextEditingController mycontroller;
  const CustomTextFormFieldAddPalagPolice(
      {super.key, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: TextFormField(
        controller: mycontroller,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 4, 45, 95), width: 2),
          ),
        ),
      ),
    );
  }
}
