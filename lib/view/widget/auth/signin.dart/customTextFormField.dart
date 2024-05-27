import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Widget icon;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  const CustomTextFormField(
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
        validator: validator,
        controller: myController,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
