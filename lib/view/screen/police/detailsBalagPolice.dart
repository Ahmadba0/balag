/*import 'package:balag/controller/details_controller.dart';
import 'package:balag/core/model/report_model.dart';
import 'package:balag/view/widget/widgetDetails/customListDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DetailsBalagPolice extends StatefulWidget {
  const DetailsBalagPolice({super.key});

  @override
  State<DetailsBalagPolice> createState() => _DetailsBalagPoliceState();
}

class _DetailsBalagPoliceState extends State<DetailsBalagPolice> {
  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الشرطة",
          style: TextStyle(
              color: Color.fromARGB(255, 4, 54, 95),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ///
            ///
            ///
            FutureBuilder(
              future: controller.getReportDeatils(),
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
                      return controller.isloading == true
                          ? Lottie.asset("assets/lottie/load1")
                          : CustomListDetails(
                              reportmodel:
                                  Report.fromJson(snapshot.data['data'][index]),
                            );
                    },
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(child: Lottie.asset("assets/lottie/load1"));
              },

              ///
              ///
              ///
              ///
            ),
          ],
        ),
      ),
    );
  }
}
*/