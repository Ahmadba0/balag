// ignore_for_file: unused_local_variable

import 'package:balag/controller/main_controller.dart';
import 'package:balag/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/servises.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: routes,
      //home: TestNew(),
    );
  }
}


//Color.fromARGB(255, 4, 54, 95)
//gold 255, 247, 237, 158

/*

Get.defaultDialog(
                          backgroundColor: Colors.blue[100],
                          titleStyle:
                              TextStyle(color: Color.fromARGB(255, 4, 45, 95)),
                          title: "تأكيد تغير الموقع",
                          content: Text(""),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 4, 45, 95),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 247, 237, 158))),
                                onPressed: () => Get.back(),
                                child: Text(
                                  "لا",
                                  style: TextStyle(color: Colors.blue[100]),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 4, 45, 95),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 247, 237, 158))),
                                onPressed: () => updatecityy(),
                                child: Text("نعم",
                                    style: TextStyle(color: Colors.blue[100]))),
                          ]);


                          */