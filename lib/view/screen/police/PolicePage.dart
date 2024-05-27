// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, file_names

import 'package:balag/controller/police/policePage_controller.dart';
import 'package:balag/view/screen/police/detailsNEW.dart';
import 'package:balag/view/screen/police/testAddPalagPolice.dart';
import 'package:balag/view/widget/widgetPolicePage/customFloatButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PolicePage extends StatefulWidget {
  const PolicePage({super.key});

  @override
  State<PolicePage> createState() => _PolicePageState();
}

class _PolicePageState extends State<PolicePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(PolicePageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 17, 68, 155),
        title: const Text(
          "الشرطة",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      floatingActionButton: CustomFloatButton(
        //
        //

        onPressed: () => Get.to(const Test()),
      ),
      body: GetBuilder<PolicePageController>(
        builder: (controller) {
          //return Container(child: const CustomFutureBuilder()

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 50, 97, 177),
                    Color.fromARGB(255, 160, 193, 209),
                    Color.fromARGB(255, 113, 162, 187),
                  ]),
            ),
            child: controller.lottie == true
                ? Center(
                    child: Lottie.asset("assets/lottie/load2.json",
                        width: 200, height: 200))
                : ListView(
                    children: [
                      ...List.generate(
                          controller.datareport.length,
                          (index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                // height: 100,
                                child: Stack(
                                  children: [
                                    Card(
                                      color: Colors.blue[100],
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30),
                                          //bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                        ),
                                        side: BorderSide(
                                            strokeAlign: 2,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            width: 2.0), // تعيين لون الحدود هنا
                                      ),
                                      elevation: 5,
                                      child: ListTile(
                                        title: Container(
                                          //   padding: EdgeInsets.only(left: 18),
                                          child: Text(
                                            controller.datareport[index]
                                                ['policeReport_body'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Color.fromARGB(
                                                    255, 4, 45, 95)),
                                          ),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(255, 4, 45, 95),
                                        ),
                                        onTap: () => Get.to(

                                            ///
                                            /////
                                            () => const TestNew(),
                                            arguments: {
                                              "palagId":
                                                  controller.datareport[index]
                                                      ['policeReport_id']
                                            }),
                                        leading: controller.datareport[index]
                                                    ['policeReport_status'] ==
                                                0
                                            ? const Icon(
                                                Icons.done,
                                                color: Color.fromARGB(
                                                    255, 131, 128, 128),
                                              )
                                            : controller.datareport[index][
                                                        'policeReport_status'] ==
                                                    1
                                                ? const Icon(
                                                    Icons.done_all,
                                                    color: Color.fromARGB(
                                                        255, 131, 128, 128),
                                                  )
                                                : const Icon(
                                                    Icons.done_all,
                                                    color: Color.fromARGB(
                                                        255, 4, 45, 95),
                                                  ),
                                      ),
                                    ),
                                    /* Positioned(
                                      top: 40,
                                      left: 15,
                                      child: controller.datareport[index]
                                                  ['policeReport_status'] ==
                                              0
                                          ? const Icon(
                                              Icons.done,
                                              color: Color.fromARGB(
                                                  255, 131, 128, 128),
                                            )
                                          : controller.datareport[index]
                                                      ['policeReport_status'] ==
                                                  1
                                              ? const Icon(
                                                  Icons.done_all,
                                                  color: Color.fromARGB(
                                                      255, 131, 128, 128),
                                                )
                                              : const Icon(
                                                  Icons.done_all,
                                                  color: Color.fromARGB(
                                                      255, 4, 45, 95),
                                                ),
                                    )*/
                                  ],
                                ),
                              ))
                    ],
                  ),

            /* FutureBuilder(
              future: controller.getReport(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("///////////////////");
                if (snapshot.hasData) {
                  if (snapshot.data['status'] == 'fail') {
                    return Text("no Report");
                  }
                  print("*********");
                  return ListView.builder(
                    itemCount: snapshot.data["data"].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomCardPolicePage(
                        delete: () async {
                          print("---------delete");
                          /* var respons = await crud.postRequesrt(linkDelete, {
                            "note_id":
                                "${snapshot.data['data'][index]['note_id']}",
                            "imagename":
                                "${snapshot.data['data'][index]['note_image']}"
                          });
                          if (respons["status"] == "sucsses") {
                            setState(() {});
                          }*/
                        },
                        edit: () {
                          print("---------edit");
                          /*  print("----");
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return UpdatePalagPolice(
                                  im: "${snapshot.data['data'][index]['policeReport_image']}",
                                  id: "${snapshot.data['data'][index]['policeReport_id ']}",
                                  body:
                                      "${snapshot.data['data'][index]['policeReport_body']}",
                                  /*  content:
                                    "${snapshot.data['data'][index]['note_content']}",*/
                                );
                              },
                            ));*/
                        },
                        reportmodel:
                            Report.fromJson(snapshot.data['data'][index]),
                        // ontap: () {},
                      );
                    },
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: Text("Loading ...."));
              },
            ),*/
          );
        },
      ),
    );
  }
}
