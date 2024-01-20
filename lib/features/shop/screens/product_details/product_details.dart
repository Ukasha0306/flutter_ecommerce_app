import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/product_details_image_slider.dart';
import 'widgets/rating_and_share.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             TProductImageSlider(product: product,),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TRatingAndShare(),
                   TProductMetaData(product: product,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product,),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwItems,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                   ReadMoreText(
                     product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const TSectionHeading(title: 'Reviews(199)', showActionButton: false,),
                    IconButton(onPressed: ()=>Get.to(()=>const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18,))
                   ],
                 )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
