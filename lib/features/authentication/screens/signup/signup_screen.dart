import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../common/appBar/app_bar.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TAppBar(showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SignupForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
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
