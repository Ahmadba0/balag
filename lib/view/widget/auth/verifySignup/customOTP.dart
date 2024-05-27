import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOTP extends StatelessWidget {
  final void Function(String)? onSubmit;
  const CustomOTP({super.key, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OtpTextField(
        borderRadius: BorderRadius.circular(25),

        enabledBorderColor: Colors.black,
        numberOfFields: 5,
        borderColor: const Color(0xFF512DA8),
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
