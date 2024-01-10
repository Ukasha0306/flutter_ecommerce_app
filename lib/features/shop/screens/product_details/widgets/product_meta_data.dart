import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_product_price_text.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              backgroundColor: TColors.secondary.withOpacity(0.8),
              child: Text(
                "25%",
                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSizes.spaceBtwItems,),
            const TProductPriceText(price: '175', isLarge: true,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        const ProductTitleText(title: 'Green Nike Sport Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

     Row(
       children: [
         const ProductTitleText(title: 'Status'),
         const SizedBox(width: TSizes.spaceBtwItems),
         Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),


       ],
     ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        Row(
          children: [
            TCircularImage(image: TImages.shoeIcon, width: 32, height: 32, overLayColor: dark ? TColors.white : TColors.black,),
            const SizedBox(width: TSizes.sm,),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium,),
          ],
        ),

      ],
    );
  }
}
