import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/t_product_price_text.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TProductMetaData extends StatelessWidget {
  final ProductModel product;
  const TProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                "$salePercentage%",
                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
            const SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: controller.getProductPrice(product), isLarge: true,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
         ProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

     Row(
       children: [
         const ProductTitleText(title: 'Status'),
         const SizedBox(width: TSizes.spaceBtwItems),
         Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),


       ],
     ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        Row(
          children: [
            TCircularImage(image: product.brand != null ? product.brand!.image : '', width: 32, height: 32, overLayColor: dark ? TColors.white : TColors.black,),
            const SizedBox(width: TSizes.sm,),
            TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSizes: TextSizes.medium,),
          ],
        ),

      ],
    );
  }
}
