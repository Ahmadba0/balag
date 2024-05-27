// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/model/report_model.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/police/PolicePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePalagPolice extends StatefulWidget {
  final body;
  final id;
  final im;
  const UpdatePalagPolice(
      {super.key, required this.body, required this.id, required this.im});

  @override
  State<UpdatePalagPolice> createState() => _UpdatePalagPoliceState();
}

class _UpdatePalagPoliceState extends State<UpdatePalagPolice> {
  TextEditingController body = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  Report reportModel = Report();
  File? im;
  File? myfile;
  Curd curd = Curd();
  UpdatePalagPolice() async {
    if (formstate.currentState!.validate()) {
      print("***********");
      var response;

      if (myfile == null) {
        response = await curd.postRequesrt(linkApi.updatePoliceReport, {
          "report_body": body.text,
          "report_id": widget.id.toString(),
          "imagename": reportModel.policeReportImage
        });
      } else {
        response = await postRequsetWithFile(
            linkApi.updatePoliceReport,
            {
              "report_body": body.text,
              "report_id": widget.id.toString(),
              "imagename": reportModel.policeReportImage
            },
            myfile!);
      }

      if (response!["status"] == "sucsses") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => PolicePage(),
            ),
            (route) => false);
      } else {
        print("===========");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    body.text = widget.body;
    //content.text = widget.content;
    im = widget.im;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formstate,
          child: Column(
            children: [
              TextFormField(
                controller: body,
              ),
              Image.file(im!),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Column(
                          children: [
                            Text("choose image : "),
                            InkWell(
                              onTap: () async {
                                XFile? xfile = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                Navigator.of(context).pop();
                                myfile = File(xfile!.path);
                                setState(() {});
                              },
                              child: Text("camera"),
                            ),
                            InkWell(
                              onTap: () async {
                                XFile? xfile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                Navigator.of(context).pop();
                                myfile = File(xfile!.path);
                                setState(() {});
                              },
                              child: Text("gallery"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        myfile == null ? Colors.blue : Colors.green),
                child: Text("choose image"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await UpdatePalagPolice();
                  },
                  child: Text("UpdatePalagPolice"))
            ],
          ),
        ),
      ),
    );
  }
}
