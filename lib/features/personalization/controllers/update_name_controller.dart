
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_ecommerce_app/utils/connectivity/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';

class UpdateNameController extends GetxController {

static UpdateNameController get instance =>Get.find();

final firstName = TextEditingController();
final lastName = TextEditingController();
final userController = UserController.instance;
final userRepository = Get.put(UserRepository());
GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


@override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // fetch user record
  Future<void> initializeNames()async{
  firstName.text = userController.user.value.firstName;
  lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName()async{
  try{
    TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

    final isConnected = await NetworkManager.instance.isConnected();

    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }

    if (updateUserNameFormKey.currentState != null && updateUserNameFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
    }


    //  update user first and last name in firebase firestore

    Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName': lastName.text.trim()};
    await userRepository.updateSingleField(name);

    // update the rx user value
    userController.user.value.firstName = firstName.text.trim();
    userController.user.value.lastName = lastName.text.trim();

    TFullScreenLoader.stopLoading();

    TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');


    Get.off(()=>const ProfileScreen());


  }
  catch (e){
    TFullScreenLoader.stopLoading();
    TLoaders.successSnackBar(title: 'Oh Snap!', message: e.toString());
  }
  }
}