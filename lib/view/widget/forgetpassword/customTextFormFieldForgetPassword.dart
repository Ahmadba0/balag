// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextFormFieldForgetpassword extends StatelessWidget {
  final String hint;
  final Widget icon;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  const CustomTextFormFieldForgetpassword(
      {super.key,
      required this.hint,
      required this.icon,
      required this.myController,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: const Color.fromARGB(255, 4, 54, 95),
        style: const TextStyle(
          color: Color.fromARGB(255, 167, 196, 230),
          decoration: TextDecoration.none,
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: validator,
        controller: myController,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          suffixIcon: icon,
          labelText: hint,
          labelStyle: const TextStyle(
            //color: Color.fromARGB(255, 4, 54, 95),
            color: Color.fromARGB(255, 167, 196, 230),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                //color: Color.fromARGB(255, 164, 188, 200)
                color: Color.fromARGB(255, 167, 196, 230),
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 4, 54, 95), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
