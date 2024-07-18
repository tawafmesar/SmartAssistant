

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ViewChatLogData {
  Crud crud;
  ViewChatLogData(this.crud);
  Getdata(String id) async {
    var response = await crud.postData(AppLink.viewchat, {
      "id" : id ,
    });
    return response.fold((l) => l, (r) => r);
  }
}