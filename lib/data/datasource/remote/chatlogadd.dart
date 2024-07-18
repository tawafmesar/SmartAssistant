

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddchatlogData {
  Crud crud;
  AddchatlogData(this.crud);
  postdata(String chatlog_prompt ,String chatlog_response ,String chatlog_model ,String chatlog_user ) async {
    var response = await crud.postData(AppLink.addchat, {
      "chatlog_prompt" : chatlog_prompt ,
      "chatlog_response" : chatlog_response  ,
      "chatlog_model" : chatlog_model  ,
      "chatlog_user" : chatlog_user ,
    });
    return response.fold((l) => l, (r) => r);
  }

}