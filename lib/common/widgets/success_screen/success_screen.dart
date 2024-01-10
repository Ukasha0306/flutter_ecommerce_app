import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/styles/spacing_style.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subTitle, image;
  final VoidCallback onPressed;

  final bool isLottie;

  const SuccessScreen(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.onPressed,  this.isLottie= false,  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              isLottie ? Lottie.asset(image) :
              Image(
                width: THelperFunctions.screenWidth() * 0.60,
                image: AssetImage(image),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
