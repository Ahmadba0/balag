// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/profile/profilePage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Curd curd = Curd();
  MyServices myServices = Get.find();
  bool isloading = false;
  List users = [];

  bool offORto = false;
  var img;

  getProfile() async {
    //users.clear();

    var response = await curd.postRequesrt(linkApi.viewProfile, {
      "usersid": myServices.sharedPref.getString("id").toString(),
    });

    if (response["data"] != null) {
      users.addAll(response['data']);
      print("----------");
      print(users);
      print(users[0]['users_name']);
      print("*****");
      print(users[0]['users_image']);
      img = users[0]['users_image'];
      print("---img $img");
    }
    update();
    print(response);
    return response;
  }

  File? myfile;

  addImageGallery() async {
    img = null;
    myfile = null;
    //update();
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    Get.to(() => const ProfilePage());
    print(xfile);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}
    if (myfile == null) {
      Get.to(ProfilePage());
    } else {
      var response = await postRequsetWithFile(
          linkApi.addimgprofile,
          {
            "number": myServices.sharedPref.getString("number"),
          },
          myfile!);
      //Get.to(ProfilePage());
      if (response["status"] == "success") {
        users.clear();
        getProfile();
        ll = true;
        print("--add img");

        Timer(Duration(seconds: 5), () {
          ll = false;
          print("ll $ll");
          update();
        });
      } else {
        print("sss");
      }
    }
  }

  bool ll = false;

  bool lottie = true;

  @override
  void onInit() {
    getProfile();
    Timer(Duration(seconds: 1), () {
      lottie = false;
      update();
      print(lottie);
    });
    print("---img $img");
    super.onInit();
  }
}
