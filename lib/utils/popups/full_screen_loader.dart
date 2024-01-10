import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TFullScreenLoader{

  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=>PopScope(child: Container(
          color:  THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              TAnimationLoaderWidget(text: text, animation: animation,)

            ],
          ),
        ),
        ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using the navigator
  }
}