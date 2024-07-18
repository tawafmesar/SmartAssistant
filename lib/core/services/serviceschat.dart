import 'package:flutter/material.dart';
import 'package:smartassistant/core/constant/color.dart';

import '../../view/widget/chat/drop_down.dart';
import '../../view/widget/chat/text_widget.dart';



class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: AppColor.scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model:",
                    fontSize: 16,
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: ModelsDrowDownWidget()),
              ],
            ),
          );
        });
  }
}
