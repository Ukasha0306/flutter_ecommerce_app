
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'change', onPressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            TRoundedContainer(
              height: 35,
              width: 65,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.light : TColors.white,
              child: const Image(image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
                
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge,)
            
          ],
        )

      ],
    );
  }
}
