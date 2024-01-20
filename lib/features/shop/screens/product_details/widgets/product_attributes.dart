import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_product_price_text.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  final ProductModel product;
  const TProductAttributes({super.key, required this.product});

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
          children: product.productAttributes!.map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TSectionHeading(title: attribute.name ?? '', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              Wrap(
                spacing: 8,
                children: attribute.values!.map((value) =>
                    TChoiceChip(text:value, selected: false, onSelected: (value){},),).toList(),
              ),
            ],
          )).toList(),
        ),

      ],
    );
  }
}


