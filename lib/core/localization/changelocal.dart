
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class LocaleController extends GetxController {

  Locale? language ;

  MyServices myServices = Get.find()  ;


  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferences.setString("lang", langcode) ;
    Get.updateLocale(locale) ;
  }


  @override
  void onInit() {

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang") ;
    if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
    }else if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ;
    }
    super.onInit();
  }


}