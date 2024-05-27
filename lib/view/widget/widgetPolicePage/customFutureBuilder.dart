// ignore_for_file: avoid_print, file_names
/*
import 'package:balag/controller/policePage_controller.dart';
import 'package:balag/core/model/report_model.dart';
import 'package:balag/view/widget/widgetPolicePage/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    PolicePageController controller = Get.put(PolicePageController());
    return FutureBuilder(
        future: controller.getReport(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['status'] == 'fail') {
              return Text("no Report");
            }
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
                  reportmodel: Report.fromJson(snapshot.data['data'][index]),
                  ontap: () {
                    controller.palagId =
                        snapshot.data['data'][index]['policeReport_id'];
                    print("------ontap");
                    controller.goToDetails();
                  },
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text("Loading ...."));
        });
  }
}
*/