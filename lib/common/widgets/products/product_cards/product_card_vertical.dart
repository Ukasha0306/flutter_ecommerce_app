import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/styles/shadows.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';
import '../../texts/t_product_price_text.dart';
import '../cart/add_to_cart_button.dart';
import '../favourite_icon/favourite_icon.dart';

class TProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const TProductCardVertical({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=> ProductDetailsScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                   Center(
                     child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                       isNetworkImage: true,
                                       ),
                   ),
                  if(salePercentage != null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      child: Text('$salePercentage%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),
                   Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems /2,),
              Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),

                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Flexible(
                   child: Column(
                     children: [
                       if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                         Padding(
                           padding: const EdgeInsets.only(left: TSizes.sm),
                           child: Text(product.price.toString(),
                             style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),),
                       // price show sale price as main price if sale exist
                       Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: controller.getProductPrice(product),),
                                       ),
                     ],
                   ),
                 ),
                 ProductCardAddToCartButton(product: product,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








