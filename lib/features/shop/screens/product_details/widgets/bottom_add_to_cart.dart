import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  final ProductModel product;
  const TBottomAddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Obx(()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               TCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.darkGrey,
                onPressed: ()=> controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -=1,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
               TCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.black,
                onPressed:()=> controller.productQuantityInCart.value += 1,
              ),
            ],
          ),
  
          ElevatedButton(
            onPressed: () => controller.addToCart(product),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),)

    );
  }
}
//