
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  final CategoryModel category;
  const TCategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowCase(images: [
                TImages.productImage3, TImages.productImage2, TImages.productImage1,
              ]),
              const TBrandShowCase(images: [
                TImages.productImage3, TImages.productImage2, TImages.productImage1
              ]),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TSectionHeading(title: 'You might Like', onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index)=> TProductCardVertical(product: ProductModel.empty()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
            ],
          ),
        ),
      ],
    );
  }
}
