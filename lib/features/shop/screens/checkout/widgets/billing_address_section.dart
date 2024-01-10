import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'change', onPressed: (){},),
        Text('Ukasha Anwar', style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone, color: TColors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('+92-606-8269138', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: TColors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('South Lane , Maine 87859, USA', style: Theme.of(context).textTheme.bodyMedium,)),
          ],
        ),

      ],
    );
  }
}
