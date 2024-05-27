// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOTPForget extends StatelessWidget {
  final void Function(String)? onSubmit;
  const CustomOTPForget({super.key, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OtpTextField(
        autoFocus: true,
        borderRadius: BorderRadius.circular(25),
        enabledBorderColor: const Color.fromARGB(255, 167, 196, 230),
        numberOfFields: 5,
        borderColor: const Color.fromARGB(255, 4, 54, 95),
        cursorColor: const Color.fromARGB(255, 4, 54, 95),
        focusedBorderColor: const Color.fromARGB(255, 4, 54, 95),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        /*onSubmit: (String verificationCode) {
          controller.gotosuccessPage(verificationCode);
        },*/
        onSubmit: onSubmit, // end onSubmit
      ),
    );
  }
}
