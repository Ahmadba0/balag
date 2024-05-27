// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables, file_names, deprecated_member_use

import 'dart:async';

import 'package:balag/controller/auth/infoGetController.dart';
import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/function/validinput.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:balag/view/screen/profile/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({super.key});

  @override
  State<UpdatePhone> createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
  InfoGetController controller = Get.put(InfoGetController());
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  Curd curd = Curd();
  MyServices myServices = Get.find();
  var phonee;
  bool isloading = false;

  //

  //
  @override
  void initState() {
    super.initState();
    phonee = Get.arguments['phone'];
    //phoneController.text = phonee;
  }

  var id;
  var name;
  var number;
  updatephone() async {
    if (formState.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var response = await curd.postRequesrt(linkApi.updatephone, {
        "usersid": myServices.sharedPref.getString("id"),
        "users_phone": phoneController.text
      });
      if (response['status'] == 'sucsses') {
        id = myServices.sharedPref.getString("id");
        name = myServices.sharedPref.getString("name");
        number = myServices.sharedPref.getString("number");
        myServices.sharedPref.clear();
        myServices.sharedPref.setString("id", id.toString());
        myServices.sharedPref.setString("name", name.toString());
        myServices.sharedPref.setString("number", number.toString());
        myServices.sharedPref.setString("phone", phoneController.text);
        isloading = false;
        Get.offAll(const Home());
        Timer(const Duration(seconds: 1), () {
          Get.to(() => const ProfilePage());
        });
        //
        //myServices.sharedPref.setString("phone", phoneController.text).toString();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 97, 177),
          title: const Text(
            "تعديل الرقم",
            style: TextStyle(
                color: Color.fromARGB(255, 247, 237, 158),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 50,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 50, 97, 177),
                    Color.fromARGB(255, 160, 193, 209),
                    Color.fromARGB(255, 113, 162, 187),
                    Color.fromARGB(255, 50, 97, 177),
                  ]),
              border: Border(
                  top: BorderSide(
                      width: 2, color: Color.fromARGB(255, 247, 237, 158)))),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "ادخل رقم الهاتف الجديد",
                    style: TextStyle(
                        color: Color.fromARGB(255, 247, 237, 158),
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Form(
                key: formState,
                child: TextFormField(
                  validator: (value) =>
                      ValidInput(value!, 10, 10, "phonenumber"),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.phone_iphone_sharp,
                      color: Color.fromARGB(255, 247, 237, 158),
                    ),
                    hintText: phonee,
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 4, 54, 95),
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
                  controller: phoneController,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 247, 237, 158))),
                      primary: const Color.fromARGB(255, 4, 54, 95),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 60)),
                  onPressed: () {
                    updatephone();
                  },
                  child: const Text(
                    "تعديل",
                    style: TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
                  ))
            ],
          ),
        ));
  }
}
