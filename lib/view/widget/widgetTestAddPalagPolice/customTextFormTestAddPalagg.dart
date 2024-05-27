// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextFormTestAddPalag extends StatelessWidget {
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  const CustomTextFormTestAddPalag(
      {super.key, required this.mycontroller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        cursorColor: Color.fromARGB(255, 4, 45, 95),
        style: TextStyle(color: Color.fromARGB(255, 4, 45, 95)),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: validator,
        keyboardType: TextInputType.text,
        controller: mycontroller,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            hintText: "ادرج الشكوى هنا",
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
            ),
            //suffixIcon: const Icon(Icons.abc),
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 4, 54, 95),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                  //color: Color.fromARGB(255, 164, 188, 200)
                  color: Color.fromARGB(255, 167, 196, 230),
                  width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 167, 196, 230), width: 3),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            border: InputBorder.none),
        maxLines: 3,
      ),
    );
  }
}
