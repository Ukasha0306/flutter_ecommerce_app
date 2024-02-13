
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_product_price_text.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  final ProductModel product;

  const TProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = VariationController.instance;
    return Obx(()=>
      Column(
        children: [

          // display variation price and stock when some variation is selected
           if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              /// Actual price
                               if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                '\$${controller.selectedVariation.value.price}',
                                style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems,),
                               // sale price
                               TProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                   ProductTitleText(
                    title:controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLine: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                            title: attribute.name ?? '', showActionButton: false),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Obx(()=> Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                              final available = controller.getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                              return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product,
                                              attribute.name ?? '', attributeValue);
                                        }

                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
