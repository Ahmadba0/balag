/*import 'package:balag/controller/addPalagPolice_controller.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customButtonLocationAddPalagPolice.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customButtonSendAddPalagPolice.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customaddimageinpalagpolice.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customaddimageinpalagpolice2.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customaddimageinpalagpolice3.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customlocationaddpalagpolice.dart';
import 'package:balag/view/widget/widgetAddPaladPolice/customtextformaddpalagpolice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBalagPolice extends StatefulWidget {
  const AddBalagPolice({super.key});

  @override
  State<AddBalagPolice> createState() => _AddBalagPoliceState();
}

class _AddBalagPoliceState extends State<AddBalagPolice> {
  AddPalagPoliceController controller = Get.put(AddPalagPoliceController());
  @override
  Widget build(BuildContext context) {
    //AddPalagPoliceController controller = Get.put(AddPalagPoliceController());
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text(
          "إضافة شكوى",
          style: TextStyle(
              color: Color.fromARGB(255, 4, 54, 95),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
      ),
      //end app bar
      body: GetBuilder<AddPalagPoliceController>(
        builder: (controller) {
          return ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    //text form field
                    Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          CustomTextFormFieldAddPalagPolice(
                            mycontroller: controller.body!,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                //1
                                //
                                controller.myfile == null
                                    ? CustomAddImageInPalagPolice(
                                        onPressed: () {
                                          controller
                                              .onpressoniconcamera(context);
                                        },
                                      )
                                    : Container(
                                        height: 120,
                                        width: 112,
                                        child: Image.file(
                                          controller.myfile!,
                                          fit: BoxFit.cover,
                                        )),
                                //
                                //2
                                //
                                controller.myfile2 == null
                                    ? CustomAddImageInPalagPolice2(
                                        onPressed: () {
                                          controller.press2 = true;
                                          controller
                                              .onpressoniconcamera2(context);
                                        },
                                      )
                                    : Container(
                                        height: 120,
                                        width: 112,
                                        child: Image.file(
                                          controller.myfile2!,
                                          fit: BoxFit.cover,
                                        )),
                                //
                                //3
                                //
                                controller.myfile3 == null
                                    ? CustomAddImageInPalagPolice3(
                                        onPressed: () {
                                          //
                                          controller.press3 = true;
                                          controller
                                              .onpressoniconcamera3(context);
                                        },
                                      )
                                    : Container(
                                        height: 120,
                                        width: 112,
                                        child: Image.file(
                                          controller.myfile3!,
                                          fit: BoxFit.cover,
                                        )),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15),

                          //زر الموقع
                          controller.isLoading == true
                              ? const CircularProgressIndicator()
                              : controller.currentPosition != null
                                  ? CustomLocationAddPalagPolice(
                                      currentAddress:
                                          controller.currentAddress!)
                                  : CustomButtonLocationAddPalagPolice(
                                      onPressed: () {
                                        controller.getCurrentLocation();
                                      },
                                      text: "تحديد الموقع",
                                    ),
                          //
                          const SizedBox(height: 25),
                          //button send
                          CustomButtonSendAddPalagPolice(
                              onPressed: () async {
                                await controller.addPoliceReport();
                                await controller.addPoliceReportimg2();
                                await controller.addPoliceReportimg3();
                              },
                              text: "إرسال"),
                        ],
                      ),
                    ),
                    //have 3 image
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/