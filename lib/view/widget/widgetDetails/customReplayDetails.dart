// ignore_for_file: file_names

/*import 'package:balag/controller/details_controller.dart';
import 'package:balag/core/model/replay_model.dart';
import 'package:balag/view/widget/widgetDetails/customCardReplay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomReplayDetails extends StatelessWidget {
  final String replay;
  const CustomReplayDetails({super.key, required this.replay});

  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 70,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border:
            Border.all(color: const Color.fromARGB(255, 45, 4, 95), width: 2),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
          topLeft: Radius.circular(35),
          //topRight: Radius.circular(35),
        ),
      ),
      /*child: Text(
          //"${reportmodel.policeReportLocation}",
          replay,
          style: const TextStyle(
              fontSize: 22, color: Color.fromARGB(255, 45, 4, 95)),
        )*/
      child: FutureBuilder(
        future: controller.getReplay(),
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
                return CustomCardReplay(
                  replayModel:
                      ReplayModel.fromJson(snapshot.data['data'][index]),
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
      ),
    );
  }
}
*/