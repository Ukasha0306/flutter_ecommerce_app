import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/product_details_image_slider.dart';
import 'widgets/rating_and_share.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TRatingAndShare(),
                  const TProductMetaData(),
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
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
                  const ReadMoreText(
                      'A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
