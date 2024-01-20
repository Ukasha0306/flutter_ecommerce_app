import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  // get all image from product and variation
  List<String> getAllProductImage(ProductModel product) {
    // use set for unique image only
    Set<String> images = {};

    // Load thumbnail Images

    images.add(product.thumbnail);

    // assign Thumbnail as selected images
    selectedProductImage.value = product.thumbnail;

    // Get all images from the product model if not null

    if (product.images != null) {
      images.addAll(product.images!);
    }

    // get all the images form the product variation if not null

    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // show image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text("close"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
