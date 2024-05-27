import 'package:balag/core/model/replay_model.dart';

import 'package:flutter/material.dart';

class CustomCardReplay extends StatelessWidget {
  //final void Function()? ontap;
  //final String title;
  // final String content;
  final ReplayModel replayModel;
  //final void Function()? edit;
  //final void Function()? delete;
  const CustomCardReplay({
    super.key,
    //  this.ontap,
    // required this.title,
    // required this.content,

    required this.replayModel,
    //required this.edit,
    //required this.delete
  });

  @override
  Widget build(BuildContext context) {
    //var link = linkApi.linkImage;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 100,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border:
            Border.all(color: const Color.fromARGB(255, 45, 4, 95), width: 2),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
          //topRight: Radius.circular(35),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "${replayModel.policereplayText}",
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 45, 4, 95)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "${replayModel.policereplayTime}",
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 45, 4, 95)),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
