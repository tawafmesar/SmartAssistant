import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartassistant/data/datasource/remote/chatlogview.dart';
import 'package:smartassistant/data/models/chatlog_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
abstract class ChatLogController extends GetxController {



}

class ChatLogControllerImp extends ChatLogController {

  ViewChatLogData viewChatLogData = ViewChatLogData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  List<chatlogmodel> chatlogdata = [];

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;



  @override
  void onInit() {
    getData();
    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }





  getData() async {

    statusRequest = StatusRequest.loading;
    var response = await viewChatLogData
        .Getdata(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        //chatlogdata.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        chatlogdata.addAll(responsedata.map((e) => chatlogmodel.fromJson(e)));



        print("chatlogdata :.");
        print(chatlogdata);



        // for (String timeString in alarmdataa) {
        //   // Split the time string into hours and minutes
        //   List<String> parts = timeString.split(' ');
        //   List<String> timeParts = parts[0].split(':');
        //   int hour = int.parse(timeParts[0]);
        //   int minute = int.parse(timeParts[1]);
        //
        //   // Adjust the hour for PM
        //   if (parts[1] == 'PM' && hour < 12) {
        //     hour += 12;
        //   }
        //
        //   // Create a TimeOfDay object and add it to the list
        //   TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);
        //   timeOfDayList.add(timeOfDay);
        // }
        //
        // print("alarmdataa is  after updatelike : ...................");
        // print(timeOfDayList);


      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  buttumupdate()  {
    getData();
    update();

  }


}