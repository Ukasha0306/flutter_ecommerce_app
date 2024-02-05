import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/favourite_controller.dart';
import '../../../../utils/constants/color.dart';
import '../../icons/t_circular_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  final String productId;
  const TFavouriteIcon({
    super.key, required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(()=>  TCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ?TColors.error : null,
      onPressed: ()=>controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}