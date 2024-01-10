import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick (index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage(){
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      if (kDebugMode) {
        print('========================= Get Storage Next Button ===============================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);
      if (kDebugMode) {
        print(
            '========================= Get Storage Next Button ===============================');
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(()=>const LoginScreen());
    }
    else{
      int page = currentPageIndex.value +1 ;
      pageController.jumpToPage(page);
    }

  }

  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }



}