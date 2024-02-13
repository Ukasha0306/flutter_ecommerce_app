import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:get/get.dart';
import '../../../../../common/appBar/app_bar.dart';
import '../../../../../common/widgets/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  final ProductModel product;

  const TProductImageSlider({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=>controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: TColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx((){
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      imageUrl: images[index],
                      isNetworkImage: true,
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      padding: const EdgeInsets.all(TSizes.sm),
                      onPressed: ()=> controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                    );
                  }
                  ),
                ),
              ),
            ),
             TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: product.id,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
