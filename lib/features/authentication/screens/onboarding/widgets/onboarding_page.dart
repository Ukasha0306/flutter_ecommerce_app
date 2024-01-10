import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitle;
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            height: THelperFunctions.screenHeight()*0.60,
            width: THelperFunctions.screenWidth()*0.80,
            image: AssetImage(image,),),
          Text(title, style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium,),


        ],
      ),
    );
  }
}