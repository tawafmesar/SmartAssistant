
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smartassistant/view/widget/chat/text_widget.dart';

import '../../../controller/providers/models_provider.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/api_service.dart';
import '../../../data/models/models_model.dart';



class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({super.key});

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends State<ModelsDrowDownWidget> {
  String currentModel="text-davinci-003";

  bool isFirstLoading = true;
  @override
  Widget build(BuildContext context) {
   final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;

    return FutureBuilder<List<ModelsModel>>(
        future: ApiService.getModels(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            print("API Response: ${snapshot.data}");
          }
          if (snapshot.connectionState == ConnectionState.waiting &&
              isFirstLoading == true) {
            isFirstLoading = false;
            return const FittedBox(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 30,
              ),
            );
          }

        if (snapshot.hasError) {
          return Center(
            child: TextWidget(label: snapshot.error.toString()),
          );
        }

        return snapshot.data == null || snapshot.data!.isEmpty

            ? const SizedBox.shrink()
            : DropdownButton(
              dropdownColor: AppColor.scaffoldBackgroundColor,
              iconEnabledColor: Colors.white,
              items: List<DropdownMenuItem<String>>.generate(
                  snapshot.data!.length,
                      (index) => DropdownMenuItem(
                      value: snapshot.data![index].id,
                      child: TextWidget(
                        label: snapshot.data![index].id,
                        fontSize: 15,
                      ))
              ),
              value: currentModel,
              onChanged: (value) {
                setState(() {
                  currentModel = value.toString();
                });

                modelsProvider.setCurrentModel(
                  value.toString(),
                );



              },
            )

        ;

    });
  }
}

// List<DropdownMenuItem<String>>.generate(
// models.length,
// (index) => DropdownMenuItem(
// value: models[index],
// child: TextWidget(
// label: models[index],
// fontSize: 15,
// )));


// DropdownButton(
// dropdownColor: scaffoldBackgroundColor,
// iconEnabledColor: Colors.white,
// items: getModelsItem,
// value: currentModel,
// onChanged: (value) {
// setState(() {
// currentModel = value.toString();
//
// });
// },
// );