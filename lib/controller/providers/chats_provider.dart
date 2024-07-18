import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/services/api_service.dart';
import '../../core/services/services.dart';
import '../../data/models/chat_model.dart';



class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }


  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  // void addUserMessage({required String msg}) {
  //   chatList.add(ChatModel(msg: msg, chatIndex: 0));
  //   notifyListeners();
  // }

  Future<void> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
    MyServices myServices = Get.find(); // Obtain the MyServices instance
    String userId = myServices.sharedPreferences.getString("id") ?? "";

    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
        userId: userId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}


