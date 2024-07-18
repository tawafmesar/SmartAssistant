import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smartassistant/core/constant/imageasset.dart';
import 'package:smartassistant/routes.dart';

import 'bindings/intialbindings.dart';
import 'controller/providers/chats_provider.dart';
import 'controller/providers/models_provider.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (_) => ModelsProvider(),
    ),
    ChangeNotifierProvider(
    create: (_) => ChatProvider(),
    ),
    ],
        child: GetMaterialApp(
      title: 'Smart Assistant',
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "NotoKufiArabic",
        textTheme: const TextTheme(

            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            bodyText1: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
      ),
      initialBinding:initialBindings() ,
      initialRoute: "splash",
      getPages: routes,

    ));
  }
}
