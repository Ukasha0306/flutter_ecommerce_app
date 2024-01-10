
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/forget/reset_password_screen.dart';
import 'package:flutter_ecommerce_app/utils/connectivity/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class ForgetPasswordController extends GetxController {

  static ForgetPasswordController get instance => Get.find();
  final email = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  sendPasswordResetEmail()async{
    try{
       TFullScreenLoader.openLoadingDialog('Processing your Request...', TImages.docerAnimation);

       final isConnected = await NetworkManager.instance.isConnected();

       if(!isConnected){
         TFullScreenLoader.stopLoading();
         return;
       }

       if(!forgetPasswordFormKey.currentState!.validate()){
         TFullScreenLoader.stopLoading();
         return;
       }

       await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

       TFullScreenLoader.stopLoading();

       TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your password'.tr);

       Get.to(()=> ResetPasswordScreen(email: email.text.trim(),));


    }
    catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


  resendPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your Request...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your password'.tr);




    }
    catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


}