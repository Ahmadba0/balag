import 'package:flutter/material.dart';

class CustomTextFormAddPalagPolice extends StatefulWidget {
  const CustomTextFormAddPalagPolice({super.key});

  @override
  State<CustomTextFormAddPalagPolice> createState() =>
      _CustomTextFormAddPalagPoliceState();
}

class _CustomTextFormAddPalagPoliceState
    extends State<CustomTextFormAddPalagPolice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: TextFormField(
        maxLines: 5,
        minLines: 1,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 4, 54, 95), width: 2),
          ),
        ),
      ),
    );
  }
}
