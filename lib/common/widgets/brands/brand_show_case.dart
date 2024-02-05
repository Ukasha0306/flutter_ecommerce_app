import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter_ecommerce_app/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:get/get.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';
import '../custom_shapes/containers/rounded_container.dart';

class TBrandShowCase extends StatelessWidget {
  final List<String> images;
  final BrandModel brand;

  const TBrandShowCase({
    super.key,
    required this.images, required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
             TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url , downloadProgress)=>const TShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error)=> const Icon(Icons.error),
        )
      ),
    );
  }
}
