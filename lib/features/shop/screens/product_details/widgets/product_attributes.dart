import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_product_price_text.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [

        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child:  Column(
            children: [
               Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          const ProductTitleText(title: 'Price : ', smallSize: true,),
                          /// Actual price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          const TProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(title: 'Stock : ', smallSize: true,),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
              const ProductTitleText(title: 'This is the description of the products and it can go to max 4 lines.', smallSize: true, maxLine: 4,)

            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            )

          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const TSectionHeading(title: 'Sizes' , showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),

              ],
            ),



          ],
        ),

      ],
    );
  }
}


