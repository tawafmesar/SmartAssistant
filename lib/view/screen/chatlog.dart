import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartassistant/core/class/handlingdataview.dart';

import '../../controller/chatlog_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/services/assets_manager.dart';
import '../widget/chat/text_widget.dart';

class ChatLogScreen extends StatelessWidget {
  const ChatLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatLogControllerImp());
    final contrller = Get.put(ChatLogControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.splsh,

        elevation: 6,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppImageAsset.openaiLogo),
        ),
        title: const Text("Smart Assistant",style: TextStyle(color: AppColor.primaryColor),),
        actions: [
          IconButton(
            onPressed: () async {
              contrller.buttumupdate();
            },
            icon: const FaIcon(FontAwesomeIcons.arrowsRotate, color: AppColor.primaryColor),
          ),
        ],
      ),
      body: GetBuilder<ChatLogControllerImp>(builder: ((controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
          children: [
          ...List.generate(
          controller.chatlogdata.length,
                  (index) => Container(
          margin: const EdgeInsets.all(10), // Add margin as needed
      child: Material(
        elevation: 10,
        shape:const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColor.primaryColor, // Border color
            width: 3.0, // Border width
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25)), // Border radius
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(25)),
              color: AppColor.scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsManager.userImage,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                     Expanded(
                      child: Text(
                        "${controller.chatlogdata[index].chatlogPrompt}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Material(
              color: AppColor.cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsManager.botImage,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                     Expanded(
                      child: TextWidget(label: "${controller.chatlogdata[index].chatlogResponse}"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration:const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(25))
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 30,
                        child:  Center(
                          child: Text('${controller.chatlogdata[index].chatlogModel} :',style: TextStyle(color: AppColor.scaffoldBackgroundColor),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(

                        height: 30,
                        child:const Center(
                          child: Icon(
                            FontAwesomeIcons.bots,
                            color: AppColor.scaffoldBackgroundColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        child:  Center(
                          child: Text('${controller.chatlogdata[index].chatlogDate}',style: TextStyle(color: AppColor.scaffoldBackgroundColor),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 30,
                        child:const Center(
                          child: Icon(
                            FontAwesomeIcons.calendar,
                            color: AppColor.scaffoldBackgroundColor,
                          ),
                        ),
                      )
                    ],
                  )
                  ,
                ],
              ),
            )
          ],
        ),
      ),
      )
          )
        ],
      ))),),
    );
  }
}
