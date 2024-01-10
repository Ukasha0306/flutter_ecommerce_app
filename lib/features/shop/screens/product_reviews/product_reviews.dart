import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import '../../../../common/widgets/products/rating/rating_bar_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/overall_product_rating.dart';
import 'widgets/user_review_card.dart';


class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from the people who use the same type of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5,),
              Text('12,621', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              const UserReviewCard(),

            ],
          ),
        ),

      ),
    );
  }
}






