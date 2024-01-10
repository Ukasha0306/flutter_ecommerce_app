import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:flutter_ecommerce_app/features/authentication/models/user_model.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:flutter_ecommerce_app/utils/connectivity/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (kDebugMode) {
        print("Is Connected: $isConnected");
      }
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

      if (signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

      }


      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accepts Privacy Policy',
            message: 'In order to create the account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      Get.to(()=> const VerifyEmailScreen());





    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
