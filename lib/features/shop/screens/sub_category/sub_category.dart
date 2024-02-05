import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/rounded_images.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;

  const SubCategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  imageUrl: TImages.banner3,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FutureBuilder(
                future: controller.getSubCategory(category.id),
                builder: (context, snapshot) {
                  const loader = THorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultipleRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getProductsForCategory(
                            categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          final widget =
                              TCloudHelperFunctions.checkMultipleRecordState(
                                  snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          final products = snapshot.data!;
                          return Column(
                            children: [
                              TSectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                  () => AllProducts(
                                    title: subCategory.name,
                                    futureMethod:
                                        controller.getProductsForCategory(
                                            categoryId: subCategory.id,
                                            limit: -1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems / 2,
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    separatorBuilder: (_, __) => const SizedBox(
                                          width: TSizes.spaceBtwItems,
                                        ),
                                    itemBuilder: (_, index) =>
                                        TProductCardHorizontal(product: products[index])),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
