// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, file_names

import 'dart:async';
import 'dart:io';
import 'package:balag/view/screen/muni/MuniPage.dart';
import 'package:balag/view/screen/muni/testAddPalagMuni.dart';
import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddPalagMuniController extends GetxController {
  //var
  bool loc = false;

  File? myfile;
  File? myfile2;
  File? myfile3;
  bool press2 = false;
  bool press3 = false;
  Position? currentPosition;
  var currentAddress;
  bool isLoading = false;
  TextEditingController? body;
  TextEditingController? moreInformationController;
  GlobalKey<FormState> formState = GlobalKey();
  MyServices myServices = Get.find();
  Curd curd = Curd();
  int count = 0;
  //drop down location
  List items1 = ["دمشق", "ريف دمشق", "حمص"];
  List damas = ["الصالحية", "الحمراء", "باب توما"];
  List refDamas = ["يبرود", "النبك", "القطيفة"];
  List homs = ["الدبلان", "الحضارة"];
  var selectedCity;
  //var selectedRegion;
  bool showHandLocation = false;

  changeHandLocation() {
    if (showHandLocation == false) {
      showHandLocation = true;
      print(showHandLocation);
      update();
    } else {
      showHandLocation = false;
      print(showHandLocation);
      update();
    }
  }

  changeCity(var city) {
    selectedCity = null;
    selectedCity = city;
    currentAddress = null;
    print(selectedCity);
    update();
  }

  changeRegion(var region) {
    currentAddress = region;
    print(currentAddress);
    update();
  }

  //السماحية
  Future getPosition() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    print("---services $services");
    LocationPermission per;
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLong();
      }
    }
  }

  //lat anf long
  getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  //lat and lang
  getCurrentLocation() {
    print("getCurrentLocation");
    isLoading = true;
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      update();
      print(position.latitude);
      print(position.longitude);
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
    isLoading = false;
  }

  //current address
  getAddressFromLatLng() async {
    print("getAddressFromLatLng");
    isLoading = true;
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      Placemark place = p[0];

      currentAddress = "${place.locality}";
      print("currentAddress $currentAddress");
      update();
    } catch (e) {
      print(e);
    }
    isLoading = false;
  }

  var s;
  addPoliceReport() async {
    print("---start add report police");
    print("1");
    if (myfile == null) {
      print("---add with out image 1");
      print("2");
      return Get.snackbar("Worning", "You should select one image at least",
          duration: const Duration(milliseconds: 5),
          icon: const Icon(
            Icons.warning_amber_sharp,
            color: Colors.red,
          ));
    } else {
      print("---add with image 1");
      print("3");
      if (formState.currentState!.validate()) {
        print("4");
        var response = await postRequsetWithFile(
            linkApi.addPoliceReport,
            {
              "policeReport_body": body!.text,
              "policeReport_location": currentAddress,
              "policeReport_moreInformation": moreInformationController!.text,
              "policeReport_type": "muni",
              "policeReport_user":
                  myServices.sharedPref.getString("id").toString()
            },
            myfile!);
        s = body!.text;
        print("5");
        if (response["status"] == "success") {
          Get.offAll(() => const Home());
          Timer(const Duration(seconds: 2), () {
            Get.to(() => const MuniPage());
          });
        }
      }
    }
    print("---end add report police");
  }

  addPoliceReportimg2() async {
    print("---start add with image 2");
    print("---add with image 2");
    if (press2 == true) {
      print("----------press2---------");

      var response = await postRequsetWithFile(
          linkApi.addImageTwoToReport,
          {
            "policeReport_body": s,
          },
          myfile2!);
      if (response["status"] == "success") {
        print("---successful add image 2");
      }
    } else {
      print("---not successful add image 2");
    }
    print("---end add with image 2");
  }

  addPoliceReportimg3() async {
    print("---start add with image 3");
    print("---add with image 3");
    if (press3 == true) {
      print("----------press3---------");

      var response = await postRequsetWithFile(
          linkApi.addImageThreeToReport,
          {
            "policeReport_body": s,
          },
          myfile3!);
      print("------------3");
      if (response["status"] == "success") {
        print("---successful add image 3");
      }
    } else {
      print("---not successful add image 3");
    }
    print("---end add with image 3");
  }

  addImageCamera() async {
    if (count == 0) {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile = File(xfile.path);
      } else {}
      //myfile = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile);
      xfile != null ? count = 1 : count = 0;
      print(count);
      //setState(() {});
    } else if (count == 1) {
      press2 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile2 = File(xfile.path);
      } else {}
      //myfile2 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile2);
      xfile != null ? count = 2 : count = 1;
      print(count);
      //setState(() {});
    } else if (count == 2) {
      press3 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile3 = File(xfile.path);
      } else {}
      //myfile3 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile3);
      xfile != null ? count = 3 : count = 2;
      print(count);
      //setState(() {});
    }
  }

  addImageGallery() async {
    if (count == 0) {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile = File(xfile.path);
      } else {}
      //myfile = File(xfile!.path);

      update();
      //setState(() {});
      print(myfile);
      xfile != null ? count = 1 : count = 0;
      print(count);
      //setState(() {});
    } else if (count == 1) {
      press2 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile2 = File(xfile.path);
      } else {}
      //myfile2 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile2);
      xfile != null ? count = 2 : count = 1;
      print(count);
      //setState(() {});
    } else if (count == 2) {
      press3 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      Get.to(() => const TestMuni());
      print(xfile);
      if (xfile != null) {
        myfile3 = File(xfile.path);
      } else {}
      //myfile3 = File(xfile!.path);
      update();
      print(myfile3);
      xfile != null ? count = 3 : count = 2;
      print(count);
    }
  }

  locationButton() {
    isLoading == true
        ? Lottie.asset("assets/lottie/load1.json")
        : getCurrentLocation();
  }

  bool moreInformation = false;
  //قيمة تتغير مشان يعرض حقل  ونكتب معلومات اضافية
  changeMoreInformation() {
    if (moreInformation == false) {
      moreInformation = true;
      update();
    } else {
      moreInformation = false;
      update();
    }
    update();
    print("moreInformation $moreInformation");
    return moreInformation;
  }

  //On
  bool lottie = true;
  @override
  void onInit() {
    print("controller add in muni");
    //getPosition();
    body = TextEditingController();
    moreInformationController = TextEditingController();
    Timer(const Duration(seconds: 2), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}


  //end drop down location

  //method
/*
  ontapOnInkWellInBottonSheetCamera(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile = File(xfile!.path);
    update();
    print(myfile);
    //setState(() {});
  }
*/ /*
  ontapOnInkWellInBottonSheetCamera2(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile2 = File(xfile!.path);
    update();
    print(myfile2);
    //setState(() {});
  }
*/ /*
  ontapOnInkWellInBottonSheetCamera3(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile3 = File(xfile!.path);
    update();
    print(myfile3);
    //setState(() {});
  }
*/
/////should repeat
  /*
  ontapOnInkWellInBottonSheetGallery() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Navigator.of(context).pop();
    Get.back();
    myfile == null ? Get.to(const AddBalagPolice()) : File(xfile!.path);
    // setState(() {});
    update();
  }
*/ /*
  onpressoniconcamera(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/ /*
  onpressoniconcamera2(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera2(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/ /*
  onpressoniconcamera3(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera3(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/