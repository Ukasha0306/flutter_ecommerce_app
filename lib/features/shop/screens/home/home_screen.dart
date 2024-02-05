import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/home/widgets/home_category.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_ecommerce_app/utils/constants/color.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: "Popular Categories",
                          textColor: TColors.white,
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        THomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(title: "Popular Products", onPressed: ()=>Get.to(()=> AllProducts(
                    title: 'Popular Products',
                    futureMethod: controller.fetchAllFeaturedProducts(),
                  ))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();
                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.headlineMedium,),);
                    }
                    return  TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return
                          TProductCardVertical(
                            product: controller.featuredProducts[index],);

                      });
                  })

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
