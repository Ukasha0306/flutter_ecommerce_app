

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  final ProductModel product;
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        // if the product have variation then show product details for variation
        // Else  add product to cart
        if(product.productType==ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }
        else{
          Get.to(()=>ProductDetailsScreen(product: product));
        }
      },
      child: Obx((){
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration:  BoxDecoration(
            color: productQuantityInCart > 0 ? TColors.primary :TColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            height: TSizes.iconLg * 1.2,
            width: TSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0 ?
              Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),)
                  :const Icon(Iconsax.add, color: TColors.white,
              ),
            ),
          ),
        );
      }

      ),
    );
  }
}