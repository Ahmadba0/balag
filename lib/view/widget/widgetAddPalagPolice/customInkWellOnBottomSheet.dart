/*import 'package:balag/controller/addPalagPolice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInkWellOnBottomSheet extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomInkWellOnBottomSheet(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    AddPalagPoliceController controller = Get.put(AddPalagPoliceController());
    return Container(
      width: Get.width * 0.75,
      height: Get.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Color.fromARGB(255, 4, 45, 95),
      ),
      child: InkWell(
        //
        //
        onTap: onTap,
        //
        //
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
/*

 () async {
          XFile? xfile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          Navigator.of(context).pop();
          controller.myfile == null
              ? Get.to(AddBalagPolice())
              : File(xfile!.path);
          // myfile = File(xfile!.path);

          //setState(() {});
        }

        */*/