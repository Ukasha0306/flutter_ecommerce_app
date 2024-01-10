import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_ecommerce_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
